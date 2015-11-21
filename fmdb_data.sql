PRAGMA foreign_keys = ON;

INSERT INTO Movie
(title, synopsis, runtime, budget)
VALUES
('Pirates of the Caribbean: On Stranger Tides',   	'Movie 1',  	152,  	378),
('Pirates of the Caribbean: At World''s End',		'Movie 2',		155,	300),
('John Carter', 									'Movie 3', 		206,	263),
('Tangled',											'Movie 4', 		208, 	260),
('Spider-Man 3',									'Movie 5', 		239,	258),
('Harry Potter and the Half-Blood Prince',			'Movie 6', 		129,	250),
('The Hobbit: The Battle of the Five Armies',		'Movie 7',		128,	250),
('Avatar',											'Movie 8',		165,	237),
('The Dark Knight Rises',							'Movie 9',		235,	230),
('The Chronicles of Narnia: Prince Caspian',		'Movie 10',		195,	225)
;

INSERT INTO Country
(name)
VALUES
('USA'),
('UK'),
('Portugal'),
('Canada'),
('Germany')
;

INSERT INTO AwardCategory
(name)
VALUES
('Best Film'),
('Best Lead Actor'),
('Best Lead Actress'),
('Best Supporting Actor'),
('Best Supporting Actress'),
('Best Cinematography'),
('Best Director'), 
('Best Screen Play'),
('Best Score'),
('Best Composer')
;

INSERT INTO AwardEvent
(name)
VALUES
('Academy Awards'),
('Art Directors Guild'),
('Satellite Awards'),
('Image Awards'),
('British Academy Film Awards'),
('Writers Guild of America'),
('Saturn Awards')
;

INSERT INTO Genre
(name)
VALUES
('Action'),
('Animation'),
('Comedy'),
('Documentary'),
('Family'),
('Film-Noir'),
('Horror'),
('Musical'),
('Romance'),
('Sport'),
('War'),
('Adventure'),
('Biography'),
('Crime'),
('Drama'),
('Fantasy'),
('History'),
('Music'),
('Mystery'),
('Sci-fi'),
('Thriller'),
('Western')
;

INSERT INTO Person 
(name, biography, date_of_birth) 
VALUES 
("Dolan Kent",			"Person 1 biography",	"2014-01-08"),
("Abraham Christian",	"Person 2 biography",	"1923-09-26"),
("Montana Rios",		"Person 3 biography",	"1991-04-29"),
("Nayda Wiley",			"Person 4 biography",	"1956-10-21"),
("Jonas Boyd",			"Person 5 biography",	"1981-10-22"),
("Garth Pena",			"Person 6 biography",	"1969-07-10"),
("Nadine Guy",			"Person 7 biography",	"1988-01-03"),
("Abdul Hawkins",		"Person 8 biography",	"1924-08-06"),
("Wilma Lamb",			"Person 9 biography",	"1909-01-03"),
("Iris Mccall",			"Person 10 biography",	"1989-04-28"),
("Lev Hood",			"Person 11 biography",	"1922-09-01"),
("Scarlet Hyde",		"Person 12 biography",	"1991-06-10"),
("Rinah Murphy",		"Person 13 biography",	"1967-08-27"),
("Jeanette Rocha",		"Person 14 biography",	"1980-09-29"),
("Kalia Hanson",		"Person 15 biography",	"1980-01-08"),
("Autumn Acosta",		"Person 16 biography",	"1932-02-24"),
("Lars Reed",			"Person 17 biography",	"1922-10-26"),
("Hyatt Bruce",			"Person 18 biography",	"1945-09-30"),
("Dylan Andrews",		"Person 19 biography",	"1904-12-11"),
("Roary Webb",			"Person 20 biography",	"1979-08-14"),
("Dominique Brown",		"Person 21 biography",	"1995-04-19"),
("Shaeleigh Branch",	"Person 22 biography",	"1954-06-22"),
("Steel Mccarthy",		"Person 23 biography",	"1945-09-14"),
("Lael Goff",			"Person 24 biography",	"1925-04-04"),
("Nayda Evans",			"Person 25 biography",	"1921-07-12"),
("Cora Bishop",			"Person 26 biography",	"1930-04-10"),
("Chloe Reed",			"Person 27 biography",	"1906-06-13"),
("Daryl Mack",			"Person 28 biography",	"1985-04-21")
;

