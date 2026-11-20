WITH cte as ( 
  SELECT
    CASE
      WHEN EXTRACT(DAY_OF_WEEK FROM served_at) = 7
        THEN 0
      ELSE EXTRACT(DAY_OF_WEEK FROM served_at)
    END as weekday_num,
    EXTRACT(HOUR FROM served_at) as hour,
    AVG(bytes * 0.95) as avg_net_bytes
  FROM cdn_logs
  GROUP BY EXTRACT(DAY_OF_WEEK FROM served_at), EXTRACT(HOUR FROM served_at) 
)
SELECT
  CASE
    WHEN weekday_num = 1
      THEN 'Monday'
    WHEN weekday_num = 2
      THEN 'Tuesday'
    WHEN weekday_num = 3
      THEN 'Wednesday'
    WHEN weekday_num = 4
      THEN 'Thursday'
    WHEN weekday_num = 5
      THEN 'Friday'
    WHEN weekday_num = 6
      THEN 'Saturday'
    WHEN weekday_num = 0
      THEN 'Sunday'
  END as weekday,
  hour,
  ROUND(avg_net_bytes, 2)
FROM cte
ORDER BY weekday_num, hour
