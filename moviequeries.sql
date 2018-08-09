/*select all columns and rows from the movies table*/
{SELECT * 
FROM movies}

/*select only the title and id of the first 10 rows*/
{SELECT title, id 
FROM movies 
LIMIT 10}

/*Find the movie with the id of 485*/
{SELECT id, title, genres
FROM movies 
WHERE id=485}

/*Find the id (only that column) of the movie Made in America (1993)*/
{SELECT id 
FROM movies 
WHERE title = "Made in America (1993)"}

/*Find the first 10 movies sorted alphabetically*/
{SELECT title 
FROM movies 
WHERE title 
LIKE 'A%' 
ORDER BY title ASC 
LIMIT 10}

/*Find all movies from 2002*/
{SELECT title 
FROM movies 
WHERE title 
LIKE '%(2002)%'}

/*Find out what year The Godfather came out*/
{SELECT title  
FROM movies 
WHERE title 
LIKE 'Godfather%' 
ORDER BY title ASC 
LIMIT 1}

/*Without using joins, find all the comedies*/
{SELECT title 
FROM movies 
WHERE genres 
LIKE '%comedy%'}

/*Find all comedies in the year 2000*/
{SELECT title, genres
FROM movies
WHERE title LIKE '%(2000)' AND genres LIKE '%comedy%'}

/*Find any movies that are about death and are a comedy*/
{SELECT title, genres
FROM movies
WHERE genres LIKE '%comedy%' and genres LIKE '%horror%'}

/*Find any movies from either 2001 or 2002 with a title containing "super"*/
{SELECT title
FROM movies
WHERE title LIKE '%super%' AND title LIKE '%(2001)' 
OR title LIKE '%super%' AND title LIKE '%(2002)'}

/*Pick 3 movies and create insert statements for 10 actors each*/
{INSERT into actors (name, char_name, movie_Id, date_of_birth)
VALUES ("Flip Kowalski", "zombie 1", "858", "1967-02-10"),
	("Eustace O'Reilly", "zombie 2", "858", "1966-02-19"),
	("Cletus O'Shaugnessey", "zombie 3", "858", "1964-08-09"),
	("Bigsby Morimoto", "zombie 4", "858", "1967-10-02"),
	("Rip Kickinger", "zombie 5", "858", "1960-03-30"),
	("Stanislav Washington", "zombie 6", "858", "1955-04-20"),
	("Slim Goldberg", "zombie 7", "858", "1947-03-22"),
	("Xianwu Washington", "zombie 8", "858", "1939-11-22"),
	("Tina DelGordo", "zombie 9", "858", "1965-10-31"),
	("Ronaldo TenFeathers", "zombie 10", "858", "1959-07-30")}
	{INSERT into actors (name, char_name, movie_Id, date_of_birth)
VALUES ("Homer Simpson", "Homer", "1367", "1987-02-10"),
	("Marge Simpson", "Marge", "1367", "1986-02-19"),
	("Bart Simpson", "Bart", "1367", "1984-08-09"),
	("Lisa Simpson", "Lisa", "1367", "1987-10-02"),
	("Maggie Simpson", "Maggie", "1367", "1980-03-30"),
	("Ned Flanders", "Ned", "1367", "1985-04-20"),
	("Wayland Smithers", "Smithers", "1367", "1947-03-22"),
	("Montgomery Burns", "Mr. Burns", "1367", "1989-11-22"),
	("Milhouse Van Houten", "Milhouse", "1367", "1985-10-31"),
	("Moe Szyslak", "Moe", "1367", "1989-07-30")}
	{INSERT into actors (name, char_name, movie_Id, date_of_birth)
VALUES ("Peter Griffin", "Peter", "1367", "1987-02-10"),
	("Lois Griffin", "Lois", "1367", "1986-02-19"),
	("Brian Griffin", "Brian", "1367", "1984-08-09"),
	("Stewie Griffin", "Stewie", "1367", "1987-10-02"),
	("Meg Griffin", "Meg", "1367", "1980-03-30"),
	("Joe Swanson", "Joe", "1367", "1985-04-20"),
	("Cleveland Brown", "Cleveland", "1367", "1947-03-22"),
	("Glen Quagmire", "Glen", "1367", "1989-11-22"),
	("Mort Goldman", "Mort", "1367", "1985-10-31"),
	("Muriel Goldman", "Muriel", "1367", "1989-07-30")}

/*Create a new column to hold the MPAA Rating. Update 5 movies to their correct rating*/
{UPDATE movies
SET MPAA_Rating = "8.2"
WHERE id = "16"}
{UPDATE movies
SET MPAA_Rating = "5.8"
WHERE id = "4"}
{UPDATE movies
SET MPAA_Rating = "8.3"
WHERE id = "1"}
{UPDATE movies
SET MPAA_Rating = "7.5"
WHERE id = "25"}
{UPDATE movies
SET MPAA_Rating = "6.8"
WHERE id = "34"}

/*Find all the ratings for the movie The Godfather, just show the title and rating*/
{SELECT movies.title, ratings.rating
FROM movies
INNER JOIN ratings ON movies.id = ratings.movie_id
WHERE id = "858"}

/*Order the previous objective by newest to oldest*/
{SELECT movies.title, ratings.rating, ratings.timestamp
FROM movies
INNER JOIN ratings ON movies.id = ratings.movie_id
WHERE id = "858"
ORDER BY ratings.timestamp DESC}

/*Find the comedies of 2005 and get the title and imdb from the links table*/
{SELECT movies.title, links.imdb_Id
FROM movies
INNER JOIN links ON movies.id = links.movie_Id
WHERE genres LIKE '%comedy%' AND title LIKE '%(2005)'}

/*Find all movies that have no ratings*/
{}

/*Get average rating for a movie*/
{SELECT AVG(rating)
FROM ratings
Where movie_id = '858'}

/*Get the total ratings for a movie*/
{SELECT COUNT(rating)
FROM ratings
Where movie_id = '858'}

/*Get the total movies for a genre*/
{SELECT COUNT(title)
FROM movies
WHERE genres LIKE '%comedy%'}

/*Get the average rating for a user*/
{SELECT AVG(rating)
FROM ratings
WHERE user_id = '15'}

/*Find the user with the most ratings*/
{SELECT COUNT(`rating`), `user_id`
FROM ratings
GROUP BY `user_id`
ORDER BY COUNT(`rating`) DESC
LIMIT 1}

/*Find the user with the highest average rating*/
{SELECT AVG(`rating`), `user_id`
FROM ratings
GROUP BY `user_id`
ORDER BY AVG(`rating`) DESC
LIMIT 1}

/*Find the user with the highest average rating with more than 50 reviews*/
{SELECT AVG(`rating`), `user_id`, COUNT(`rating`)
FROM ratings
GROUP BY `user_id`
HAVING COUNT(`rating`) > 50
ORDER BY AVG(`rating`) DESC
LIMIT 1}

/*Find the movies with an average rating over 4*/
{SELECT AVG(`rating`), `user_id`, COUNT(`rating`)
FROM ratings
GROUP BY `user_id`
HAVING AVG(`rating`) > 4
ORDER BY AVG(`rating`) DESC}