INSERT INTO Character 
(name, biography) 
VALUES 
("Aline Freeman",		"Character 1 biography"),
("Davis Griffith",		"Character 2 biography"),
("Orlando Duffy",		"Character 3 biography"),
("Olivia Beach",		"Character 4 biography"),
("Barry Bruce",			"Character 5 biography"),
("Audrey Gordon",		"Character 6 biography"),
("Oleg Davidson",		"Character 7 biography"),
("Quamar Ashley",		"Character 8 biography"),
("MacKensie Watkins",	"Character 9 biography"),
("Deacon Pope",			"Character 10 biography"),
("Erich Valencia",		"Character 11 biography"),
("Montana Morton",		"Character 12 biography"),
("Vielka James",		"Character 13 biography"),
("Zelda Cooper",		"Character 14 biography"),
("Tana Noel",			"Character 15 biography"),
("Sean Lawrence",		"Character 16 biography"),
("Giacomo Reyes",		"Character 17 biography"),
("Rigel Coffey",		"Character 18 biography"),
("Hamilton Perkins",	"Character 19 biography"),
("Tatum Donaldson",		"Character 20 biography"),
("Haley Mendoza",		"Character 21 biography"),
("Xander Huff",			"Character 22 biography"),
("Erica Campos",		"Character 23 biography"),
("Coby Patterson",		"Character 24 biography"),
("Kelly Spencer",		"Character 25 biography"),
("Beau Mcknight",		"Character 26 biography"),
("Burke Griffin",		"Character 27 biography"),
("Uriah Odom",			"Character 28 biography")
;

INSERT INTO PersonCountry
(personID, countryID)
VALUES
(1,		(SELECT countryID FROM Country WHERE name = 'USA')),
(1,		(SELECT countryID FROM Country WHERE name = 'UK')),
(2,		(SELECT countryID FROM Country WHERE name = 'Canada')),
(2,		(SELECT countryID FROM Country WHERE name = 'Portugal')),
(3,		(SELECT countryID FROM Country WHERE name = 'UK')),
(4,		(SELECT countryID FROM Country WHERE name = 'Portugal')),
(5,		(SELECT countryID FROM Country WHERE name = 'Germany')),
(5,		(SELECT countryID FROM Country WHERE name = 'USA')),
(6,		(SELECT countryID FROM Country WHERE name = 'Canada')),
(7,		(SELECT countryID FROM Country WHERE name = 'Canada')),
(8,		(SELECT countryID FROM Country WHERE name = 'UK')),
(9,		(SELECT countryID FROM Country WHERE name = 'Canada')),
(10,	(SELECT countryID FROM Country WHERE name = 'Germany')),
(10,	(SELECT countryID FROM Country WHERE name = 'Portugal')),
(11,	(SELECT countryID FROM Country WHERE name = 'Canada')),
(12,	(SELECT countryID FROM Country WHERE name = 'USA')),
(13,	(SELECT countryID FROM Country WHERE name = 'Canada')),
(14,	(SELECT countryID FROM Country WHERE name = 'Portugal')),
(14,	(SELECT countryID FROM Country WHERE name = 'USA')),
(15,	(SELECT countryID FROM Country WHERE name = 'Canada')),
(15,	(SELECT countryID FROM Country WHERE name = 'Portugal')),
(16,	(SELECT countryID FROM Country WHERE name = 'UK')),
(16,	(SELECT countryID FROM Country WHERE name = 'Canada')),
(17,	(SELECT countryID FROM Country WHERE name = 'USA')),
(18,	(SELECT countryID FROM Country WHERE name = 'Canada')),
(18,	(SELECT countryID FROM Country WHERE name = 'Portugal')),
(19,	(SELECT countryID FROM Country WHERE name = 'UK')),
(19,	(SELECT countryID FROM Country WHERE name = 'Canada')),
(20,	(SELECT countryID FROM Country WHERE name = 'Canada')),
(20,	(SELECT countryID FROM Country WHERE name = 'USA')),
(21,	(SELECT countryID FROM Country WHERE name = 'Canada')),
(21,	(SELECT countryID FROM Country WHERE name = 'Germany')),
(22,	(SELECT countryID FROM Country WHERE name = 'Portugal')),
(23,	(SELECT countryID FROM Country WHERE name = 'UK')),
(24,	(SELECT countryID FROM Country WHERE name = 'USA')),
(25,	(SELECT countryID FROM Country WHERE name = 'Germany')),
(26,	(SELECT countryID FROM Country WHERE name = 'USA')),
(26,	(SELECT countryID FROM Country WHERE name = 'Portugal')),
(27,	(SELECT countryID FROM Country WHERE name = 'UK')),
(27,	(SELECT countryID FROM Country WHERE name = 'Germany')),
(28,	(SELECT countryID FROM Country WHERE name = 'USA')),
(28,	(SELECT countryID FROM Country WHERE name = 'Germany'))
;

