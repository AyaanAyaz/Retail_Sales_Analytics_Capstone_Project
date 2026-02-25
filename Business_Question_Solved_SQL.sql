-- Retail Business Dataset --
-- Now we are solving Business Questions for Analysis --

SELECT * FROM retail_sales

-- 1. What is the overall financial performance? 

SELECT 
    COUNT(*) AS total_orders,
    COUNT(DISTINCT "Customer_ID") AS unique_customers,
    SUM("Revenue") AS total_revenue,
    SUM("Profit") AS total_profit,
    SUM("Profit") * 100.0 / SUM("Revenue") AS overall_profit_margin_percent,
    AVG("Profit") AS avg_profit_per_order
FROM "retail_sales";

-- 2. Which are the Top 5 most profitable product categories?

SELECT 
    "Product_Category",
    SUM("Profit") AS total_profit,
    SUM("Revenue") AS total_revenue,
    COUNT(*) AS order_count,
    SUM("Profit") * 100.0 / SUM("Revenue") AS profit_margin_percent
FROM "retail_sales"
GROUP BY "Product_Category"
ORDER BY total_profit DESC
LIMIT 5;

-- 3. Which regions generate the most revenue and profit
SELECT 
    "Region",
    SUM("Revenue") AS total_revenue,
    SUM("Profit") AS total_profit,
    COUNT(*) AS order_count,
    SUM("Profit") / SUM("Revenue") * 100 AS profit_margin_percent,
    RANK() OVER (ORDER BY SUM("Revenue") DESC) AS revenue_rank
FROM "retail_sales"
GROUP BY "Region"
ORDER BY total_revenue DESC;


--  4. How do sales and profit trend over time (monthly)?         

SELECT 
    DATE_TRUNC('month', "Order_Date") AS month,
    TO_CHAR(DATE_TRUNC('month', "Order_Date"), 'YYYY-MM') AS year_month,
    SUM("Revenue") AS monthly_revenue,
    SUM("Profit") AS monthly_profit,
    COUNT(*) AS orders
FROM "retail_sales"
GROUP BY DATE_TRUNC('month', "Order_Date")
ORDER BY month;


-- 5. Which customer segments are most valuable?                 

SELECT 
    "Customer_Segment",
    COUNT(DISTINCT "Customer_ID") AS unique_customers,
    COUNT(*) AS order_count,
    SUM("Revenue") AS total_revenue,
    SUM("Profit") AS total_profit,
    AVG("Profit") AS avg_profit_per_order
FROM "retail_sales"
GROUP BY "Customer_Segment"
ORDER BY total_profit DESC;


--  6. What is the impact of discounts on profit margin?          

SELECT 
    ("Discount_Rate" * 100, 0) AS discount_percentage,
    COUNT(*) AS order_count,
    AVG("Profit") AS avg_profit,
    SUM("Profit") * 100.0 / SUM("Revenue") AS profit_margin_percent
FROM "retail_sales"
GROUP BY "discount_percentage"
ORDER BY "discount_percentage" ASC;


-- 7. Which payment methods are most popular & profitable?       
SELECT 
    "Payment_Method",
    COUNT(*) AS transaction_count,
    SUM("Revenue") AS total_revenue,
    SUM("Profit") AS total_profit,
    SUM("Profit") * 100.0 / SUM("Revenue") AS profit_margin_percent
FROM "retail_sales"
GROUP BY "Payment_Method"
ORDER BY transaction_count DESC;


-- 8. Who are the Top 10 highest-spending customers?             

SELECT 
    "Customer_ID",
    COUNT(*) AS order_count,
    SUM("Revenue") AS total_spent,
    SUM("Profit") AS profit_generated,
    AVG("Profit") AS avg_profit_per_order
FROM "retail_sales"
GROUP BY "Customer_ID"
HAVING COUNT(*) >= 2   -- optional: filter out one-time buyers
ORDER BY total_spent DESC
LIMIT 10;


--  9. Year-over-Year (YoY) revenue & profit growth               

WITH yearly AS (
    SELECT 
        EXTRACT(YEAR FROM "Order_Date") AS year,
        SUM("Revenue") AS yearly_revenue,
        SUM("Profit") AS yearly_profit
    FROM "retail_sales"
    GROUP BY year
)
SELECT 
    year,
    yearly_revenue,
    yearly_profit,
    LAG(yearly_revenue) OVER (ORDER BY year) AS prev_year_revenue,
    
        (yearly_revenue - LAG(yearly_revenue) OVER (ORDER BY year)) * 100.0 / 
        LAG(yearly_revenue) OVER (ORDER BY year)
     AS revenue_growth_percent
FROM yearly
ORDER BY year;


-- 10. Which products/categories have the highest return rate?   
--     (assuming negative profit or negative quantity = return) 
SELECT 
    "Product_Category",
    COUNT(*) FILTER (WHERE "Profit" < 0) AS return_count,
    COUNT(*) AS total_orders,
    
        COUNT(*) FILTER (WHERE "Profit" < 0)::numeric / COUNT(*) * 100, 
        2
     AS return_rate_percent,
    SUM("Profit") FILTER (WHERE "Profit" < 0) AS total_loss_from_returns
FROM "retail_sales"
GROUP BY "Product_Category"
HAVING COUNT(*) FILTER (WHERE "Profit" < 0) > 0
ORDER BY return_rate_percent DESC
LIMIT 5;