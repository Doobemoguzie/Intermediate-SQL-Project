SELECT
    cohort_year,
    SUM(net_revenue) AS total_revenue,
    COUNT(DISTINCT customerkey) AS total_customers,
    SUM(net_revenue) / COUNT(DISTINCT customerkey) AS customer_revenue
FROM cohort_analysis
WHERE orderdate = first_order_date
GROUP BY 
    cohort_year