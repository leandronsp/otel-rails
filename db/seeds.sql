set posts.total = 1000;
set comments.total = 1000;

INSERT INTO posts (title, body, published, created_at, updated_at)
SELECT 
	'Title ' || id AS title,
	'Body ' || id AS body,
	true as published,
	NOW() as created_at,
	NOW() AS updated_at
FROM generate_series(1, current_setting('posts.total')::int) AS id;

INSERT INTO comments (post_id, content, created_at, updated_at)
SELECT 
	GREATEST((random() * (SELECT COUNT(*) FROM posts))::int, 1) AS post_id,
	'Content ' || id AS content,
	NOW() as created_at,
	NOW() AS updated_at
FROM generate_series(1, current_setting('comments.total')::int) AS id;
