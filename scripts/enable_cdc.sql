-- Enable CDC for the database
USE AdventureWorks2019;
EXEC sys.sp_cdc_enable_db;

-- Enable CDC for all tables in the Purchasing schema
DECLARE @schema_name NVARCHAR(128) = N'Purchasing';
DECLARE @table_name NVARCHAR(128);
DECLARE @sql NVARCHAR(MAX);

DECLARE table_cursor CURSOR FOR
SELECT [name]
FROM sys.tables
WHERE [schema_id] = SCHEMA_ID(@schema_name);

OPEN table_cursor;

FETCH NEXT FROM table_cursor INTO @table_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = N'EXEC sys.sp_cdc_enable_table @source_schema = N''' + @schema_name + ''', @source_name = N''' + @table_name + ''', @role_name = NULL;';
    EXEC sp_executesql @sql;
    FETCH NEXT FROM table_cursor INTO @table_name;
END

CLOSE table_cursor;
DEALLOCATE table_cursor;

-- Enable CDC for all tables in the Sales schema
SET @schema_name = N'Sales';

DECLARE table_cursor CURSOR FOR
SELECT [name]
FROM sys.tables
WHERE [schema_id] = SCHEMA_ID(@schema_name);

OPEN table_cursor;

FETCH NEXT FROM table_cursor INTO @table_name;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql = N'EXEC sys.sp_cdc_enable_table @source_schema = N''' + @schema_name + ''', @source_name = N''' + @table_name + ''', @role_name = NULL;';
    EXEC sp_executesql @sql;
    FETCH NEXT FROM table_cursor INTO @table_name;
END

CLOSE table_cursor;
DEALLOCATE table_cursor;