--музыкальные жанры
CREATE TABLE genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

--исполнители
CREATE TABLE artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

--в каких музыкальных жанрах выступают исполнители 
CREATE TABLE artist_genre (
	artist_id INTEGER REFERENCES artist(id),
	genre_id INTEGER REFERENCES genre(id),
	CONSTRAINT artist_genre_pk PRIMARY KEY (
		artist_id,
		genre_id
	)
);

--музыкальные альбомы
CREATE TABLE album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	album_year NUMERIC(4)
);

--исполнители-авторы альбомов
CREATE TABLE album_artist (
	artist_id INTEGER REFERENCES artist(id),
	album_id INTEGER REFERENCES album(id),
	CONSTRAINT album_artist_pk PRIMARY KEY (
		artist_id,
		album_id
	)
);

--треки
CREATE TABLE track (
	id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES album(id) NOT NULL,
	name VARCHAR(255) NOT NULL,
	duration SMALLINT CONSTRAINT positive_duration CHECK (
		duration > 0
	)
);

--сборники
CREATE TABLE collection (
	id SERIAL PRIMARY KEY,
	name varchar(255) NOT NULL,
	collection_year NUMERIC(4)
);

--треки сборников
CREATE TABLE collection_track (
	collection_id INTEGER REFERENCES collection(id),
	track_id INTEGER REFERENCES track(id),
	CONSTRAINT collection_track_pk PRIMARY KEY (
		collection_id,
		track_id
	)
);