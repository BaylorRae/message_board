SELECT
  m.id,
  m.post_id,
  m.user_id,
  u.email,
  m.body,
  m.created_at,
  m.updated_at
FROM messages m
JOIN users u ON m.user_id = u.id
ORDER BY m.created_at ASC
