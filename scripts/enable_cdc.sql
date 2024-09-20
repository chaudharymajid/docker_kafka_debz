-- Enable CDC for the sakila database
USE sakila;
GO

EXEC sys.sp_cdc_enable_db;
GO

-- Enable CDC for the actor table
EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'actor',
    @role_name = NULL,
    @supports_net_changes = 1;
GO

-- Enable CDC for the film table
EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'category',
    @role_name = NULL,
    @supports_net_changes = 1;
GO

-- Enable CDC for the customer table
EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'language',
    @role_name = NULL,
    @supports_net_changes = 1;
GO