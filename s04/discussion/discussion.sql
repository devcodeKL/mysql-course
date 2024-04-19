-- MySQL Advance Select Queries and Join

-- [SECTION] Advanced Selects
-- 1. Show only specific number or records
-- LIMIT keyword it us used to specify the number of records to return
SELECT * FROM songs LIMIT 5;

-- Combine LIMIT with WHERE clause
SELECT * FROM songs WHERE length >= 230 LIMIT 5;

-- 2. Exclude a record
-- The excalamation point(!) is called Not Condition/Operator

-- Excludes songs which belongs to 24K Magic
SELECT * FROM songs WHERE album_id != 11;

SELECT * FROM songs WHERE album_id != 5 AND album_id !=6;

-- 3. Finding records using comparison operator
-- >, <, >=, <=
SELECT * FROM songs WHERE length > 330;

-- 4. Getting records with multiple conditions
-- IN Clause
SELECT * FROM songs WHERE genre = "Pop" OR genre = "K-Pop";

-- shorthand method for multiple OR condition
SELECT * FROM songs WHERE genre IN ("Pop", "K-Pop");

-- 5. Show records with a partial match
-- LIKE keyword which is used in WHERE clause to search for a specified pattern in a column
-- There are two wildcard operators used in conjunction with LIKE
	-- "%" which represents zero, one or multiple characters

-- Find values with a match at the start.
SELECT * FROM songs WHERE song_name LIKE "th%";

-- Find values with a match at the end.
SELECT * FROM songs WHERE song_name LIKE "%ce";

-- Find values with a match at any position.
SELECT * FROM songs WHERE song_name LIKE "%th%";

-- Find values with a match of specific length/pattern
SELECT * FROM songs WHERE song_name LIKE "__rr_";
SELECT * FROM albums WHERE date_released LIKE "20__-0_-__";

-- Find values with a match at certain positions
SELECT * FROM albums WHERE album_title LIKE "_ur%";

SELECT * FROM albums WHERE album_title LIKE "%_r%";

-- 6. Sorting Records
-- ORDER BY keyword is used to sort the results to ascending (ASC) or descending (DESC) order
-- Syntax:
	-- SELECT * FROM table_name ORDER BY column_name ASC/DESC;

	-- Combine ORDER BY with WHERE clause
	-- SELECT * FROM table_name WHERE condition ORDER BY column_name ASC/DESC;

SELECT * FROM songs ORDER BY song_name;
SELECT * FROM songs ORDER BY song_name ASC;
SELECT * FROM songs ORDER BY song_name DESC;

SELECT * FROM songs WHERE album_id != 5 AND album_id != 11 ORDER BY song_name ASC;

-- 7. Showing records with distinct values
-- DISTINCT keyword eliminates duplicate rows and displays a unique list of values.
-- Syntax:
	-- SELECT DISTINCT column_name FROM table_name;
SELECT DISTINCT genre FROM songs;

-- 8. Count the number or rows in the table
-- COUNT keyword counts the rows in the table
-- Syntax:
	-- SELECT COUNT(column_name) FROM table_name;
SELECT COUNT(*) FROM songs;

SELECT COUNT(DISTINCT genre) FROM songs;

-- [SECTION] Table Joins

-- To retrieve data from multiple tables

-- Inner Join

-- Joining two tables:
-- Syntax:
	-- SELECT column_name FROM table1
		-- JOIN table2 ON table1.id = table2.foreign_key_column;

-- Combine artists and albums table
SELECT * FROM artists
	JOIN albums ON artists.id = albums.artist_id;

-- Using WHERE clause with Joined table
SELECT * FROM artists
	JOIN albums ON artists.id = albums.artist_id 
	WHERE date_released <= 20151201;

-- Joining multiple tables
-- Syntax:
	-- SELECT column_name FROM table1
		-- JOIN table2 ON table1.id = table2.foreign_key_column;
		-- JOIN table3 ON table2.id = table3.foreign_key_column;

-- Combine Artists produces Albums which contain Songs
SELECT * FROM artists
	JOIN albums ON artists.id = albums.artist_id
	JOIN songs ON albums.id = songs.album_id;

-- Specify columns to be included in the result
SELECT name, album_title, song_name, length, genre FROM artists 
	JOIN albums ON artists.id = albums.artist_id
	JOIN songs ON albums.id = songs.album_id;

-- Provide alias for joining table
--  Syntax: SELECT column_name AS alias/nickname FROM table;
SELECT name AS "Artist name", album_title AS "Album", song_name AS "Song", length AS "Duration", genre AS "Genre" FROM artists
	JOIN albums ON artists.id = albums.artist_id
	JOIN songs ON albums.id = songs.album_id;