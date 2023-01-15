--1. количество исполнителей в каждом жанре:
SELECT genre_name, COUNT(singer_id) FROM Singer_Genre
JOIN Genres ON Singer_Genre.genre_id = Genres.genre_id
GROUP BY genre_name;

--2. количество треков, вошедших в альбомы 2019-2020 годов:
SELECT COUNT(track_id) FROM Tracks
JOIN Albums ON Tracks.album_id = Albums.album_id
WHERE release_year BETWEEN 2019 AND 2020;

--3. средняя продолжительность треков по каждому альбому:
SELECT Albums.album_name, AVG(duration) FROM Tracks
JOIN Albums ON Tracks.album_id = Albums.album_id
GROUP BY album_name
ORDER BY album_name;

--4. все исполнители, которые не выпустили альбомы в 2020 году:
SELECT singer_name FROM Singers
WHERE singer_name NOT IN(
	SELECT singer_name FROM Singers
	JOIN Singer_Album ON Singers.singer_id = Singer_Album.singer_id
	JOIN Albums ON Singer_Album.album_id = Albums.album_id
	WHERE release_year = 2020
	);

--5. названия сборников, в которых присутствует конкретный исполнитель (пусть будет - Adriano Celentano):
SELECT collection_name FROM Collections
JOIN Track_Collection ON Collections.collection_id = Track_Collection.collection_id
JOIN Tracks ON Track_Collection.track_id = Tracks.track_id
JOIN Albums ON Tracks.album_id = Albums.album_id
JOIN Singer_Album ON Albums.album_id = Singer_Album.album_id
JOIN Singers ON Singer_Album.singer_id = Singers.singer_id
WHERE singer_name ILIKE 'Adriano Celentano';

--6. название альбомов, в которых присутствуют исполнители более 1 жанра:
SELECT album_name FROM Albums
JOIN Singer_Album ON Albums.album_id = Singer_Album.album_id
WHERE singer_id IN (
	SELECT singer_id FROM Singer_Genre
	GROUP BY singer_id
	HAVING COUNT(genre_id) > 1
	);

--7. наименование треков, которые не входят в сборники:
SELECT track_name FROM Tracks
WHERE track_id NOT IN (SELECT DISTINCT track_id FROM Track_Collection);

--8. исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT DISTINCT singer_name FROM Singers
JOIN Singer_Album ON Singers.singer_id = Singer_Album.singer_id
JOIN Albums ON Singer_Album.album_id = Albums.album_id
JOIN Tracks ON Albums.album_id = Tracks.album_id
WHERE duration = (SELECT MIN(duration) FROM Tracks);

--9. название альбомов, содержащих наименьшее количество треков.
-- 1) каскадно удаляем таблицу, если она уже существует (иначе - будет ошибка)
DROP TABLE IF EXISTS Subtable CASCADE;
-- 2) создаем временную таблицу 'Subtable'
SELECT album_name, COUNT(Albums.album_id) AS counter INTO Subtable FROM Albums
JOIN Tracks ON Albums.album_id = Tracks.album_id
GROUP BY album_name;
-- 3) получаем данные из временной таблицы
SELECT album_name FROM Subtable
WHERE counter = (SELECT MIN(counter) FROM Subtable);
