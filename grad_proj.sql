-- Practical Exam: Grocery Store Sales
-- FoodYum is a grocery store chain based in the United States.
-- The data is available in the table "products".

-- Task 1: Determine the number of products with missing "year_added" values.
-- Your output should be a single column "missing_year" with a single row giving the number of missing values.

SELECT 
    COUNT(*) - COUNT(year_added) AS missing_year
FROM 
    products;

-- Task 2: Clean the product data to match the given criteria.
-- Write a query to ensure the product data matches the description provided without updating the original table.

SELECT
    product_id,
    COALESCE(product_type, 'Unknown') AS product_type,
    COALESCE(brand, 'Unknown') AS brand,
    COALESCE(ROUND(weight::NUMERIC, 2), ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY weight::NUMERIC), 2)) AS weight,
    COALESCE(ROUND(price::NUMERIC, 2), ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price::NUMERIC), 2)) AS price,
    COALESCE(average_units_sold, 0) AS average_units_sold,
    COALESCE(year_added, 2022) AS year_added,
    COALESCE(stock_location, 'Unknown') AS stock_location
FROM 
    products;

-- Task 3: Determine the minimum and maximum price for each product type.
-- Your output should have the columns "product_type", "min_price", and "max_price".

SELECT 
    product_type, 
    MIN(price) AS min_price, 
    MAX(price) AS max_price
FROM 
    products
GROUP BY 
    product_type;

-- Task 4: Filter meat and dairy products where the average units sold is greater than 10.
-- Your output should have the columns "product_id", "price", and "average_units_sold".

SELECT 
    product_id, 
    price, 
    average_units_sold
FROM 
    products
WHERE 
    product_type IN ('Meat', 'Dairy') 
    AND average_units_sold > 10;
