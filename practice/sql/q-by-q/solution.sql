WITH deploys_num AS (
  SELECT
    EXTRACT(YEAR FROM deploy_at) AS year,
    EXTRACT(WEEK FROM deploy_at) AS week,
    EXTRACT(QUARTER FROM deploy_at) AS quarter_num,
    COUNT(*) AS deploys_num
  FROM deploy_logs l
  GROUP BY EXTRACT(YEAR FROM deploy_at),
    EXTRACT(WEEK FROM deploy_at)
)
-- Will
SELECT
  year || '-Q' || quarter_num as quarter,
  SUM(deploys_num) / CAST(13 as DECIMAL) as deploys_per_week
FROM deploys_num
GROUP BY year, quarter_num
ORDER BY deploys_per_week DESC,
  year,
  quarter_num
