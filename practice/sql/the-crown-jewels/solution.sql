SELECT
  SUM(t.total_amount) as total_revenue,
  p.product_name
FROM transactions t
JOIN products p
  ON p.product_id = t.product_id
GROUP BY t.product_id
ORDER BY total_revenue DESC
LIMIT 5
