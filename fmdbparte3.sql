
--TOD
DROP VIEW IF EXISTS PublicUser;
CREATE VIEW PublicUser
AS 
SELECT userID, username, points, 
CASE userType WHEN 'C' THEN 'Contributor' WHEN 'P' THEN 'Premium' WHEN 'N' THEN 'Normal' ELSE 'Unknown' END AS Type
FROM User
;


--Atualizacao do averageScore de um Movie ao inserir uma Review, como a media de todas as Reviews escritas sobre o filme
DROP TRIGGER IF EXISTS OnReviewCreate;
CREATE Trigger OnReviewCreate
AFTER INSERT ON Review
BEGIN
 UPDATE Movie 
 SET averageScore = (Movie.averageScore * ((SELECT COUNT(*) FROM Review WHERE movieID = NEW.movieID) - 1) + NEW.score) / ((SELECT COUNT(*) FROM Review WHERE movieID = NEW.movieID))
 WHERE movieID = NEW.movieID;
END;

--Atualizacao de totalEarnings ao inserir uma Release, como a soma de todos os earnings de todas as suas Releases
DROP TRIGGER IF EXISTS OnRelease;
CREATE TRIGGER OnRelease
AFTER INSERT ON Release
BEGIN
 UPDATE Movie 
 SET 
	totalEarnings =  Movie.totalEarnings + NEW.earnings 
	WHERE movieID = NEW.movieID;
END;

--ao introduzir uma review com score máximo, criar uma movielist que ira contem todas os filmes que o utilizador classificou com essa pontuacao
DROP TRIGGER IF EXISTS MaxReviewScore;
CREATE TRIGGER MaxReviewScore
BEFORE INSERT ON Review
FOR EACH ROW
WHEN NEW.score = 10 and (SELECT MovieList.movieListID FROM MovieList WHERE name = 'Class 10' AND userID = NEW.userID ) IS NULL
BEGIN
	INSERT INTO MovieList (userID, name) VALUES(NEW.userID, 'Class 10');
END
;

--ao introduzir uma review com score máximo, introduzir o filme numa lista de outros com a mesma classificação
DROP TRIGGER IF EXISTS MaxReviewScore2;
CREATE TRIGGER MaxReviewScore2
AFTER INSERT ON Review
FOR EACH ROW
WHEN NEW.score = 10 
BEGIN
	INSERT INTO MovieListMovie (movieListID, movieID) VALUES ((SELECT movieListID FROM MovieList WHERE MovieList.userID = NEW.userID AND MovieList.name = 'Class 10'), NEW.movieID);
END
;

--para cada pessoa calcular a media das reviews e a soma dos total_earning dos filmes em que participa
SELECT Person.name, AVG(Movie.averageScore), SUM(Movie.totalEarnings)
FROM Person, Movie, (SELECT DISTINCT PersonMovieJob.personID AS a, PersonMovieJob.movieID AS b FROM PersonMovieJob) AS temp
WHERE Movie.movieID = temp.b AND temp.a = Person.personID
group by personID;

--para cada User é criada automaticamente uma lista chamada Watch List
DROP TRIGGER IF EXISTS OnUserCreate;
CREATE TRIGGER OnUserCreate
AFTER INSERT ON User
FOR EACH ROW
BEGIN
	INSERT INTO MovieList (userID, name) VALUES (NEW.userID, 'Watch List');
END
;

--lista de personagens, os filmes a que pertencem, ordenados pelo numero de premios ganhos em categorias distintas pelo filme
SELECT Character.name, temp.tit AS movie, COUNT(temp.ACat) AS Different_Categories
FROM
(SELECT DISTINCT Movie.title AS tit, Movie.movieID AS mov , AwardCategory.name, AwardCategory.awardCategoryID AS ACat
FROM AwardCategory, Award, Movie
WHERE AwardCategory.awardCategoryID = Award.awardCategoryID AND Award.movieID = Movie.movieID
) AS temp, Character, CharacterJob, PersonMovieJob
WHERE temp.mov = PersonMovieJob.movieID AND PersonMovieJob.jobID = CharacterJob.jobID AND CharacterJob.characterID = Character.characterID
GROUP BY temp.mov
ORDER BY Different_Categories DESC
;

--lista de filmes com um age Rating cuja idade é superior à idade de algum dos actores que nele participam
SELECT Movie.Title, tempmax.maxagelim AS Age_Limit, tempmin.Youngest AS Youngest_Actor, tempmin.Age AS Youngest_Age
FROM 
	(SELECT Movie.movieID AS movs, MAX(AgeRating.age) AS maxagelim
	FROM Movie, AgeRating
	WHERE AgeRating.movieID = Movie.movieID
	GROUP BY Movie.movieID) AS tempmax,
	(SELECT Person.name AS Youngest, MIN((datetime('now') - Person.date_of_birth)) AS Age, Movie.movieID AS movs
	FROM Movie, Person, PersonMovieJob, Job, JobType
	WHERE  PersonMovieJob.personID = Person.personID AND PersonMovieJob.movieID = Movie.movieID AND Job.jobID = PersonMovieJob.jobID and Job.jobTypeID = JobType.jobTypeID and JobType.name = "Actor"
	GROUP BY Movie.MovieID) AS tempmin,
	Movie
