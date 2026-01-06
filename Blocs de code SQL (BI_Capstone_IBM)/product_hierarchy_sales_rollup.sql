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
