
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

	PRINT('===========================');
	PRINT('Loading Bronze Layer');
	PRINT('===========================');

	-- Loading Data in Bulk

	--================== CRM Tables ==================--

	PRINT('---------------------------');
	PRINT('Loading CRM Tables');
	PRINT('---------------------------');

	-- Customer Information Table --

	PRINT('>> Truncating Table: bronze.crm_cust_info');
	TRUNCATE TABLE bronze.crm_cust_info;

	PRINT('>> Inserting Data Into: bronze.crm_cust_info');
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\emilc\OneDrive\Desktop\Data-Warehouse-SQL-P1\datasets\source_crm\cust_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	-- Product Information Table --
	PRINT('>> Truncating Table: bronze.crm_prd_info');
	TRUNCATE TABLE bronze.crm_prd_info;

	PRINT('>> Inserting Data Into: bronze.crm_prd_info');
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\emilc\OneDrive\Desktop\Data-Warehouse-SQL-P1\datasets\source_crm\prd_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	-- Sales Information Table --

	PRINT('>> Truncating Table: bronze.crm_sales_details');
	TRUNCATE TABLE bronze.crm_sales_details;

	PRINT('>> Inserting Data Into: bronze.crm_sales_details');
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\emilc\OneDrive\Desktop\Data-Warehouse-SQL-P1\datasets\source_crm\sales_details.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	--================== ERP Tables ==================--

	PRINT('---------------------------')
	PRINT('Loading ERP Tables')
	PRINT('---------------------------')

	-- Customer Information Table --

	PRINT('>> Truncating Table: bronze.erp_cust_az12');
	TRUNCATE TABLE bronze.erp_cust_az12;

	PRINT('>> Inserting Data Into: bronze.erp_cust_az12');
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\emilc\OneDrive\Desktop\Data-Warehouse-SQL-P1\datasets\source_erp\cust_az12.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	-- Location Information Table --
	PRINT('>> Truncating Table: bronze.erp_loc_a101');
	TRUNCATE TABLE bronze.erp_loc_a101;

	PRINT('>> Inserting Data Into: bronze.erp_loc_a101');
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\emilc\OneDrive\Desktop\Data-Warehouse-SQL-P1\datasets\source_erp\loc_a101.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	-- Product Category Info Table --
	PRINT('>> Truncating Table: bronze.erp_px_cat_g1v2');
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;

	PRINT('>> Inserting Data Into: bronze.erp_px_cat_g1v2');
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\emilc\OneDrive\Desktop\Data-Warehouse-SQL-P1\datasets\source_erp\px_cat_g1v2.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
END;