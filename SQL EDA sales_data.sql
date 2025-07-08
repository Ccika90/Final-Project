USE sales_data;

-- View the structure of the sales_data table
DESCRIBE sales_data;

-- Preview the first 10 rows
SELECT * FROM sales_data
LIMIT 10;

-- Count missing (NULL) values in each column
SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN invoice_no IS NULL THEN 1 ELSE 0 END) AS missing_invoice_no,
  SUM(CASE WHEN stock_code IS NULL THEN 1 ELSE 0 END) AS missing_stock_code,
  SUM(CASE WHEN description IS NULL THEN 1 ELSE 0 END) AS missing_description,
  SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
  SUM(CASE WHEN invoice_date IS NULL THEN 1 ELSE 0 END) AS missing_invoice_date,
  SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS missing_unit_price,
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
  SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS missing_country
FROM sales_data;

-- Get summary statistics for quantity and unit_price
SELECT
  MIN(quantity) AS min_quantity,
  MAX(quantity) AS max_quantity,
  AVG(quantity) AS avg_quantity,
  STDDEV(quantity) AS stddev_quantity,
  MIN(unit_price) AS min_unit_price,
  MAX(unit_price) AS max_unit_price,
  AVG(unit_price) AS avg_unit_price,
  STDDEV(unit_price) AS stddev_unit_price
FROM sales_data;

-- Count unique values in key categorical columns
SELECT
  COUNT(DISTINCT stock_code) AS unique_stock_codes,
  COUNT(DISTINCT description) AS unique_descriptions,
  COUNT(DISTINCT customer_id) AS unique_customers,
  COUNT(DISTINCT country) AS unique_countries
FROM sales_data;

-- Top 10 selling products by quantity
SELECT description, SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY description
ORDER BY total_quantity DESC
LIMIT 10;

-- Monthly sales trend
SELECT
  DATE_FORMAT(invoice_date, '%Y-%m') AS month,
  SUM(quantity * unit_price) AS total_sales
FROM sales_data
GROUP BY DATE_FORMAT(invoice_date, '%Y-%m')
ORDER BY month;

-- Total sales by country
SELECT country, SUM(quantity * unit_price) AS total_sales
FROM sales_data
GROUP BY country
ORDER BY total_sales DESC;

-- Find transactions with unusually high sales value
SELECT *
FROM sales_data
WHERE (quantity * unit_price) > (
  SELECT AVG(quantity * unit_price) + 3 * STDDEV(quantity * unit_price)
  FROM sales_data
);

-- Check correlation between quantity and unit price (approximate)
SELECT
    (
        SUM((quantity - avg_quantity) * (unit_price - avg_unit_price)) /
        (SQRT(SUM(POW(quantity - avg_quantity, 2)) * SUM(POW(unit_price - avg_unit_price, 2))))
    ) AS corr_quantity_unit_price
FROM (
    SELECT
        quantity,
        unit_price,
        (SELECT AVG(quantity) FROM sales_data) AS avg_quantity,
        (SELECT AVG(unit_price) FROM sales_data) AS avg_unit_price
    FROM sales_data
) AS subquery;