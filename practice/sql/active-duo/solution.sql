SELECT
    u.username
FROM users u
WHERE EXISTS (SELECT 1 FROM transactions t
              WHERE t.user_id = u.user_id)
    AND EXISTS (SELECT 1 FROM user_sessions us
                WHERE us.user_id = u.user_id)
ORDER BY u.username ASC
