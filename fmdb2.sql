PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS AgeRating;
CREATE TABLE AgeRating (
	name TEXT NOT NULL,
	age INTEGER,
	description TEXT NOT NULL,
	--ageRatingID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	movieID INTEGER REFERENCES Movie(movieID),
	countryID INTEGER REFERENCES Country(countryID),
	--CONSTRAINT unq UNIQUE(movieID, countryID)
	CONSTRAINT unq1 FOREIGN KEY(movieID) REFERENCES Movie(movieID),
	CONSTRAINT unq2 FOREIGN KEY(countryID) REFERENCES Country(countryID)
);

DROP TABLE IF EXISTS Article;
CREATE TABLE Article (
	title TEXT NOT NULL,
	publication DATE,
	body TEXT NOT NULL,
	articleID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	userID INTEGER REFERENCES User(userID) 
);

DROP TABLE IF EXISTS Award;
CREATE TABLE Award (
	awardDate DATE,
	awardID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	awardEventID INTEGER REFERENCES AwardEvent(AwardEventID),
	awardCategoryID INTEGER REFERENCES AwardCategory(AwardCategoryID),
	movieID INTEGER REFERENCES Movie(movieID),
	CONSTRAINT unq UNIQUE(awardID, awardEventID, awardCategoryID, movieID)
);

DROP TABLE IF EXISTS AwardCategory;
CREATE TABLE AwardCategory (
	name TEXT NOT NULL UNIQUE,
	awardCategoryID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

DROP TABLE IF EXISTS AwardEvent;
CREATE TABLE AwardEvent (
	name TEXT NOT NULL UNIQUE,
	awardEventID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

DROP TABLE IF EXISTS AwardPerson;
CREATE TABLE AwardPerson (
	personID INTEGER REFERENCES Person(personID),
	awardID INTEGER REFERENCES Award(awardID),
	PRIMARY KEY (awardID, personID)
);

DROP TABLE IF EXISTS Character;
CREATE TABLE Character (
	name TEXT NOT NULL,
	biography TEXT,
	characterID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

DROP TABLE IF EXISTS CharacterJob;
CREATE TABLE CharacterJob (
	characterID INTEGER REFERENCES Character(characterID),
	jobID INTEGER REFERENCES Job(jobID),
	PRIMARY KEY (characterID, jobID)
);

DROP TABLE IF EXISTS Country;
CREATE TABLE Country (
	name TEXT NOT NULL UNIQUE,
	countryID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

DROP TABLE IF EXISTS Genre;
CREATE TABLE Genre (
	name TEXT NOT NULL UNIQUE,
	genreID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

DROP TABLE IF EXISTS Job;
CREATE TABLE Job (
	title TEXT,
	jobID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	jobTypeID INTEGER REFERENCES JobType(JobTypeID) 
);

DROP TABLE IF EXISTS JobType;
CREATE TABLE JobType (
	name TEXT NOT NULL UNIQUE,
	jobTypeID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

DROP TABLE IF EXISTS Movie;
CREATE TABLE Movie (
	title TEXT NOT NULL,
	synopsis TEXT,
	runtime INTEGER,
	averageScore REAL,
	totalEarnings INTEGER,
	budget INTEGER,
	movieID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	CHECK(runtime > 0),
	CHECK(budget >= 0),
	CHECK(averageScore >= 0 AND averageScore <= 10),
	CHECK(totalEarnings >= 0)  
);

DROP TRIGGER IF EXISTS OnMovieCreate;
CREATE TRIGGER OnMovieCreate
AFTER INSERT ON Movie
BEGIN
	UPDATE Movie 
	SET averageScore = 0, totalEarnings = 0
	WHERE movieID = NEW.movieID;
END;

DROP TABLE IF EXISTS MovieGenre;
CREATE TABLE MovieGenre (
	movieID INTEGER REFERENCES Movie(movieID),
	genreID INTEGER REFERENCES Genre(genreID),
	PRIMARY KEY (genreID, movieID)
);

DROP TABLE IF EXISTS MovieList;
CREATE TABLE MovieList (
	name TEXT,
	movieListID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	userID INTEGER NOT NULL REFERENCES User(userID),
	CONSTRAINT unq UNIQUE (name, userID)
);

DROP TABLE IF EXISTS MovieListMovie;
CREATE TABLE MovieListMovie (
	movieListID INTEGER REFERENCES MovieList(movieListID),
	movieID INTEGER REFERENCES Movie(movieID),
	PRIMARY KEY (movieListID, movieID)
);

DROP TABLE IF EXISTS Person;
CREATE TABLE Person (
	name TEXT NOT NULL,
	date_of_birth DATE,
	biography TEXT,
	personID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

DROP TABLE IF EXISTS PersonCountry;
CREATE TABLE PersonCountry (
	countryID INTEGER REFERENCES Country(countryID),
	personID INTEGER REFERENCES Person(personID),
	PRIMARY KEY(countryID, personID)
);

DROP TABLE IF EXISTS PersonMovieJob;
CREATE TABLE PersonMovieJob (
	personID INTEGER REFERENCES Person(personID),
	movieID INTEGER REFERENCES Movie(movieID),
	jobID INTEGER UNIQUE REFERENCES Job(jobID),
	PRIMARY KEY (personID, movieID, jobID)
);

DROP TABLE IF EXISTS Release;
CREATE TABLE Release (
	release DATE,
	earnings INTEGER,
	--releaseID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	movieID INTEGER REFERENCES Movie(movieID),
	countryID INTEGER REFERENCES Country(countryID),
	CHECK(earnings > 0),
	--CONSTRAINT unq UNIQUE(movieID, countryID)
	CONSTRAINT unq1 FOREIGN KEY(movieID) REFERENCES Movie(movieID),
	CONSTRAINT unq2 FOREIGN KEY(countryID) REFERENCES Country(countryID)
);

DROP TABLE IF EXISTS Review;
CREATE TABLE Review (
	score INTEGER NOT NULL,
	body TEXT,
	movieID INTEGER,
	userID INTEGER,
	CHECK(score > 0 AND score <= 10),
	CONSTRAINT unq1 FOREIGN KEY(movieID) REFERENCES Movie(movieID),
	CONSTRAINT unq2 FOREIGN KEY(userID) REFERENCES User(userID)
);

DROP TABLE IF EXISTS Trailer;
CREATE TABLE Trailer (
	title TEXT NOT NULL,
	release DATE,
	length INTEGER,
	trailerID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	movieID INTEGER REFERENCES Movie(movieID),
	CHECK(length > 0)
);

DROP TABLE IF EXISTS User;
CREATE TABLE User (
	username TEXT NOT NULL UNIQUE,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL,
	points INTEGER,
	userType CHAR NOT NULL,
	userID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);
DROP TRIGGER IF EXISTS OnReviewCreate;
CREATE Trigger OnReviewCreate
AFTER INSERT ON Review
BEGIN
 UPDATE Movie 
 SET averageScore = (Movie.averageScore * ((SELECT COUNT(*) FROM Review WHERE movieID = NEW.movieID) - 1) + NEW.score) / ((SELECT COUNT(*) FROM Review WHERE movieID = NEW.movieID))
 WHERE movieID = NEW.movieID;
END;
