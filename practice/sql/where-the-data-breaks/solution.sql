SELECT
  tbl_name,
  COUNT(*) AS failing_checks,
  SUM(
    CASE
      WHEN lower(severity) IN ('critical', 'high')
        THEN 1
      ELSE 0
    END
  ) AS high_severity_failures
FROM dq_checks
WHERE passed IS FALSE
GROUP BY tbl_name
ORDER BY failing_checks DESC, tbl_name
