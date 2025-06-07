CREATE OR REPLACE VIEW public.cohort_analysis
AS WITH customer_revenue AS (
         SELECT s.customerkey,
            s.orderdate,
            max(c.surname::text) AS surname,
            max(c.givenname::text) AS givenname,
            max(c.age) AS age,
            max(c.countryfull::text) AS countryfull,
            sum(s.quantity::double precision * s.netprice * s.exchangerate) AS net_revenue,
            count(s.orderkey) AS no_of_orders
           FROM sales s
             JOIN customer c ON s.customerkey = c.customerkey
          GROUP BY s.customerkey, s.orderdate
        )
 SELECT customerkey,
    orderdate,
    concat(TRIM(BOTH FROM surname), ' ', TRIM(BOTH FROM givenname)) AS full_name,
    age,
    countryfull,
    net_revenue,
    no_of_orders,
    min(orderdate) OVER (PARTITION BY customerkey) AS first_order_date,
    EXTRACT(year FROM min(orderdate) OVER (PARTITION BY customerkey)) AS cohort_year
   FROM customer_revenue cr;