WHERE Movie.movieID = tempmax.movs AND Movie.movieID = tempmin.movs AND Age_Limit > Youngest_Age
;

--para cada utilizador, para cada pessoa, determinar a media das classificacoes dos filmes a que pertencem
SELECT User.username, temp.personName, AVG(Review.score)
FROM User, Review, Person,
(SELECT DISTINCT Person.name AS personName, Person.personID AS personID, Movie.movieID AS movieID
FROM Review, Person, Movie, PersonMovieJob
WHERE Person.personID = PersonMovieJob.personID AND PersonMovieJob.movieID = Movie.movieID) AS temp
WHERE Review.userID = User.userID AND Review.movieID = temp.movieID
GROUP BY User.userID, temp.personID
;

--ao inserir uma review, caso o utilizador seja premium, adicionar pontos consoante o número de reviews que existirem para o filme em questão
DROP TRIGGER IF EXISTS UpdatePoints;
CREATE TRIGGER UpdatePoints
AFTER INSERT ON Review
BEGIN

        UPDATE USER
        SET	
                points = points +
                (
                CASE
                        WHEN (SELECT COUNT(*) FROM Review WHERE movieID = NEW.movieID) < 10 THEN 20
                        WHEN (SELECT COUNT(*) FROM Review WHERE movieID = NEW.movieID) < 50 THEN 10
                        WHEN (SELECT COUNT(*) FROM Review WHERE movieID = NEW.movieID) >= 50 THEN 5
                END
                )
        WHERE
                userID = NEW.userID AND userType = "P";
END
;
--para cada filme somar o número de pessoas de cada nacionalidade
SELECT title, CountryName, COUNT(name) AS People_from_Country
FROM
        (SELECT DISTINCT Movie.title, Person.name, Country.name AS CountryName
        FROM Movie, Country, PersonMovieJob, Person, PersonCountry
        WHERE Movie.movieID = PersonMovieJob.movieID AND Person.personID = PersonMovieJob.personID AND PersonMovieJob.personID = PersonCountry.personID AND PersonCountry.countryID = Country.countryID)
GROUP BY CountryName, title
ORDER BY title DESC
;

-- evita que sejam publicados artigos por utilizadores que nao sejam contribuidores
DROP TRIGGER IF EXISTS OnArticleCreate;
CREATE TRIGGER OnArticleCreate
BEFORE INSERT ON Article
FOR EACH ROW
WHEN (SELECT 1 FROM User WHERE userID = NEW.userID and User.userType = 'C') IS NULL
BEGIN
        SELECT RAISE ( ABORT, "User isnt a contributor" );
END
;




-- determina o número de awards por cada género de filme
SELECT Genre.name as genreName, count(Award.awardID) AS numberAwards 
FROM MovieGenre, Award, Genre
WHERE MovieGenre.movieID == Award.movieID AND MovieGenre.genreID == Genre.genreID
GROUP BY MovieGenre.genreID
ORDER BY numberAwards DESC;

-- determina as próximas releases num país
SELECT Country.name, Movie.title, Release.release
FROM Movie, Country, Release
WHERE Movie.movieID = Release.movieID AND Country.countryID = Release.countryID AND julianday(Release.release) > julianday('now');


--quinto pais com melhor media de lucros
SELECT temp.name as Country_Name, AVG(temp.Profit) as Average_Profit
FROM (SELECT Country.name as name, Movie.movieID, Movie.totalEarnings-Movie.budget AS Profit
FROM Country, Movie, Release
WHERE Country.countryID = Release.countryID 
	AND Movie.movieID = Release.countryID) AS temp
GROUP BY Country_Name
ORDER BY Average_Profit DESC
LIMIT 1 OFFSET 4
;

-- determina, para cada pessoa, o género de filme em que participou que tem melhor média de classificações
SELECT personName, max(avgScore) AS maxAverageScore, genreName 
FROM (
	SELECT Person.name AS personName, avg(Movie.averageScore) AS avgScore, Genre.name AS genreName 
	FROM Genre, Movie, Person, MovieGenre, PersonMovieJob
	WHERE MovieGenre.movieID = Movie.movieID
	AND Genre.genreID = MovieGenre.genreID
	AND PersonMovieJob.movieID = Movie.movieID
	AND PersonMovieJob.personID = Person.personID
	GROUP BY person.personID, genre.genreID
)
WHERE avgScore > 0
GROUP BY personName;

--contar artigos que referem a cada filme
SELECT temp.Title as Moive_Title, SUM(temp.refs) AS Article_References
FROM 
(SELECT Movie.movieID as id, Movie.Title as Title, (CASE WHEN instr(Article.body, Movie.title) + instr(Article.title, Movie.title) THEN 1 ELSE 0 END)as refs
FROM Movie, Article) as temp
GROUP BY temp.id
;

