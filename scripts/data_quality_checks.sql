-- Data Quality Checks --
Use DataWarehouse;


/* ============================================ */
/* ============== Customers Table ============= */
/* ============================================ */

-- Checks for Nulls or Duplicates in Primary Key --
-- Expectation: No Results

-- Finding Duplicate Values --

SELECT
    cst_id,
    COUNT(*)
FROM
    silver.crm_cust_info
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
    silver.crm_cust_info
WHERE
    cst_firstname != TRIM(cst_firstname)
SELECT
    cst_gndr
FROM
    silver.crm_cust_info
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
    silver.crm_cust_info
    -- Values are S, M, and Null >> Single, Married, N/A
SELECT DISTINCT
    cst_marital_status
FROM
    silver.crm_cust_info

/* ============================================ */
/* ============== Products Table ============= */
/* ============================================ */

-- Finding Duplicate Values --

SELECT
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Checks for Unwanted Spaces --
-- Expectation: No Results

SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLS or Negative Numbers
-- Expectation: No Results

SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

-- Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

-- Check for Invalid Date Orders
SELECT *
FROM silver.crm_prd_info 
WHERE prd_end_dt < prd_start_dt

