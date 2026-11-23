WITH unfiltered AS (
  SELECT
    sub.*,
    DENSE_RANK() OVER (ORDER BY sub.txn_count DESC) as rnk
  FROM (
    SELECT
      p.category,
      COUNT(*) as txn_count
    FROM transactions t
    LEFT JOIN products p
      ON p.product_id = t.product_id
    WHERE p.rating >= 3.0
    GROUP BY p.category
  ) sub
)
SELECT
  *
FROM unfiltered
WHERE rnk <= 3
