CREATE TYPE service_type AS ENUM (
    'regular', -- Регулярная уборка
    'general', -- Генеральная уборка
    'after_repair', -- Уборка после ремонта
    'window_cleaning', -- Мойка окон
    'carpet_cleaning', -- Химчистка ковров
    'furniture_cleaning', -- Химчистка мебели
    'disinfection' -- Дезинфекция помещений
    );
