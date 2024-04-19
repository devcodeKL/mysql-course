-- a. Find all artists that have the letter 'd' in their name.
SELECT * FROM artists WHERE name LIKE "%d%";

-- b. Find all songs that have a length of less than 2:30.
SELECT * FROM songs WHERE length < 230;

-- c. Join the 'albums' and 'songs' tables. (Only show the album name, song name, and song length.)
SELECT album_title, song_name, length FROM albums
    JOIN songs ON albums.id = songs.album_id;

-- d. Join the 'artists' and 'albums' tables. (Find all albums that have the letter 'a' in their name.)
SELECT * FROM artists
    JOIN albums ON artists.id = albums.artist_id 
    WHERE album_title LIKE "%a%";

-- e. Sort the albums in Z-A order. (Show only the first 4 records.)
SELECT * FROM albums ORDER BY album_title DESC LIMIT 4;

-- f. Join the 'albums' and 'songs' tables. (Sort albums from Z-A)
SELECT * FROM albums
    JOIN songs ON albums.id = songs.album_id
    ORDER BY album_title DESC;