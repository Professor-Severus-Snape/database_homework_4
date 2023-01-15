INSERT INTO Singers(singer_name)
VALUES
	('Britney Spears'),
	('Madonna'),
	('Michael Jackson'),
	('Justin Bieber'),
	('Eminem'),
	('Enrique Iglesias'),
	('Adriano Celentano'),
	('Beyonce');

INSERT INTO Genres(genre_name)
VALUES
	('Pop'),
	('Rap'),
	('Jazz'),
	('HipHop'),
	('Country');

INSERT INTO Singer_Genre(singer_id, genre_id)
VALUES
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 2),
	(5, 3),
	(6, 3),
	(7, 4),
	(8, 1),
	(8, 5);

INSERT INTO Albums(album_name, release_year)
VALUES
	('Dreamland', 2018),
	('Suddenly', 2019),
	('Sixteen Oceans', 2020),
	('My Turn', 2021),
	('No Pressure', 2017),
	('My World', 2020),
	('The Ghost', 2018),
	('Circles', 2020),
	('Forest', 2016),
	('Moscow Never Sleeps', 2019);

INSERT INTO Singer_Album(singer_id, album_id)
VALUES
	(1, 1),
	(2, 2),
	(2, 3),
	(3, 4),
	(4, 5),
	(5, 6),
	(6, 7),
	(7, 8),
	(7, 9),
	(8, 10);

INSERT INTO Tracks(album_id, track_name, duration)
VALUES
	(1, 'My Ocean', '00:04:20'),
	(1, 'Prayer', '00:02:56'),
	(2, 'I Don`t Care', '00:02:43'),
	(2, 'Sunflower', '00:03:14'),
	(3, 'Mad World', '00:03:27'),
	(4, 'One More Night', '00:03:41'),
	(4, 'Memories', '00:03:58'),
	(5, 'Imagine', '00:02:57'),
	(6, 'My Soul', '00:02:49'),
	(6, 'You Are The Reason', '00:03:13'),
	(7, 'Young Blood', '00:03:21'),
	(8, 'Dance Monkey', '00:04:05'),
	(8, 'Rain On Me', '00:03:04'),
	(9, 'Way Back Home', '00:02:43'),
	(10, 'My Dream', '00:03:10');

INSERT INTO Collections(collection_name, release_year)
VALUES
	('Nostalgia', 2020),
	('The Best Of 2015-2017', 2017),
	('Extreme 2019', 2019),
	('Super Collection', 2021),
	('Dance Weekend', 2019),
	('Top 100', 2020),
	('Star Hits', 2018),
	('Super Mix 3', 2017);

INSERT INTO Track_Collection(track_id, collection_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(8, 7),
	(9, 8),
	(10, 1),
	(11, 1),
	(13, 4),
	(14, 6),
	(15, 8);
