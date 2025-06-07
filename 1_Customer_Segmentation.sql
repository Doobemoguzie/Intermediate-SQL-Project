WITH customerltv AS(
	SELECT 
		customerkey,
		full_name,
		SUM(net_revenue) AS total_ltv
	FROM cohort_analysis 
	GROUP BY customerkey,
			full_name
), customer_percentile AS(
	SELECT
		PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_ltv) AS ltv_25th_percentile,
		PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_ltv) AS ltv_75th_percentile
	FROM customerltv 
), customer_level AS(
	SELECT c.*,
		CASE 
			WHEN c.total_ltv < cp.ltv_25th_percentile THEN '1. Low-Level'
			WHEN c.total_ltv <= cp.ltv_75th_percentile THEN '2. Mid-Level'
			ELSE '3. High-Level'
		END AS customers_segment
	FROM customerltv c,
		customer_percentile cp
)
SELECT 
	customers_segment,
	SUM(total_ltv) AS total_net_revenue,
	COUNT(customerkey) AS no_of_customer,
	SUM(total_ltv) / COUNT(customerkey) AS avg_customer_ltv
FROM customer_level 
GROUP BY customers_segment
