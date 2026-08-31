CREATE TABLE MovieDetails (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(100),
    Director VARCHAR(100),
    ReleaseYear INT
)
INSERT INTO MovieDetails (MovieID, Title, Genre, Director, ReleaseYear)
VALUES 
(1, 'The Dark Knight', 'Action, Crime, Drama', 'Christopher Nolan', 2008),
(2, 'Inception', 'Action, Sci-Fi', 'Christopher Nolan', 2010),
(3, '3 Idiots', 'Comedy, Drama', 'Rajkumar Hirani', 2009),
(4, 'Parasite', 'Drama, Thriller', 'Bong Joon Ho', 2019),
(5, 'The Matrix', 'Action, Sci-Fi', 'Lana Wachowski, Lilly Wachowski', 1999)

CREATE TABLE MovieFinancials (
    FinancialID INT PRIMARY KEY,
    BudgetUSD DECIMAL(12,2),
    BoxOfficeUSD DECIMAL(12,2),
    MovieID INT,
    
    CONSTRAINT FK_Financials_MovieDetails 
        FOREIGN KEY (MovieID) 
        REFERENCES MovieDetails(MovieID)
)
INSERT INTO MovieFinancials (FinancialID, BudgetUSD, BoxOfficeUSD, MovieID)
VALUES 
(101, 185000000.00, 1004000000.00, 1),
(102, 160000000.00, 836000000.00, 2),  
(103, 7700000.00, 65000000.00, 3),     
(104, 11400000.00, 258000000.00, 4),  
(105, 63000000.00, 460000000.00, 5)

CREATE TABLE MovieRatingsDuration (
    RatingID INT PRIMARY KEY,
    DurationMin INT,
    Rating DECIMAL(12,2),
    Language VARCHAR(100),
    Country VARCHAR(100),
    MovieID INT,
    
    CONSTRAINT FK_Ratings_MovieDetails 
        FOREIGN KEY (MovieID) 
        REFERENCES MovieDetails(MovieID)
)
INSERT INTO MovieRatingsDuration (RatingID, DurationMin, Rating, Language, Country, MovieID)
VALUES 
(201, 152, 9.0, 'English', 'USA', 1),
(202, 148, 8.8, 'English', 'USA', 2),
(203, 170, 8.4, 'Hindi', 'India', 3),
(204, 132, 8.6, 'Korean', 'South Korea', 4),
(205, 136, 8.7, 'English', 'USA', 5)

SELECT * FROM MovieDetails
SELECT * FROM MovieFinancials
SELECT * FROM MovieRatingsDuration

--Consider above table schema and write following queries:
--1. Retrive first five distinct movies along with their title from MovieDetails table.

   SELECT DISTINCT TOP 5 Title FROM MovieDetails

--2. Display the total of the BudgetUSD and BoxOfficeUSD assign the name TotalUSD from MovieFinancials.

    SELECT (BudgetUSD + BoxOfficeUSD) AS TotalUSD 
    FROM MovieFinancials

--3. Insert the new row with this data (11,The Incredible Hulk, Action, Louis Leterrier,2008) in MovieDetails
--table.

    INSERT INTO MovieDetails (MovieID, Title, Genre, Director, ReleaseYear)
    VALUES (11, 'The Incredible Hulk', 'Action', 'Louis Leterrier', 2008)

--4. Set the value of the genre to ‘Action’ of ‘Avengers:Endgame’ movie from MovieDetails table.

    UPDATE MovieDetails
    SET Genre = 'Action'
    WHERE Title = 'Avengers:Endgame'

--5. Delete the records with duration of 181 minutes from MovieRatingsDuration table.

    DELETE FROM MovieRatingsDuration
    WHERE DurationMin = 181

--6. Add a new column ‘Producer’ into the MovieDetails table.

    ALTER TABLE MovieDetails
    ADD Producer VARCHAR(100)

--7. Delete records of MovieFinancials table without removing its table structure.

    TRUNCATE TABLE MovieFinancials

