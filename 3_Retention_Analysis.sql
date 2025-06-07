WITH last_order AS(
	SELECT 
		DISTINCT customerkey AS customerkey,
		full_name,
		first_order_date,
		MAX(orderdate) OVER (PARTITION BY customerkey) AS last_order_date,
		cohort_year
	FROM cohort_analysis 
	ORDER BY customerkey
	), active_customer AS(
	SELECT 
		la.customerkey,
		la.full_name,
		la.last_order_date,
		la.cohort_year,
		CASE
			WHEN la.last_order_date >= (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months' THEN 'Active Customers'
		ELSE 'Churned Customers'
		END AS customer_status
	FROM last_order la
	WHERE la.first_order_date < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months'
	)
SELECT 
	cohort_year, 
	customer_status,
	COUNT(customerkey) AS customers,
	SUM(COUNT(customerkey)) OVER (PARTITION  BY cohort_year) AS total_customers,
	ROUND(COUNT(customerkey) / SUM(COUNT(customerkey)) OVER (PARTITION  BY cohort_year), 2) * 100 AS status_percentage
FROM active_customer
GROUP BY cohort_year,
	customer_status