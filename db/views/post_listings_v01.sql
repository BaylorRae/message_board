WITH posts_cte AS (
    SELECT
      p.id,
      p.title,
      p.user_id,
      COUNT(m.id) AS messages_count,
      p.created_at,
      p.updated_at
    FROM posts p
    LEFT JOIN messages m ON p.id = m.post_id
    GROUP BY p.id
),
max_message_numbers_cte AS (
  SELECT
    post_id,
    max(message_number) as message_number
  FROM post_messages
  GROUP BY post_id
)
SELECT
  p.id,
  p.title,
  p.user_id,
  u.email as post_author,
  p.messages_count,
  last_message.user_id as last_author_user_id,
  last_message.email as last_author_email,
  last_message.created_at as last_message_at,
  last_message.message_number as last_message_number,
  p.created_at,
  p.updated_at
from posts_cte p
INNER JOIN users u ON u.id = p.user_id
LEFT JOIN (select * from max_message_numbers_cte) max_message_numbers ON max_message_numbers.post_id = p.id
LEFT JOIN post_messages last_message on last_message.post_id = p.id and last_message.message_number = max_message_numbers.message_number
ORDER BY last_message.created_at DESC
