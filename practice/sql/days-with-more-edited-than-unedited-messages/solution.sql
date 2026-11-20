WITH scope AS (
  SELECT
    DATE(sent_at) as msg_date,
    SUM(
      CASE
        WHEN edited = 'true'
          THEN 1
        WHEN edited = 'false'
          THEN -1
      END
    ) AS ed_uned
  FROM chat_msgs c
  GROUP BY DATE(sent_at)
)
SELECT
  c.*
FROM chat_msgs c
WHERE DATE(sent_at) IN (SELECT msg_date FROM scope
                        WHERE ed_uned > 0)
