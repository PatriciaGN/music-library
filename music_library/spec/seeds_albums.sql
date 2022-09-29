
-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums, artists RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists (name, genre) VALUES ('Halestorm', 'Rock');

INSERT INTO albums (title, release_year, artist_id) VALUES ('The strange case of...', '2012', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Back from the dead', '2022', '1');
