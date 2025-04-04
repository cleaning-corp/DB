#!/bin/bash

# Настройки
INIT_FILE="init.sql"
SCHEMA_DIR="schemas"
TEMP_DIR=".tmp"

echo "🚀 Начинаю генерацию $INIT_FILE..."

# Создаём временную директорию
mkdir -p $TEMP_DIR

# 1. Собираем все ENUM типы
{
    echo "-- ===== ENUM ТИПЫ ====="
    find $SCHEMA_DIR -name "enum.sql" -type f -exec cat {} \;
    echo ""
} > $TEMP_DIR/00_enums.sql

# 2. Собираем таблицы
{
    echo "-- ===== ТАБЛИЦЫ ====="
    find $SCHEMA_DIR -name "table.sql" -not -path "*salary_distribution*" -type f -exec cat {} \;
    echo ""
} > $TEMP_DIR/01_tables.sql

# 3. Собираем начальные данные
{
    echo "-- ===== НАЧАЛЬНЫЕ ДАННЫЕ ====="
    find $SCHEMA_DIR -name "seed.sql" -type f -exec cat {} \;
    echo ""
} > $TEMP_DIR/02_seeds.sql

# 4. Собираем таблицы с зависимостями
{
    echo "-- ===== ТАБЛИЦЫ С ЗАВИСИМОСТЯМИ ====="
    find $SCHEMA_DIR -path "*salary_distribution*" -name "table.sql" -type f -exec cat {} \;
    echo ""
} > $TEMP_DIR/03_dependent_tables.sql

# 5. Собираем функции
{
    echo "-- ===== ФУНКЦИИ ====="
    find $SCHEMA_DIR -name "function.sql" -type f -exec cat {} \;
    echo ""
} > $TEMP_DIR/04_functions.sql

# 6. Собираем триггеры
{
    echo "-- ===== ТРИГГЕРЫ ====="
    find $SCHEMA_DIR -name "trigger.sql" -type f -exec cat {} \;
    echo ""
} > $TEMP_DIR/05_triggers.sql

# Собираем итоговый файл
{
    echo "-- 🚀 Автоматически сгенерированный init.sql"
    echo "-- ⚠️ Не редактировать вручную! Генерируется скриптом"
    echo ""
    echo "BEGIN;"
    echo ""
    cat $TEMP_DIR/00_enums.sql
    cat $TEMP_DIR/01_tables.sql
    cat $TEMP_DIR/02_seeds.sql
    cat $TEMP_DIR/03_dependent_tables.sql
    cat $TEMP_DIR/04_functions.sql
    cat $TEMP_DIR/05_triggers.sql
    echo ""
    echo "COMMIT;"
    echo ""
    echo "-- ✅ Сгенерировано $(date +'%Y-%m-%d %H:%M:%S')"
} > $INIT_FILE

# Удаляем временные файлы
rm -rf $TEMP_DIR

echo "✅ Генерация $INIT_FILE завершена!"
echo "ℹ️ Порядок выполнения:"
echo "  1. ENUM типы"
echo "  2. Основные таблицы"
echo "  3. Начальные данные"
echo "  4. Таблицы с зависимостями"
echo "  5. Функции"
echo "  6. Триггеры"
