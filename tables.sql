DROP TABLE albums CASCADE;
DROP TABLE tracks CASCADE;
DROP TABLE albums_tracks;


CREATE TABLE albums(
    album_id serial PRIMARY KEY,
    title text NOT NULL,
    created_at timestamp(0) with time zone DEFAULT NOW()
);

CREATE TABLE tracks(
    track_id serial PRIMARY KEY,
    title text NOT NULL,
    length time NOT NULL,
    created_at timestamp(0) with time zone DEFAULT NOW()
);

CREATE TABLE albums_tracks(
    album_tracks_id serial PRIMARY KEY,
    album_id integer REFERENCES albums(album_id),
    track_id integer REFERENCES tracks(track_id),
    created_at timestamp(0) with time zone DEFAULT NOW()
);


INSERT INTO albums (title)
VALUES
    ('The Dark Side of the Moon'),
    ('Animals'),
    ('The Wall'),
    ('Wish You were Here'),
    ('The Division Bell'),
    ('Meddle'),
    ('A Momentary Lapse of Reason (2019 Remix)'),
    ('A Momentary Lapse of Reason'),
    ('The Later Years'),
    ('Animals (2018 Remix)');

INSERT INTO tracks (title, length)
VALUES
    ('Speak to Me', '1:05' ),
    ('On the Run', '3:45' ),
    ('Time', '6:53' ),
    ('The Great Gig in the Sky', '6:54' ),
    ('Money', '6:22' ),
    ('Us and Them', '7:49' ),
    ('Brain Damage', '3:46' ),
    ('Eclipse', '2:10' ),
    ('Pigs on the Wing 1', '1:24' ),
    ('Dogs', '17:05' ),
    ('Pigs (Three Diffreent Ones', '11:25' ),
    ('Sheep', '10:19' ),
    ('Pigs on the Wing 2', '1:26' ),
    ('Another Brick in the Wall, Pt.1', '3:12' ),
    ('Another Brick in the Wall, Pt.2', '3:58' ),
    ('Another Brick in the Wall, Pt.3', '1:14' ),
    ('Hey You', '4:38' ),
    ('Comfortably Numb', '6:22' ),
    ('Is there Anybody Out There?', '2:41' ),
    ('Shine On You Crazy Diamond (Pts. 1-5)', '13:31' ),
    ('Shine On You Crazy Diamond (Pts. 6-9)', '12:27' ),
    ('Welcome to the Machine', '7:31' ),
    ('Have a Cigar', '5:07' ),
    ('Wish You were Here', '5:35' ),
    ('Cluster One', '5:55' ),
    ('What do You Want from Me', '4:21' ),
    ('Poles Apart', '7:03' ),
    ('Marooned', '5:30' ),
    ('High Hopes', '8:30' ),
    ('The Dogs of War', '6:03' ),
    ('One Slip', '5:08' ),
    ('Terminal Frost', '6:15' ),
    ('Sorrow', '8:44' ),
    ('One of These Days', '5:54' ),
    ('A Pillow of Winds', '5:12' ),
    ('Echoes', '23:32' ),
    ('Seamus', '2:14' ),
    ('Run Like Hell', '7:45' );

INSERT INTO albums_tracks (album_id, track_id)
VALUES
    ( 1, 1 ),
    ( 1, 2 ),
    ( 1, 3 ),
    ( 1, 4 ),
    ( 1, 5 ),
    ( 1, 6 ),
    ( 1, 7 ),
    ( 1, 8 ),
    ( 2, 9 ),
    ( 2, 10 ),
    ( 2, 11 ),
    ( 2, 12 ),
    ( 2, 13 ),
    ( 3, 14 ),
    ( 3, 15 ),
    ( 3, 16 ),
    ( 3, 17 ),
    ( 3, 18 ),
    ( 4, 19 ),
    ( 4, 20 ),
    ( 4, 21 ),
    ( 4, 22 ),
    ( 4, 23 ),
    ( 4, 24 ),
    ( 5, 25 ),
    ( 5, 26 ),
    ( 5, 27 ),
    ( 5, 28 ),
    ( 5, 29 ),
    ( 8, 30 ),
    ( 8, 31 ),
    ( 8, 32 ),
    ( 6, 33 ),
    ( 6, 34 ),
    ( 6, 35 ),
    ( 6, 36 ),
    ( 6, 37 ),
    ( 6, 38 ),
    ( 7, 20 ),
    ( 7, 21 ),
    ( 7, 22 ),
    ( 7, 23 ),
    ( 7, 24 ),
    ( 7, 30 ),
    ( 7, 31 ),
    ( 7, 32 ),
    ( 9, 1 ),
    ( 9, 2 ),
    ( 9, 3 ),
    ( 9, 4 ),
    ( 9, 15 ),
    ( 9, 16 ),
    ( 9, 17 ),
    ( 9, 18 ),
    ( 9, 25 ),
    ( 9, 26 ),
    ( 9, 27 ),
    ( 9, 28 ),
    ( 10, 9 ),
    ( 10, 10 ),
    ( 10, 11 ),
    ( 10, 12 ),
    ( 10, 13 ),
    ( 10, 28 ),
    ( 10, 29 ),
    ( 10, 30 ),
    ( 10, 31 );


SELECT A.title AS "album", T.title as "track"
FROM albums AS A
INNER JOIN albums_tracks AS AT
ON A.album_id = AT.album_id
INNER JOIN tracks AS T
ON T.track_id = AT. track_id
ORDER BY A.title ASC
LIMIT 25;

SELECT T.title as "track", A.title AS "album"
FROM tracks AS T
INNER JOIN albums_tracks AS AT
ON  T.track_id = AT. track_id
INNER JOIN albums AS A
ON A.album_id = AT.album_id
ORDER BY T.title ASC
LIMIT 25;

SELECT A.title AS "album", COUNT(T.track_id) AS "tracks"
FROM albums AS A
INNER JOIN albums_tracks AS AT
ON A.album_id = AT.album_id
INNER JOIN tracks AS T
ON T.track_id = AT. track_id
GROUP BY A.title
ORDER BY A.title ASC
LIMIT 25;

SELECT T.title as "track", A.title AS "album"
FROM tracks AS T
INNER JOIN albums_tracks AS AT
ON  T.track_id = AT. track_id
INNER JOIN albums AS A
ON A.album_id = AT.album_id
WHERE T.title = 'The Dogs of War'
ORDER BY T.title DESC
LIMIT 25;
