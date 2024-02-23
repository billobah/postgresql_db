---
Work with a PotsgreSQL database on Ubuntu 22.04
---

# Installing PostgreSQL

```bash
sudo apt update
```

```bash
sudo apt install postgresql postgresql-contrib
```

# Connecting to PostgreSQL Database

The installation procedure created a user account called postgres that is associated with the default Postgres role.
There are a few ways to utilize this account to access Postgres. One way is to switch over to the postgres account on your server by running the following command:

```bash
sudo -u postgres psql
```

This will log you into the PostgreSQL prompt, and from here you are free to interact with the database management system right away.

To exit out of the PostgreSQL prompt, run the following:

```bash
\q
```

This will bring you back to the postgres Linux command prompt. To return to your regular system user, run the exit command:

```bash
exit
```

# Interact with PostgreSQL database

This command gives you the connection info:

```bash
\conninfo
```

Clear the terminal:

\! clear

Every command used with ```\!``` will be interpreted as a terminal command

# Data Definition Language

## Create a table

```sql
CREATE TABLE users (
	user_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	username varchar(50) NOT NULL UNIQUE,
	email varchar(255) NOT NULL UNIQUE
);
```

Type this command to see the table:

```bash
\dt
```


## Read a SQL file

Use this command:

```bash
\i db.sql
```

## Altering a table

```sql
ALTER TABLE users
ADD COLUMN name varchar(30) NOT NULL;
```

## Show more details on the table

```bash
\d users
```


## Delete table 

This is a dangerous command. Use it very carefully:

```sql
DROP TABLE users;
```


# Data Manipulation Language

## Insert data into a table

```sql
INSERT INTO users (username, email, name)
VALUES ('Sali', 'sali@email.com', 'Sali Saed');
```

## Update data into a table

```sql
UPDATE users
SET name = 'John Smith'
WHERE user_id = 1;
```

## Show everything from the table

```sql
SELECT * FROM users;
```

## Delete a specific row

```sql
DELETE FROM users
WHERE user_id = 1;
```

# Relationships

## Defining a foreign key
Define a column that references another column, and this forces every value in that column to exist in that other column that we are referencing.

To do this we will create a foreign key.

```sql
CREATE TABLE posts (
    post_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id int REFERENCES users(user_id),
    title text NOT NULL,
    body text NOT NULL
);
```

```sql
INSERT INTO posts (user_id, title, body)
VALUES(2, 'This is a post title', 'this is more information thanks for reading'), 
(2, 'This is a second post', 'this is the post body');
```

## Joins

```sql
SELECT title, username
FROM posts
INNER JOIN users
ON posts.user_id = users.user_id;
```

# Views

We can keep some queries into a Views (virtual tables) so that we can access them easily. It is a way to keep what we want the data look like.

So that way we don't have to craft the query every single time and we just have to create it once in the View, and then after that we can no longer create the View
and just use it almost like another table




