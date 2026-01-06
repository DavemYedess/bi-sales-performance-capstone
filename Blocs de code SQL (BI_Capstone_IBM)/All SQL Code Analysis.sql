--Bloc 1 : sales_performance_by_city.sql
--Description : Analyse des ventes et revenus totaux par ville.

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

--Bloc 2 : monthly_sales_by_city_rollup.sql
--Description : Agrégation mensuelle des ventes avec rollup par ville (détail + total).

SELECT
c.city_id,
TO_CHAR (s.date,
'YYYY-MM') AS sale_month,
SUM (s. sales) AS total_sales

FROM sales s
JOIN store_cities c
ON s. store_id = c.store_id
GROUP BY ROLLUP (c.city_id, sale_month)
ORDER BY c.city_id, sale_month;


--Bloc 3 : product_hierarchy_sales_rollup.sql
--Description : Analyse des ventes par niveaux hiérarchiques des produits (hierarchy2 → hierarchy3).

SELECT
p.hierarchy2_id,
p.hierarchy3_id,
SUM (s.sales) AS total_sales
FROM sales s
JOIN product_hierarchy p
ON s. product_id = p.product_id
GROUP BY
ROLLUP (p.hierarchy2_id, p.hierarchy3_id)
ORDER BY p.hierarchyz_id, p.hierarchy3_id;

--Bloc 4 : store_monthly_sales_rollup.sql
--Description : Agrégation mensuelle des ventes avec rollup par magasin.

SELECT
store_id,
TO_CHAR (date,
'YYYY-MM') AS salemonth,
SUM (sales) AS total_sales

FROM
sales
GROUP BY ROLLUP(store_id,
TO_CHAR (date, 'YYYY-MM'))
ORDER BY store_id, sale_month;

