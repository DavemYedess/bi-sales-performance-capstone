SELECT

store_id,
TO_CHAR (date,
'YYYY-MM') AS salemonth,
SUM (sales) AS total_sales
FROM
sales
GROUP
BY
ROLLUP
(store_id,
TO_CHAR (date, 'YYYY-MM'))
ORDER BY store_id, sale_month; 
