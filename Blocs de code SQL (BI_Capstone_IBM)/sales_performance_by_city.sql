SELECT

cn.city_name,

SUM (s. sales) AS total_sales,

AVG (s. sales) AS average_sales,

SUM (s. revenue) AS total_revenue

FROM sales s

JOIN store_cities sc
ON
s. store_id = sc.store_id

JOIN city_names cn

ON sc.city_id = cn.city_id

GROUP BY cn.city_name

ORDER BY total_sales DESC;