-- users
INSERT INTO users (email, password, datetime_created) VALUES ("johnsmith@gmail.com", "passwordA", "2021-01-01 01:00:00");
INSERT INTO users (email, password, datetime_created) VALUES ("juandelacruz@gmail.com", "passwordB", "2021-01-01 02:00:00");
INSERT INTO users (email, password, datetime_created) VALUES ("janesmith@gmail.com", "passwordC", "2021-01-01 03:00:00");
INSERT INTO users (email, password, datetime_created) VALUES ("mariadelacruz@gmail.com", "passwordD", "2021-01-01 04:00:00");
INSERT INTO users (email, password, datetime_created) VALUES ("johndoe@gmail.com", "passwordE", "2021-01-01 05:00:00");

SELECT * FROM users;

-- posts
INSERT INTO posts (user_id, title, content, datetime_posted) VALUES (1, "First Code", "Hello World!", "2021-01-02 01:00:00");
INSERT INTO posts (user_id, title, content, datetime_posted) VALUES (1, "Second Code", "Hello Earth!", "2021-01-02 02:00:00");
INSERT INTO posts (user_id, title, content, datetime_posted) VALUES (2, "Third Code", "Welcome to Mars!", "2021-01-02 03:00:00");
INSERT INTO posts (user_id, title, content, datetime_posted) VALUES (4, "Fourth Code", "Bye bye solar system!", "2021-01-02 04:00:00");

SELECT * FROM posts;

-- post_likes
INSERT INTO post_likes (user_id, post_id, datetime_liked) VALUES (1, 1, "2021-01-01 05:00:00");
INSERT INTO post_likes (user_id, post_id, datetime_liked) VALUES (1, 3, "2021-01-03 04:00:00");
INSERT INTO post_likes (user_id, post_id, datetime_liked) VALUES (2, 3, "2021-01-03 03:00:00");
INSERT INTO post_likes (user_id, post_id, datetime_liked) VALUES (2, 4, "2021-01-04 02:00:00");
INSERT INTO post_likes (user_id, post_id, datetime_liked) VALUES (4, 3, "2021-01-09 01:00:00");

SELECT * FROM post_likes;

-- post_comments
INSERT INTO post_comments (user_id, post_id, content, datetime_commented) VALUES (1, 1, "I wish I could visit mars.", "2021-01-01 01:00:00");
INSERT INTO post_comments (user_id, post_id, content, datetime_commented) VALUES (1, 3, "This is what I'll say when I become an astronaut.", "2021-01-05 01:00:00");

SELECT * FROM post_comments;

-- Get all posts with User ID of 1
SELECT * FROM posts WHERE user_id = 1;

-- Get all users' email and datetime of creation
SELECT email, datetime_created FROM users;

-- Select all post likes with Post ID of 3
SELECT * FROM post_likes WHERE post_id = 3;

-- Select all post likes with Post ID of 4
SELECT * FROM post_likes WHERE post_id = 4;

-- Update a post's content to "Hello to the people of the Earth!” where its initial content is "Hello Earth!" by using the record's ID:
UPDATE posts SET content = "Hello to the people of the Earth!" WHERE id = 2;

SELECT user_id, content FROM posts;

-- Update a post comment's content to "I wish I could visit all the planets" where its initial content is "I wish I could visit mars." by using the record's ID
UPDATE post_comments SET content = "I wish I could visit all the planets" WHERE id = 1;

SELECT post_id, content FROM post_comments;

-- Delete the user with an email of "johndoe@gmail.com"
DELETE FROM users WHERE email = "johndoe@gmail.com";

SELECT email FROM users;

-- Delete the post like with the id of 2
DELETE FROM post_likes WHERE id = 2;

SELECT * FROM post_likes;