-- Функция распределения зарплаты по заказу
CREATE OR REPLACE FUNCTION distribute_order_salary(input_order_id INTEGER)
    RETURNS VOID AS
$$
DECLARE
    v_order_price            DECIMAL(8, 2);
    v_main_employee_id       INTEGER;
    v_main_employee_position position_type;
BEGIN
    -- Получаем данные заказа
    SELECT price, employee_id
    INTO v_order_price, v_main_employee_id
    FROM orders
    WHERE order_id = input_order_id;

    -- Получаем должность исполнителя
    SELECT position
    INTO v_main_employee_position
    FROM employees
    WHERE employee_id = v_main_employee_id;

    -- Удаляем предыдущее распределение (если есть)
    DELETE FROM order_salary_distribution WHERE order_id = input_order_id;

    -- Добавляем запись для исполнителя
    INSERT INTO order_salary_distribution (order_id,
                                           employee_id,
                                           amount,
                                           percentage,
                                           position)
    SELECT input_order_id,
           v_main_employee_id,
           v_order_price * (pp.percentage / 100),
           pp.percentage,
           v_main_employee_position
    FROM position_percentages pp
    WHERE pp.position = v_main_employee_position;

    -- Добавляем записи для менеджера и администратора
    INSERT INTO order_salary_distribution (order_id,
                                           employee_id,
                                           amount,
                                           percentage,
                                           position)
    SELECT input_order_id,
           e.employee_id,
           v_order_price * (pp.percentage / 100),
           pp.percentage,
           e.position
    FROM employees e
             JOIN position_percentages pp ON e.position = pp.position
    WHERE e.position IN ('manager', 'admin')
      AND e.is_active = TRUE;
END;
$$ LANGUAGE plpgsql;
