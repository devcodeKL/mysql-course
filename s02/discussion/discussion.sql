-- SQL Queries are case insensitive, but to easily identify we usually use UPPERCASE.
-- Make sure semi-colons (;) are added at the end of the sql syntax.

-- Lists down the databases inside the DBMS.
SHOW DATABASES;

-- Create a databse.
CREATE DATABASE music_db;

-- Note: Naming convention in SQL Database and table uses snake case.
-- Multiple words joined by _ and is in lowercase

-- Remove a specific database.
DROP DATABASE music_db;

-- Select a database.
USE music_db;

-- Create tables.
-- Table columns have the following format:
    -- [column name] [data type] [other_options]
    -- id INT NOT NULL AUTO_INCREMENT: "integer" value that cannot be null (it should be required) and it will increment when a user is created
    -- VARCHAR(50) - variable character. 50 is the character limit.
    -- PRIMARY KEY (id) - Unique identifier of the record (row in relational table)
CREATE TABLE my_table (
    id INT NOT NULL AUTO_INCREMENT,
    column_one VARCAHR(50) NOT NULL,
    column_two INT NOT NULL,
    column_three VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    contact_number INT NOT NULL,
    email VARCHAR(50),
    address VARCHAR(50),
    PRIMARY KEY (id)
);

-- Show all tables under the used database.
SHOW TABLES;

-- Delete a table.
DROP TABLE my_table;

/*
mini-activity

    1. create a  table for artists
    2. artists should have an id
    3. artists is required to have a name with 50 character limits
    4. assign the primary key to its id
*/
CREATE TABLE artists (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

-- To show table info/structure via terminal.
DESCRIBE users;
DESCRIBE artists;

-- ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

-- To change the table name.
ALTER TABLE users RENAME TO users_table;
ALTER TABLE users_table RENAME TO users;

-- To change/modify table column data type and options.
ALTER TABLE users MODIFY email VARCHAR(50) NOT NULL;

-- To add column in existing table.
ALTER TABLE users ADD birth_date DATE NULL AFTER fullname;

-- To delete column in existing table.
ALTER TABLE users DROP COLUMN birth_date;

-- To change column name.
ALTER TABLE users CHANGE COLUMN fullname full_name VARCHAR(50);

-- Tables with foreign keys.
-- Applying constraints in a table
-- Syntax: 
    -- CONSTRAINT foreign_key_name
        -- FOREIGN KEY (column_name) REFERENCES table_name(id)
        -- ON UPDATE ACTION
        -- ON DELETE ACTION

-- When to create a constraint (foreign key)?
    -- If the relationship is "one-to-many", "foreign key" column is added in the "many" entity/table
    -- If the relationship is "one-to-one", "primary key" of the parents row is added as "foreign key" of the child row
    -- If the relationship is "many-to-many", linking table is created to contain the "foreign key" of both tables/entities
-- CONSTRAINT: use to specify the rules for the data table, but this is an optional, we use this to identify the FOREIGN KEY.
-- FOREIGN KEY: is used to prevent actions that will destroy links between tables.
-- REFERENCES: is a field that refers to the primary key of another table.
-- ON UPDATE CASCADE: If the parent row is changed, the child row will also reflect the change.
-- ON DELETE RESTRICT: You can't delete a given parent row if a child row exist that is referenced to the value for that parent row.
CREATE TABLE albums (
    id INT NOT NULL AUTO_INCREMENT,
    album_title VARCAHR(50) NOT NULL,
    date_released DATE NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_albums_artist_id
        FOREIGN KEY (artist_id) REFERENCES artists(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

DESCRIBE albums;

-- DATE & TIME FORMAT IN SQL
    -- DATE refers to YYYY-MM-DD
    -- TIME refers to HH:MM:SS
    -- DATETIME refers to YYYY-MM-DD HH:MM:SS

-- ALTER TABLE artists DROP COLUMN id;
    -- will result to ERROR
    -- dropping a column that is referenced by a foreign key constraint violates referential integrity

/*
mini-activity
    1. Create a table for songs
    2. Put a required auto increment id
    3. declare a song name with 50 char limit, this should be required
    4. declare a length with the data type time and it should be required
    5. declare a genre with 50 char limit, it should be required
    6. declare an integer as album id that should be required
    7. create a primary key referring to the id of the songs
    8. create a foreign key and name it fk_songs_album_id
        8.a this should be referred to the album id
        8.b it should have a cascaded update and restricted delete
    9. run create table songs in the terminal. 
    10. DESCRIBE song, send your output in Space.
*/

CREATE TABLE songs (
    id INT NOT NULL AUTO_INCREMENT,
    song_name VARCHAR(50) NOT NULL,
    length TIME NOT NULL,
    genre VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_songs_album_id
        FOREIGN KEY (album_id) REFERENCES albums(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

DESCRIBE songs;

CREATE TABLE playlists (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    datetime_created DATETIME NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_playlists_user_id
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

DESCRIBE playlists;

CREATE TABLE playlists_songs (
    id INT NOT NULL AUTO_INCREMENT,
    playlist_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_playlists_songs_playlist_id
        FOREIGN KEY (playlist_id) REFERENCES playlists(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_playlists_songs_song_id
        FOREIGN KEY (song_id) REFERENCES songs(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

DESCRIBE playlists_songs;

SHOW TABLES;