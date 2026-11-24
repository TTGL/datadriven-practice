SELECT
  d.svc_name,
  SUM(
    CASE
      WHEN EXTRACT(YEAR FROM d.deploy_at) = 2025
        THEN -1
      WHEN EXTRACT(YEAR FROM d.deploy_at) = 2026
        THEN 1
      END
  ) AS deploy_growth
FROM deploy_logs d
WHERE EXTRACT(YEAR FROM d.deploy_at) BETWEEN 2025 AND 2026
  AND d.svc_name IN (SELECT DISTINCT svc_name FROM svc_health)
GROUP BY d.svc_name
ORDER BY deploy_growth DESC
LIMIT 1
