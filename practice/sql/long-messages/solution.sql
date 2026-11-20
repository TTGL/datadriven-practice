-- Does average length of the message will be evaluated
-- w/o the spaces in the beginning/end?
WITH cte AS (
  SELECT
    author,
    TRIM(message) as message,
    LEN(TRIM(message)) as message_length,
    AVG(LEN(TRIM(message))) OVER () as avg_length
  FROM repo_commits
  WHERE message IS NOT NULL AND TRIM(message) <> ''
)
SELECT
  author,
  message,
  message_length
FROM cte
WHERE message_length > avg_length
ORDER BY message_length DESC