--8. Retrive all the movies from MovieDetails table with title starting with ‘The’.
    SELECT * 
    FROM MovieDetails
    WHERE Title LIKE 'The%'

--9. Retrive name of directors includes ‘son’ from MovieDetails table.\

    SELECT Director 
    FROM MovieDetails
    WHERE Director LIKE '%son%'

--10. Convert and display title of all movies in uppercase.

    SELECT UPPER(Title) AS UppercaseTitle 
    FROM MovieDetails

--11. Display the highest rating from the MovieRatingsDuration table.

    SELECT MAX(Rating) AS HighestRating 
    FROM MovieRatingsDuration

--12. Calculate the years between current year and movies release year.

    SELECT Title, ReleaseYear, (YEAR(GETDATE()) - ReleaseYear) AS YearsSinceRelease 
    FROM MovieDetails
    
--13. Find the languages in which movies have an average rating of greater than 8.0. Display the language
--and the average rating.

    SELECT Language, AVG(Rating) AS AverageRating
    FROM MovieRatingsDuration
    GROUP BY Language
    HAVING AVG(Rating) > 8.0

--14. Retrieve the minimum, maximum, and average movie duration for each language in the
--MovieRatingsDuration table, but display only those languages where the average rating is greater than
--7.5.

    SELECT 
    Language, 
    MIN(DurationMin) AS MinDuration, 
    MAX(DurationMin) AS MaxDuration, 
    AVG(DurationMin) AS AvgDuration
    FROM MovieRatingsDuration
    GROUP BY Language
    HAVING AVG(Rating) > 7.5

--15. Find the titles of movies whose budget is higher than the average budget of all movies.(Do not use
--JOINS)

    SELECT Title 
    FROM MovieDetails 
    WHERE MovieID IN (
    SELECT MovieID 
    FROM MovieFinancials 
    WHERE BudgetUSD > (SELECT AVG(BudgetUSD) FROM MovieFinancials)
    )

--16. Find the titles of movies that have a box office revenue greater than the average box office revenue of
--all movies.

    SELECT MD.Title 
    FROM MovieDetails MD
    JOIN MovieFinancials MF ON MD.MovieID = MF.MovieID
    WHERE MF.BoxOfficeUSD > (
    SELECT AVG(BoxOfficeUSD) 
    FROM MovieFinancials
    )

--17. Create a view with Rating, Language and Country columns with no data and named it MovieReview.

    CREATE VIEW MovieReview AS
    SELECT Rating, Language, Country
    FROM MovieRatingsDuration
    WHERE 1 = 0

--18. List all movies that have the same director but different genres, displaying the director’s name, both
--movie titles, and their respective genres.

    SELECT 
    M1.Director, 
    M1.Title AS Movie1_Title, 
    M1.Genre AS Movie1_Genre, 
    M2.Title AS Movie2_Title, 
    M2.Genre AS Movie2_Genre
    FROM MovieDetails M1
    JOIN MovieDetails M2 ON M1.Director = M2.Director
    WHERE M1.Genre <> M2.Genre 
    AND M1.MovieID < M2.MovieID

--19. Retrieve the title, director, and box office earnings for all movies that were released after 2010, along
--with their ratings.

    SELECT 
    MD.Title, 
    MD.Director, 
    MF.BoxOfficeUSD, 
    MRD.Rating
    FROM MovieDetails MD
    JOIN MovieFinancials MF ON MD.MovieID = MF.MovieID
    JOIN MovieRatingsDuration MRD ON MD.MovieID = MRD.MovieID
    WHERE MD.ReleaseYear > 2010

--20. List all directors and the number of movies they have directed, but only include directors who have
--directed more than 1 movie.

    SELECT 
    Director, 
    COUNT(MovieID) AS NumberOfMovies
    FROM MovieDetails
    GROUP BY Director
    HAVING COUNT(MovieID) > 1
