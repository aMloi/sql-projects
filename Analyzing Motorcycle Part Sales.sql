WITH sales_data AS (
    SELECT 
        product_line, 
        TO_CHAR(date, 'Month') AS month, 
        warehouse, 
        total, 
        payment_fee
    FROM sales
    WHERE client_type = 'Wholesale'
),
net_revenue_calc AS (
    SELECT 
        product_line, 
        month, 
        warehouse, 
        SUM(total) - SUM(payment_fee) AS net_revenue,
        RANK() OVER (PARTITION BY product_line, month ORDER BY SUM(total) - SUM(payment_fee) DESC) AS revenue_rank
    FROM sales_data
    WHERE TO_CHAR(date, 'Month') IN ('June', 'July', 'August') 
    GROUP BY product_line, month, warehouse
)
SELECT 
    product_line, 
    month, 
    warehouse, 
    net_revenue, 
    revenue_rank
FROM net_revenue_calc
ORDER BY product_line, month, revenue_rank;
