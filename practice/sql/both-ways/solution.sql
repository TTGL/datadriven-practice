WITH purchases AS (
  SELECT
    transaction_date,
    SUM(total_amount) as total
  FROM transactions
  WHERE transaction_date BETWEEN '2026-04-01' AND '2026-06-30'
    AND total_amount > 0
  GROUP BY transaction_date
),
refunds AS (
  SELECT
    transaction_date,
    SUM(total_amount) as total
  FROM transactions
  WHERE total_amount < 0
  GROUP BY transaction_date
)
SELECT
  COALESCE(p.transaction_date, r.transaction_date) as transaction_date,
  COALESCE(p.total, 0) + COALESCE(r.total, 0) as net_revenue
FROM purchases p
FULL OUTER JOIN refunds r
ON p.transaction_date = r.transaction_date
ORDER BY COALESCE(p.transaction_date, r.transaction_date)
