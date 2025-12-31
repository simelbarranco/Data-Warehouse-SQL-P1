-- Data Quality Checks --
Use DataWarehouse;

-- Checks for Nulls or Duplicates in Primary Key --
-- Expectation: No Results

-- Finding Duplicate Values --

SELECT
    cst_id,
    COUNT(*)
FROM
    bronze.crm_cust_info
GROUP BY
    cst_id
HAVING
    COUNT(*) > 1
    OR cst_id IS NULL

-- Checking for Unwanted Spaces --

-- If original value i not equal to same value after trimming, 
-- there are unwanted spaces.

SELECT
    cst_firstname
FROM
    bronze.crm_cust_info
WHERE
    cst_firstname != TRIM(cst_firstname)
SELECT
    cst_gndr
FROM
    bronze.crm_cust_info
WHERE
    cst_gndr != TRIM(cst_gndr)


-- Data Standardization & Consistency --

-- Instead of having abbreviations, we're changing to 
-- the exact category. We need to check for for cardinality
-- and map the values accordingly ('Male' or 'Female', etc.)
-- Values are M, F, and Null >> Male, Female, N/A

SELECT DISTINCT
    cst_gndr
FROM
    bronze.crm_cust_info
    -- Values are S, M, and Null >> Single, Married, N/A
SELECT DISTINCT
    cst_marital_status
FROM
    bronze.crm_cust_info