SELECT
  m.*
FROM ml_models m
WHERE accuracy >= 0.9
ORDER BY accuracy DESC
