CREATE TABLE IF NOT EXISTS Singers (
	singer_id SERIAL PRIMARY KEY,
	singer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer_Genre (
	singer_id INTEGER REFERENCES Singers(singer_id),
	genre_id INTEGER REFERENCES Genres(genre_id),
	CONSTRAINT pk1 PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(60) NOT NULL,
	release_year INTEGER NOT NULL CHECK(release_year > 1900)
);

CREATE TABLE IF NOT EXISTS Singer_Album (
	singer_id INTEGER REFERENCES Singers(singer_id),
	album_id INTEGER REFERENCES Albums(album_id),
	CONSTRAINT pk2 PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES Albums(album_id),
	track_name VARCHAR(60) NOT NULL,
	duration TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(60) NOT NULL,
	release_year INTEGER NOT NULL CHECK(release_year > 1900)
);

CREATE TABLE IF NOT EXISTS Track_Collection (
	track_id INTEGER REFERENCES Tracks(track_id),
	collection_id INTEGER REFERENCES Collections(collection_id),
	CONSTRAINT pk3 PRIMARY KEY (track_id, collection_id)
);