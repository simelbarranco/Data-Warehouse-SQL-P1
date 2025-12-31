/*

==========================================================
Create and initialize the DataWarehouse database
==========================================================

Script Purpose:
This script creates a new SQL Server database named 'DataWarehouse' and initializes it with three schemas:
- bronze: For raw data ingestion
- silver: For cleaned and transformed data
- gold: For aggregated and business-level data

WARNING:
Running this script will drop the existing 'DataWarehouse' database if it exists, 
resulting in loss of all data contained within it.
Please ensure that you have backed up any important data before 
executing this script. Proceed with caution.

 */
USE Master;

GO;

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (
    SELECT
        name
    FROM
        sys.databases
    WHERE
        name = 'DataWarehouse'
) BEGIN
ALTER DATABASE DataWarehouse
SET
    SINGLE_USER
WITH
    ROLLBACK IMMEDIATE;

DROP DATABASE DataWarehouse;

END;

GO
-- Create the 'DataWarehouse' database and necessary schemas
CREATE DATABASE DataWarehouse;

GO USE DataWarehouse;

GO
-- Create schemas for different data layers
CREATE SCHEMA bronze;

GO CREATE SCHEMA silver;

GO CREATE SCHEMA gold;

GO