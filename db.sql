--------- Data Definition Language (DDL)

CREATE TABLE IF NOT EXISTS users (
	user_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	username varchar(50) NOT NULL UNIQUE,
	email varchar(255) NOT NULL UNIQUE
);

ALTER TABLE users
ADD COLUMN name varchar(30) NOT NULL;


DROP TABLE users;


--------- Data Manipulation Language (DDL)

INSERT INTO users (username, email, name)
VALUES ('Sali', 'sali@email.com', 'Sali Saed');


UPDATE users
SET name = 'John Smith'
WHERE user_id = 1;

DELETE FROM users
WHERE user_id = 1;

SELECT * FROM users;


--------- Relationships

CREATE TABLE posts (
    post_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id int REFERENCES users(user_id),
    title text NOT NULL,
    body text NOT NULL
);

INSERT INTO posts (user_id, title, body)
VALUES(2, 'This is a post title', 'this is more information thanks for reading'), 
(2, 'This is a second post', 'this is the post body');

SELECT * FROM posts;

CREATE VIEW IF NOT EXISTS post_info AS 
    SELECT title, username
    FROM posts
    INNER JOIN users
    ON posts.user_id = users.user_id;

SELECT * FROM post_info;