INSERT INTO Trailer 
(movieID, length, release, title) 
VALUES 
((SELECT movieID FROM Movie WHERE title ='Pirates of the Caribbean: On Stranger Tides'),	118,	"2004-01-07",	"Trailer 1 title"),
((SELECT movieID FROM Movie WHERE title ='Pirates of the Caribbean: At World''s End'),		45,		"1997-05-01",	"Trailer 2 title"),
((SELECT movieID FROM Movie WHERE title ='John Carter'),									95,		"2005-03-07",	"First teaser"),
((SELECT movieID FROM Movie WHERE title ='Tangled'),										41,		"2004-08-05",	"Trailer 3 title"),
((SELECT movieID FROM Movie WHERE title ='Spider-Man 3'),									22,		"2002-09-11",	"Trailer 4 title"),
((SELECT movieID FROM Movie WHERE title ='Harry Potter and the Half-Blood Prince'),			99,		"1999-11-10",	"Trailer 5 title"),
((SELECT movieID FROM Movie WHERE title ='Avatar'),											110,	"2002-08-08",	"Technical preview"),
((SELECT movieID FROM Movie WHERE title ='The Hobbit: The Battle of the Five Armies'),		69,		"2002-01-18",	"Trailer 6 title"),
((SELECT movieID FROM Movie WHERE title ='The Chronicles of Narnia: Prince Caspian'),		95,		"2000-12-01",	"Trailer 7 title")
;

