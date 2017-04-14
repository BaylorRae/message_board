SELECT
  row_number() OVER (PARTITION BY m.post_id ORDER BY m.created_at) as message_number,
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
