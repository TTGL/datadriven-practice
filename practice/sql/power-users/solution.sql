SELECT
  u.username,
  COUNT(us.session_id) as session_count
FROM users u
JOIN user_sessions us
  ON u.user_id = us.user_id
GROUP BY u.user_id
HAVING COUNT(us.session_id) >= 3
ORDER BY session_count DESC
