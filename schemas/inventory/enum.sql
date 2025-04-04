CREATE TYPE inventory_category AS ENUM (
  'cleaning_equipment', -- Оборудование (пылесосы, швабры)
  'consumables', -- Расходники (моющие средства)
  'tools', -- Инструменты (скребки, щетки)
  'protective_gear', -- СИЗ (перчатки, маски)
  'other'
  );
CREATE TYPE unit_type AS ENUM ( 'piece', -- шт
  'liter', -- л
  'kilogram', -- кг
  'meter', -- м
  'pack', -- упаковка
  'pair', -- пара
  'set', -- набор
  'bottle', -- бутылка
  'canister', -- канистра
  'box' -- коробка
  );