INSERT INTO MovieGenre 
(movieID, genreID) 
VALUES 
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides'), 	(SELECT genreID FROM Genre WHERE name = 'Drama')),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides'), 	(SELECT genreID FROM Genre WHERE name = 'Sci-fi')),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides'), 	(SELECT genreID FROM Genre WHERE name = 'Film-Noir')),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'), 	(SELECT genreID FROM Genre WHERE name = 'Adventure')),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'), 	(SELECT genreID FROM Genre WHERE name = 'Action')),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'), 	(SELECT genreID FROM Genre WHERE name = 'War')),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'), 	(SELECT genreID FROM Genre WHERE name = 'Music')),
((SELECT movieID FROM Movie WHERE title = 'John Carter'), 									(SELECT genreID FROM Genre WHERE name = 'Romance')),
((SELECT movieID FROM Movie WHERE title = 'John Carter'), 									(SELECT genreID FROM Genre WHERE name = 'Adventure')),
((SELECT movieID FROM Movie WHERE title = 'Spider-Man 3'), 									(SELECT genreID FROM Genre WHERE name = 'Family')),
((SELECT movieID FROM Movie WHERE title = 'Spider-Man 3'), 									(SELECT genreID FROM Genre WHERE name = 'Musical')),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'), 		(SELECT genreID FROM Genre WHERE name = 'Fantasy')),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'), 		(SELECT genreID FROM Genre WHERE name = 'Action')),
((SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies'), 	(SELECT genreID FROM Genre WHERE name = 'Action')),
((SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies'), 	(SELECT genreID FROM Genre WHERE name = 'History')),
((SELECT movieID FROM Movie WHERE title = 'Avatar'), 										(SELECT genreID FROM Genre WHERE name = 'Sci-fi')),
((SELECT movieID FROM Movie WHERE title = 'Avatar'), 										(SELECT genreID FROM Genre WHERE name = 'Action')),
((SELECT movieID FROM Movie WHERE title = 'The Dark Knight Rises'), 						(SELECT genreID FROM Genre WHERE name = 'Drama')),
((SELECT movieID FROM Movie WHERE title = 'The Dark Knight Rises'), 						(SELECT genreID FROM Genre WHERE name = 'Crime')),
((SELECT movieID FROM Movie WHERE title = 'The Chronicles of Narnia: Prince Caspian'), 		(SELECT genreID FROM Genre WHERE name = 'Family')),
((SELECT movieID FROM Movie WHERE title = 'The Chronicles of Narnia: Prince Caspian'), 		(SELECT genreID FROM Genre WHERE name = 'Sci-fi')),
((SELECT movieID FROM Movie WHERE title = 'The Chronicles of Narnia: Prince Caspian'), 		(SELECT genreID FROM Genre WHERE name = 'Fantasy'))
;

INSERT INTO Award
(awardDate, awardEventID, awardCategoryID, movieID) 
VALUES 
("2011-10-13",	(SELECT awardEventID FROM AwardEvent WHERE name = 'Academy Awards'),				(SELECT awardCategoryID FROM AwardCategory WHERE name = 'Best Lead Actress'),		3),
("2013-12-18",	(SELECT awardEventID FROM AwardEvent WHERE name = 'Image Awards'),					(SELECT awardCategoryID FROM AwardCategory WHERE name = 'Best Score'),				1),
("2012-07-05",	(SELECT awardEventID FROM AwardEvent WHERE name = 'Academy Awards'),				(SELECT awardCategoryID FROM AwardCategory WHERE name = 'Best Film'),				1),
("2013-05-21",	(SELECT awardEventID FROM AwardEvent WHERE name = 'Academy Awards'),				(SELECT awardCategoryID FROM AwardCategory WHERE name = 'Best Supporting Actor'),	7),
("2011-08-10",	(SELECT awardEventID FROM AwardEvent WHERE name = 'Satellite Awards'),				(SELECT awardCategoryID FROM AwardCategory WHERE name = 'Best Lead Actor'),			9),
("2013-12-30",	(SELECT awardEventID FROM AwardEvent WHERE name = 'Writers Guild of America'),		(SELECT awardCategoryID FROM AwardCategory WHERE name = 'Best Film'),				1),
("2013-06-01",	(SELECT awardEventID FROM AwardEvent WHERE name = 'British Academy Film Awards'),	(SELECT awardCategoryID FROM AwardCategory WHERE name = 'Best Supporting Actor'),	1),
("2014-07-20",	(SELECT awardEventID FROM AwardEvent WHERE name = 'Satellite Awards'),				(SELECT awardCategoryID FROM AwardCategory WHERE name = 'Best Supporting Actor'),	8),
("2015-12-15",	(SELECT awardEventID FROM AwardEvent WHERE name = 'Satellite Awards'),				(SELECT awardCategoryID FROM AwardCategory WHERE name = 'Best Director'),			4)
;

INSERT INTO AwardPerson 
(awardID, personID) 
VALUES 
(5,		21),
(8,		9),
(4,		17),
(6,		3),
(3,		20),
(8,		4)
;

INSERT INTO User 
(email, password, username, userType) 
VALUES
("turpis.Aliquam.adipiscing@molestieSed.ca",	"LIK52BUJB90ZSBLIK524FL",		"username1",	"N"),
("et.magna.Praesent@Duis.ca",					"ZUF42SZK0LIK52BUJ4FLLQ",		"username2",	"N"),
("eros@Mauris.co.uk",							"TQT05ZUF42SZK0LQTUF8WY",		"username3",	"P"),
("vel@maurissagittis.edu",						"OFZUF42SZK0LQA53HGS2HK",		"username4",	"N"),
("dolor.sit@ametdapibusid.net",					"ZRR01JJLM40VAW5AOWT3EF",		"username5",	"N"),
("lorem.auctor.quis@Sednecmetus.org",			"VID02KSSB90ZSBLIK529MZ",		"username6",	"N"),
("urna@Vivamusnisi.ca",							"LXL29NRCY18CMO8OZWH3PF",		"username7",	"C"),
("elit.Curabitur@Incondimentum.org",			"JLM40VAVID02KSS9MZW5AO",		"username8",	"P"),
("nunc.sed@non.org",							"BVB11DDIK63KWP6ZFWR4IT",		"username9",	"P"),
("tortor@odiosemper.org",						"RCVID02KSS9MZY18CMO8OZ",		"username10",	"N"),
("dis.parturient.montes@vestibulum.co.uk",		"CES99ADIK63KWP6ZFIF5RR",		"username11",	"N"),
("felis@id.ca",									"DIKLIP77PGL5II63KWP6ZF",		"username12",	"N"),
("enim.sit.amet@atsemmolestie.ca",				"DIK6UHB90ZSB4RC3KWP6ZF",		"username13",	"C"),
("justo@purus.com",								"FLS67UHB90ZSB4RCDEM4HJ",		"username14",	"C"),
("Quisque@idrisusquis.co.uk",					"LIP77PDIK63KWP6ZFGL5II",		"username15",	"N"),
("elit.pretium@molestieSedid.edu",				"UHB90ZSBLIK52BUJ4FL4RC",		"username16",	"N")
;

INSERT INTO JobType
(name)
VALUES
("Actor"),
("Director"),
("Composer"),
("Manager"),
("Producer"),
("Animator")
;

INSERT INTO Job
(title, jobTypeID)
VALUES
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Actor')),
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Actor')),
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Actor')),
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Actor')),
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Actor')),
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Director')),
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Composer')),
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Composer')),
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Manager')),
(null,			(SELECT jobTypeID FROM JobType WHERE name = 'Producer')),
('Executive',	(SELECT jobTypeID FROM JobType WHERE name = 'Producer')),
('Associate',	(SELECT jobTypeID FROM JobType WHERE name = 'Producer')),
('Assistant',	(SELECT jobTypeID FROM JobType WHERE name = 'Director'))
;

INSERT INTO PersonMovieJob
(personID, movieID, jobID)
VALUES
(1,		1,		1),
(1,		2,		2),
(2,		1,		7),
(2,		4,		8),
(3,		3,		10),
(4,		3,		12),
(5,		4,		6),
(5,		4,		9),
(6, 3, 11)
;

INSERT INTO CharacterJob
(characterID, jobID)
VALUES
(6,		1),
(4,		2),
(1,		3),
(4,		4),
(7,		5)
;

INSERT INTO Review
(score, body, userID, movieID)
VALUES
(7,		"Body 1",	(SELECT userID FROM User WHERE username = "username1"),	(SELECT movieID FROM Movie WHERE title = 'Tangled')),
(10,	"Body 2",	(SELECT userID FROM User WHERE username = "username1"),	(SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End')), 
(6,		"Body 3",	(SELECT userID FROM User WHERE username = "username5"),	(SELECT movieID FROM Movie WHERE title = 'Tangled')), 
(3,		"Body 4",	(SELECT userID FROM User WHERE username = "username5"),	(SELECT movieID FROM Movie WHERE title = 'Spider-Man 3')), 
(9,		"Body 5",	(SELECT userID FROM User WHERE username = "username2"),	(SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies')), 
(8,		"Body 6",	(SELECT userID FROM User WHERE username = "username7"),	(SELECT movieID FROM Movie WHERE title = 'The Chronicles of Narnia: Prince Caspian')), 
(5,		"Body 7",	(SELECT userID FROM User WHERE username = "username3"),	(SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides')), 
(10,	"Body 8",	(SELECT userID FROM User WHERE username = "username3"),	(SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince')), 
(10,	"Body 9",	(SELECT userID FROM User WHERE username = "username6"),	(SELECT movieID FROM Movie WHERE title = 'The Dark Knight Rises')),
(6,		"Body 10",	(SELECT userID FROM User WHERE username = "username8"),	(SELECT movieID FROM Movie WHERE title = 'Spider-Man 3'))
;

INSERT INTO Release
(movieID, countryID, release, earnings)
VALUES
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides'),	(SELECT countryID FROM Country WHERE name = 'USA'),			"2011-05-07",	104),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides'),	(SELECT countryID FROM Country WHERE name = 'UK'),			"2011-05-08",	80),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides'),	(SELECT countryID FROM Country WHERE name = 'Portugal'),	"2011-05-10",	85),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'),		(SELECT countryID FROM Country WHERE name = 'USA'),			"2007-05-06",	96),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'),		(SELECT countryID FROM Country WHERE name = 'UK'),			"2007-05-07",	102),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'),		(SELECT countryID FROM Country WHERE name = 'Portugal'),	"2007-05-07",	70),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'),		(SELECT countryID FROM Country WHERE name = 'Canada'),		"2007-05-10",	80),
((SELECT movieID FROM Movie WHERE title = 'John Carter'),									(SELECT countryID FROM Country WHERE name = 'USA'),			"2012-03-10",	50),
((SELECT movieID FROM Movie WHERE title = 'John Carter'),									(SELECT countryID FROM Country WHERE name = 'UK'),			"2012-03-11",	63),
((SELECT movieID FROM Movie WHERE title = 'Tangled'),										(SELECT countryID FROM Country WHERE name = 'USA'),			"2010-11-14",	59),
((SELECT movieID FROM Movie WHERE title = 'Tangled'),										(SELECT countryID FROM Country WHERE name = 'UK'),			"2010-11-16",	80),
((SELECT movieID FROM Movie WHERE title = 'Tangled'),										(SELECT countryID FROM Country WHERE name = 'Canada'),		"2010-11-18",	75),
((SELECT movieID FROM Movie WHERE title = 'Spider-Man 3'),									(SELECT countryID FROM Country WHERE name = 'USA'),			"2011-04-07",	89),
((SELECT movieID FROM Movie WHERE title = 'Spider-Man 3'),									(SELECT countryID FROM Country WHERE name = 'Germany'),		"2011-04-20",	85),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'),			(SELECT countryID FROM Country WHERE name = 'USA'),			"2007-04-16",	94),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'),			(SELECT countryID FROM Country WHERE name = 'UK'),			"2007-04-17",	93),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'),			(SELECT countryID FROM Country WHERE name = 'Canada'),		"2007-04-17",	100),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'),			(SELECT countryID FROM Country WHERE name = 'Germany'),		"2007-04-18",	90),
((SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies'),		(SELECT countryID FROM Country WHERE name = 'USA'),			"2014-12-11",	95),
((SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies'),		(SELECT countryID FROM Country WHERE name = 'UK'),			"2014-12-11",	74),
((SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies'),		(SELECT countryID FROM Country WHERE name = 'Canada'),		"2014-12-13",	85),
((SELECT movieID FROM Movie WHERE title = 'Avatar'),											(SELECT countryID FROM Country WHERE name = 'USA'),			"2009-12-10",	270),
((SELECT movieID FROM Movie WHERE title = 'Avatar'),											(SELECT countryID FROM Country WHERE name = 'UK'),			"2009-12-11",	250),
((SELECT movieID FROM Movie WHERE title = 'The Dark Knight Rises'),							(SELECT countryID FROM Country WHERE name = 'USA'),			"2012-08-20",	104),
((SELECT movieID FROM Movie WHERE title = 'The Dark Knight Rises'),							(SELECT countryID FROM Country WHERE name = 'UK'),			"2012-08-23",	115),
((SELECT movieID FROM Movie WHERE title = 'The Chronicles of Narnia: Prince Caspian'),		(SELECT countryID FROM Country WHERE name = 'UK'),			"2008-05-16",	41),
((SELECT movieID FROM Movie WHERE title = 'The Chronicles of Narnia: Prince Caspian'),		(SELECT countryID FROM Country WHERE name = 'Portugal'),	"2008-05-18",	30)
;

INSERT INTO AgeRating
(movieID, countryID, name, age, description)
VALUES
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides'),	(SELECT countryID FROM Country WHERE name = 'USA'),			"G",		1,		"Description 1"),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides'),	(SELECT countryID FROM Country WHERE name = 'UK'),			"G",		1,		"Description 2"),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides'),	(SELECT countryID FROM Country WHERE name = 'Portugal'),	"G",		1,		"Description 3"),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'),		(SELECT countryID FROM Country WHERE name = 'USA'),			"PG",		7,		"Description 4"),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'),		(SELECT countryID FROM Country WHERE name = 'UK'),			"PG",		7,		"Description 5"),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'),		(SELECT countryID FROM Country WHERE name = 'Portugal'),	"PG",		7,		"Description 6"),
((SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End'),		(SELECT countryID FROM Country WHERE name = 'Canada'),		"G",		3,		"Description 7"),
((SELECT movieID FROM Movie WHERE title = 'John Carter'),									(SELECT countryID FROM Country WHERE name = 'USA'),			"PG-13",	13,		"Description 8"),
((SELECT movieID FROM Movie WHERE title = 'John Carter'),									(SELECT countryID FROM Country WHERE name = 'UK'),			"PG-13",	13,		"Description 9"),
((SELECT movieID FROM Movie WHERE title = 'Tangled'),										(SELECT countryID FROM Country WHERE name = 'USA'),			"PG-13",	13,		"Description 10"),
((SELECT movieID FROM Movie WHERE title = 'Tangled'),										(SELECT countryID FROM Country WHERE name = 'UK'),			"PG-13",	13,		"Description 11"),
((SELECT movieID FROM Movie WHERE title = 'Tangled'),										(SELECT countryID FROM Country WHERE name = 'Canada'),		"PG",		6,		"Description 12"),
((SELECT movieID FROM Movie WHERE title = 'Spider-Man 3'),									(SELECT countryID FROM Country WHERE name = 'USA'),			"G",		2,		"Description 13"),
((SELECT movieID FROM Movie WHERE title = 'Spider-Man 3'),									(SELECT countryID FROM Country WHERE name = 'Germany'),		"G",		2,		"Description 14"),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'),		(SELECT countryID FROM Country WHERE name = 'USA'),			"PG",		10,		"Description 15"),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'),		(SELECT countryID FROM Country WHERE name = 'UK'),			"PG",		10,		"Description 16"),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'),		(SELECT countryID FROM Country WHERE name = 'Canada'),		"PG",		10,		"Description 17"),
((SELECT movieID FROM Movie WHERE title = 'Harry Potter and the Half-Blood Prince'),		(SELECT countryID FROM Country WHERE name = 'Germany'),		"PG",		10,		"Description 18"),
((SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies'),		(SELECT countryID FROM Country WHERE name = 'USA'),			"R",		16,		"Description 19"),
((SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies'),		(SELECT countryID FROM Country WHERE name = 'UK'),			"R",		16,		"Description 20"),
((SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies'),		(SELECT countryID FROM Country WHERE name = 'Canada'),		"R",		18,		"Description 21"),
((SELECT movieID FROM Movie WHERE title = 'Avatar'),										(SELECT countryID FROM Country WHERE name = 'USA'),			"R",		18,		"Description 22"),
((SELECT movieID FROM Movie WHERE title = 'Avatar'),										(SELECT countryID FROM Country WHERE name = 'UK'),			"R",		17,		"Description 23"),
((SELECT movieID FROM Movie WHERE title = 'The Dark Knight Rises'),							(SELECT countryID FROM Country WHERE name = 'USA'),			"G",		6,		"Description 24"),
((SELECT movieID FROM Movie WHERE title = 'The Dark Knight Rises'),							(SELECT countryID FROM Country WHERE name = 'UK'),			"G",		2,		"Description 25"),
((SELECT movieID FROM Movie WHERE title = 'The Chronicles of Narnia: Prince Caspian'),		(SELECT countryID FROM Country WHERE name = 'UK'),			"PG",		11,		"Description 26"),
((SELECT movieID FROM Movie WHERE title = 'The Chronicles of Narnia: Prince Caspian'),		(SELECT countryID FROM Country WHERE name = 'Portugal'),	"PG",		12,		"Description 27")
;


INSERT INTO MovieList
(userID, name)
VALUES
((SELECT userID FROM User WHERE username = "username1"),	"To see later"),
((SELECT userID FROM User WHERE username = "username1"),	"Best"),
((SELECT userID FROM User WHERE username = "username5"),	"Family movies"),
((SELECT userID FROM User WHERE username = "username5"),	"Recommended"),
((SELECT userID FROM User WHERE username = "username6"),	"Best 2014"),
((SELECT userID FROM User WHERE username = "username8"),	"Not to see again")
;

INSERT INTO MovieListMovie
(movieListID, movieID)
VALUES
((SELECT MovieListID FROM MovieList WHERE name = 'To see later' AND userID == 1),		(SELECT movieID FROM Movie WHERE title = 'The Hobbit: The Battle of the Five Armies')),
((SELECT MovieListID FROM MovieList WHERE name = 'To see later' AND userID == 1),		(SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: At World''s End')),
((SELECT MovieListID FROM MovieList WHERE name = 'Best' AND userID == 1),				(SELECT movieID FROM Movie WHERE title = 'Avatar')),
((SELECT MovieListID FROM MovieList WHERE name = 'Best' AND userID == 1),				(SELECT movieID FROM Movie WHERE title = 'John Carter')),
((SELECT MovieListID FROM MovieList WHERE name = 'Best' AND userID == 1),				(SELECT movieID FROM Movie WHERE title = 'Pirates of the Caribbean: On Stranger Tides')),
((SELECT MovieListID FROM MovieList WHERE name = 'Recommended' AND userID == 5),		(SELECT movieID FROM Movie WHERE title = 'The Chronicles of Narnia: Prince Caspian')),
((SELECT MovieListID FROM MovieList WHERE name = 'Not to see again' AND userID == 8),	(SELECT movieID FROM Movie WHERE title = 'John Carter')),
((SELECT MovieListID FROM MovieList WHERE name = 'Not to see again' AND userID == 8),	(SELECT movieID FROM Movie WHERE title = 'Spider-Man 3'))
;

INSERT INTO Article
(title, body, publication, userID)
VALUES
('Title 1',  'Body 1',  '2005-10-20 14:02:52', 7),
('Title 2',  'Body 2',  '2005-11-02 10:44:49', 14),
('Title 3',  'Body 3',  '2006-12-07 06:39:58', 7),
('Title 4',  'Body Tangled 4',  '2009-09-16 14:01:08', 13),
('Title 5',  'Body 5',  '2010-01-11 11:18:35', 7),
('Title 6',  'Body 6',  '2011-02-02 18:28:27', 13),
('Title 7',  'Body Tangled 7',  '2011-10-29 19:57:30', 14),
('Title 8',  'Body Tangled  8',  '2012-02-20 04:50:02', 13),
('Title 9',  'Body 9',  '2012-11-13 11:44:30', 7),
('Title 10', 'Body 10', '2015-02-21 09:38:25', 7)
;

