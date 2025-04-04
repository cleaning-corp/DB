CREATE OR REPLACE FUNCTION trigger_distribute_order_salary()
    RETURNS TRIGGER AS
$$
BEGIN
    PERFORM distribute_order_salary(NEW.order_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER order_salary_distribution_trigger
    AFTER INSERT OR UPDATE OF price, employee_id
    ON orders
    FOR EACH ROW
EXECUTE FUNCTION trigger_distribute_order_salary();
