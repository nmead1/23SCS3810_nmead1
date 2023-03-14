-- CS3810: Principles of Database Systems
-- Instructor: Thyago Mota
-- Student: Nathan Mead
-- Description: Star Wars Database (SQL Competition)

CREATE DATABASE starwars;

\c starwars 

-------------
-- Age Groups 
-------------
CREATE TABLE AgeGroups (
    seq INT PRIMARY KEY, 
    description VARCHAR(15) NOT NULL
);

INSERT INTO AgeGroups VALUES 
    (1, '18-29'),
    (2, '30-44'), 
    (3, '45-60'), 
    (4, '> 60');

-------------------
-- Education Levels
-------------------
CREATE TABLE EducationLevels (
    seq INT PRIMARY KEY, 
    description VARCHAR(35) NOT NULL
);

INSERT INTO EducationLevels VALUES 
    (1, 'Less than high school degree'), 
    (2, 'High school degree'), 
    (3, 'Some college or Associate degree'), 
    (4, 'Bachelor degree'), 
    (5, 'Graduate degree');

----------------
-- Income Levels
----------------

CREATE TABLE IncomeLevels (
    seq INT PRIMARY KEY, 
    description VARCHAR(20) NOT NULL
);

INSERT INTO IncomeLevels VALUES 
    (1, '$0 - $24,999'), 
    (2, '$25,000 - $49,999'), 
    (3, '$50,000 - $99,999'), 
    (4, '$100,000 - $149,999'), 
    (5, '$150,000+');
-------
-- Fans
-------

CREATE TABLE Fans (
    id INT PRIMARY KEY, 
    age INT NOT NULL, 
    FOREIGN KEY (age) REFERENCES AgeGroups (seq), 
    education INT NOT NULL, 
    FOREIGN KEY (education) REFERENCES EducationLevels (seq), 
    income INT NOT NULL, 
    FOREIGN KEY (income) REFERENCES IncomeLevels (seq)
);

INSERT INTO Fans VALUES (6716,3,5,3), (29200,3,5,5), (67921,1,4,1), (53421,4,3,3), (61095,3,5,1), (24538,4,2,3), (62261,2,4,4), (22914,1,5,4), (71014,4,3,1), (75527,1,4,5), (99091,4,3,5), (92452,4,4,5), (28828,2,1,4), (32263,4,4,4), (28614,3,5,2), (28135,2,5,4), (20833,2,3,5), (83326,2,2,3), (12066,2,3,3), (17471,3,4,2), (87061,3,2,1), (35702,4,2,1), (52800,4,5,3), (90408,3,3,1), (6059,2,1,1), (89267,2,3,4), (57944,4,3,2), (28862,4,1,4), (56245,1,5,2), (55130,4,3,4), (45888,3,5,5), (51197,4,5,2), (9744,2,1,3), (36082,3,2,4), (61838,3,4,1), (73015,1,2,4), (65081,1,1,5), (71319,2,3,1), (7303,3,4,2), (93926,1,3,4), (25837,4,2,2), (73175,2,3,5), (83285,3,1,1), (87081,4,5,3), (77673,1,2,2), (93583,4,1,5), (39629,3,1,2), (49925,2,2,3), (75130,2,4,2), (1017,4,5,1), (37128,4,1,2), (33108,1,3,2), (20144,4,2,1), (46722,2,5,4), (93341,1,2,3), (69497,3,4,4), (69516,1,1,3), (6813,2,4,5), (85264,4,4,4), (71989,1,2,2), (34695,2,5,1), (69478,1,3,5), (25077,2,1,4), (31257,2,5,5), (93816,2,5,1), (86110,1,2,2), (42418,4,3,3), (85130,1,4,5), (54553,3,5,3), (82117,2,3,5), (17788,2,5,1), (61522,4,1,5), (17118,3,5,1), (33174,1,2,4), (5077,4,3,1), (99981,4,1,5), (94242,4,3,2), (98230,4,4,4), (18077,1,5,4), (94645,1,1,5), (89060,1,1,3), (58860,2,1,4), (65849,4,2,1), (55124,2,3,3), (67759,1,3,5), (47557,4,1,3), (44648,2,4,1), (45198,1,5,3), (34610,2,1,4), (69057,1,5,4), (39140,1,4,1), (43680,4,5,1), (52470,3,2,3), (78774,1,1,2), (20687,4,3,4), (10474,1,1,2), (16695,1,2,2), (7112,2,3,1), (32452,4,2,2), (39800,4,5,1), 
(16234,4,2,3), (59217,1,2,1), (51393,1,3,3), (67823,1,1,2), (80423,3,5,4), (22556,2,5,4), (1412,4,3,1), (56957,4,5,2), (68250,2,3,3), (21759,4,3,3), (60882,4,1,4), (11197,3,3,5), (63109,1,2,4), (38474,2,2,2), (98714,4,5,3), (60426,2,1,1), (65156,4,1,2), (91811,1,2,2), (96378,1,1,1), (91147,1,1,2), (79508,1,4,1), (40329,1,2,3), (19588,4,1,1), (30241,4,1,5), (17734,3,2,4), (80441,2,2,5), (78735,2,3,5), (91929,4,4,2), (3190,4,3,1), (56575,4,5,1), (19462,2,2,2), (49640,1,2,2), (74526,2,4,2), (27716,2,1,4), (86664,3,5,1), (33967,1,2,5), (77025,1,5,1), (16847,4,4,2), (46669,1,3,4), (12416,3,3,2), (52225,1,4,3), (34288,2,4,2), (64585,1,1,2), (84933,3,2,4), (23291,4,3,3), (76282,2,5,4), (954,1,2,3), (44991,3,3,1), (35713,3,2,2), (98066,4,2,2), (2660,4,4,2), (68400,3,5,3), (85345,1,4,4), (24257,3,5,5), (12589,3,2,5), (31752,2,3,4), (89954,3,2,4), (83464,3,5,1), (85367,2,2,1), (23238,3,5,3), (82809,4,2,5), (96179,3,5,4), (69681,2,5,1), (86895,3,5,3), (9843,1,1,5), (63406,4,3,4), (69709,1,3,4), (23136,4,1,4), (88953,3,2,1), (77823,2,2,5), (89564,1,5,5), (32083,1,3,5), (76025,1,1,2), (14728,2,2,2), (30790,1,3,2), (54139,1,5,2), (76524,1,3,3), (37263,4,1,1), (68598,2,1,4), (2687,4,5,1), (97523,3,2,3), (1919,4,5,1), (84905,4,1,2), (64592,3,5,2), (96762,2,5,1), (75856,1,1,2), (19557,1,5,5), (98247,1,3,1), (34946,3,1,2), (18669,4,5,4), (64561,2,5,1), (15536,1,2,1), (42294,1,5,3), (7932,1,5,2), (63376,3,4,2), (37912,4,3,1), (74490,1,3,2), (86525,1,5,5), (65874,4,4,3), (20766,1,4,2), 
(42652,3,3,4), (41973,4,2,2), (22969,1,5,2), (94923,2,4,4), (43640,1,5,4), (40573,4,2,3), (92886,3,4,1), (80889,3,4,5), (39066,1,2,4), (238,4,4,1), (3231,4,5,4), (89361,3,4,1), (39843,1,1,5), (51588,3,5,1), (64130,1,1,5), (72649,3,1,4), (20926,3,1,3), (86106,3,3,2), (67540,1,1,3), (76285,2,2,3), (89752,4,3,4), (91225,1,4,4), (82754,2,2,5), (23210,1,3,3), (66,1,3,1), (41450,2,1,5), (19544,4,2,3), (14905,4,2,1), (9796,3,3,1), (747,3,2,3), (32803,1,3,4), (98863,4,2,2), (72719,3,4,1), (97902,2,5,1), (78113,4,5,2), (47624,2,5,2), (19817,1,1,4), (17093,3,4,5), (3130,4,4,4), (64819,3,3,3), (99687,1,1,3), (3066,2,2,4), (82709,3,3,2), (83797,1,3,1), (42667,4,3,5), (32765,4,4,5), (76634,4,2,1), (47673,2,1,4), (62217,2,2,3), (68276,4,3,4);

-------------
-- Characters
-------------
CREATE TABLE Characters (
    id INT PRIMARY KEY, 
    name VARCHAR(20) NOT NULL
);

INSERT INTO Characters VALUES 
    (1, 'Luke Skywalker'),
    (2, 'Princess Leia'),
    (3, 'Anakin Skywalker'),
    (4, 'Obi Wan Kenobi'),
    (5, 'Emperor Palpatine'),
    (6, 'Darth Vader'),
    (7, 'Lando Calrissian'),
    (8, 'Boba Fett'),	
    (9, 'C-3PO'),	
    (10, 'R2 D2'),	
    (11, 'Jar Jar Binks'),	
    (12, 'Padme Amidala'),
    (13, 'Yoda'), 
    (14, 'Dr. Mota');

-------------------
-- CharacterRatings
-------------------
CREATE TABLE CharacterRatings (
    fan INT NOT NULL, 
    FOREIGN KEY (fan) REFERENCES Fans (id), 
    character INT NOT NULL, 
    FOREIGN KEY (character) REFERENCES Characters (id), 
    PRIMARY KEY (fan, character), 
    rating INT NOT NULL
);

INSERT INTO CharacterRatings VALUES (6716,11,5), (6716,12,2), (29200,1,5), (29200,2,3), (29200,6,4), (67921,1,2), (67921,12,4), (24538,3,3), (24538,7,2), (24538,8,5), (24538,12,5), (24538,13,5), (62261,1,2), (62261,4,5), (62261,5,2), (62261,6,5), (62261,11,1), (22914,7,1), (22914,10,3), (71014,3,3), (71014,5,4), (71014,7,2), (75527,1,3), (75527,5,5), (75527,8,2), (75527,10,2), (99091,7,4), (99091,9,3), (92452,1,1), (92452,7,4), (92452,8,4), (92452,12,5), (28614,9,5), (28614,13,5), (28135,4,2), (28135,7,4), (83326,1,1), (83326,8,4), (83326,11,2), (12066,1,2), (12066,4,5), (12066,5,1), (12066,6,1), (12066,9,2), (12066,12,3), (12066,13,2), (17471,1,3), (17471,2,5), (17471,5,2), (17471,9,5), (87061,5,4), (87061,12,2), (35702,5,1), (52800,2,4), (52800,4,2), (52800,6,5), (52800,8,1), (52800,12,5), (52800,13,3), (90408,1,1), (90408,5,2), (90408,6,5), (90408,7,4), (90408,8,4), (90408,10,2), (90408,13,1), (6059,7,2), (6059,10,2), (6059,12,2), (89267,6,2), (89267,8,2), (89267,11,3), (89267,13,2), (57944,12,4), (28862,6,2), (28862,8,3), (28862,12,3), (56245,2,1), (56245,3,4), (56245,4,4), (56245,9,5), (56245,12,2), (45888,3,5), (45888,6,3), (45888,7,4), (45888,13,2), (51197,1,3), (51197,7,2), (51197,10,3), (9744,1,3), (9744,10,2), (36082,3,5), (36082,9,4), (36082,10,2), (36082,12,2), (61838,1,3), (61838,5,5), (61838,9,3), (73015,1,2), 
(73015,3,2), (73015,6,2), (73015,7,4), (73015,8,1), (73015,9,2), (73015,12,2), (65081,5,2), (71319,3,2), (71319,5,2), (71319,6,2), (71319,9,3), (71319,12,1), (7303,1,3), (7303,2,4), (7303,7,2), (7303,9,5), (7303,12,5), (93926,2,5), (93926,9,3), (93926,10,2), (93926,11,4), (73175,1,2), (73175,4,4), (73175,5,3), (73175,11,4), (73175,12,2), (83285,3,4), (83285,6,1), (83285,7,4), (83285,9,4), (83285,10,3), (83285,13,5), (87081,2,4), (87081,9,4), (87081,12,3), (77673,3,2), (77673,5,4), (77673,12,2), (93583,9,4), (93583,12,2), (39629,3,1), (39629,7,1), (39629,9,3), (39629,12,5), (49925,2,5), (49925,5,3), (49925,7,1), (49925,13,3), (75130,4,4), (1017,1,5), (1017,7,3), (37128,4,3), (37128,8,5), (37128,9,3), (37128,12,3), (33108,3,2), (33108,6,5), (33108,7,5), (33108,8,4), (20144,2,2), (20144,3,4), (20144,4,1), (20144,9,2), (46722,1,5), (46722,2,5), (46722,8,2), (93341,1,4), (93341,3,3), (69497,2,4), (69516,3,1), (69516,10,5), (6813,1,3), (6813,8,5), (6813,10,4), (85264,10,1), (71989,6,3), (71989,8,2), (71989,10,1), (71989,12,5), (34695,3,3), (34695,4,2), (34695,9,1), (69478,1,3), (69478,9,3), (69478,10,1), (69478,12,5), (25077,13,5), (31257,7,1), (93816,9,2), (93816,13,1), (86110,5,3), (86110,8,5), (86110,9,4), (42418,2,4), (42418,6,5), (42418,10,3), (85130,1,4), (85130,2,3), (85130,5,5), (85130,11,2), 
(54553,1,4), (54553,5,4), (54553,8,1), (54553,12,2), (82117,2,2), (82117,4,3), (82117,11,5), (17788,1,1), (17788,7,1), (17788,10,4), (17788,13,1), (61522,3,2), (61522,4,1), (61522,6,3), (61522,8,2), (61522,11,1), (61522,13,5), (17118,2,3), (17118,7,5), (17118,8,2), (17118,11,2), (17118,13,3), (33174,1,2), (33174,2,1), (33174,3,2), (33174,4,3), (33174,7,1), (5077,8,3), (5077,12,4), (99981,1,2), (99981,3,2), (99981,5,1), (99981,8,1), (99981,11,4), (99981,13,2), (94242,2,1), (94242,5,1), (94242,13,2), (98230,5,2), (98230,6,5), (18077,1,1), (18077,12,4), (94645,7,4), (94645,8,2), (94645,9,1), (89060,3,4), (89060,5,3), (89060,6,5), (89060,8,1), (89060,11,4), (89060,13,2), (65849,10,5), (65849,12,1), (55124,3,4), (55124,5,2), (55124,10,4), (67759,11,2), (47557,3,2), (44648,1,3), (44648,9,5), (44648,11,3), (45198,5,1), (45198,7,3), (45198,11,4), (45198,13,5), (34610,3,1), (34610,5,4), (34610,8,1), (34610,9,2), (34610,10,5), (34610,12,4), (69057,3,3), (69057,7,5), (69057,8,1), (69057,10,3), (69057,13,4), (39140,1,2), (39140,3,5), (39140,10,4), (39140,13,3), (43680,2,5), (43680,3,2), (43680,5,5), (43680,6,3), (43680,10,2), (52470,2,5), (52470,3,3), (52470,7,3), (52470,9,4), (52470,10,4), (52470,12,5), (78774,4,5), (78774,6,1), (78774,7,4), (78774,9,4), (78774,10,4), (10474,5,5), (10474,7,3), (10474,9,1), (10474,12,5), 
(10474,13,1), (16695,2,1), (16695,3,3), (16695,4,2), (16695,5,4), (16695,6,1), (16695,8,1), (7112,5,2), (7112,6,2), (7112,12,2), (32452,2,1), (32452,5,2), (32452,13,2), (39800,4,4), (39800,9,3), (39800,10,5), (39800,12,1), (39800,13,5), (59217,1,4), (59217,3,3), (59217,5,1), (59217,9,3), (59217,13,4), (51393,2,3), (51393,3,5), (51393,6,3), (51393,8,3), (51393,12,3), (67823,4,5), (67823,7,4), (80423,1,3), (80423,3,3), (80423,6,5), (80423,7,4), (80423,11,1), (22556,4,3), (22556,6,1), (22556,8,2), (22556,13,5), (56957,1,1), (56957,2,1), (56957,7,3), (56957,9,3), (56957,13,5), (68250,3,5), (68250,8,5), (21759,3,2), (21759,7,2), (21759,11,1), (21759,12,3), (60882,6,5), (60882,7,5), (11197,5,5), (11197,6,4), (11197,7,4), (11197,12,2), (63109,2,3), (63109,7,5), (63109,11,4), (63109,12,3), (38474,4,1), (38474,8,3), (60426,2,2), (60426,7,2), (60426,8,2), (65156,2,4), (65156,4,4), (65156,8,1), (65156,10,3), (91811,2,3), (91811,9,4), (96378,2,1), (96378,3,3), (96378,6,4), (96378,13,3), (91147,1,2), (91147,4,2), (91147,6,5), (91147,7,5), (91147,10,5), (79508,5,2), (79508,10,4), (40329,3,4), (40329,7,4), (40329,10,1), (19588,3,3), (19588,4,4), (19588,7,2), (19588,9,5), (19588,10,4), (19588,11,5), (30241,8,1), (30241,10,4), (30241,11,5), (30241,13,3), (17734,5,2), (17734,6,2), (17734,7,3), (17734,11,5), (17734,12,2), 
(80441,6,2), (80441,8,2), (80441,9,4), (80441,10,1), (80441,11,4), (80441,12,1), (78735,5,4), (78735,10,2), (78735,12,2), (91929,9,1), (3190,2,1), (3190,3,5), (3190,8,1), (56575,3,1), (56575,4,2), (56575,6,5), (56575,8,2), (56575,10,5), (56575,11,1), (19462,5,5), (19462,6,1), (19462,10,4), (19462,11,1), (49640,6,4), (49640,7,5), (49640,12,1), (49640,13,1), (74526,6,3), (74526,12,5), (74526,13,1), (27716,11,4), (86664,3,2), (86664,9,1), (33967,2,3), (33967,4,2), (33967,6,5), (33967,12,1), (77025,6,2), (77025,7,1), (77025,8,3), (77025,10,4), (77025,11,2), (16847,1,3), (16847,6,5), (16847,7,2), (16847,8,2), (46669,2,5), (46669,6,4), (46669,7,1), (46669,8,5), (12416,2,2), (12416,4,2), (12416,5,5), (12416,9,5), (52225,12,2), (34288,2,2), (34288,3,2), (34288,8,5), (34288,10,5), (64585,3,4), (64585,4,2), (64585,10,4), (64585,12,5), (84933,3,5), (84933,4,1), (84933,10,5), (84933,11,4), (84933,12,4), (23291,4,1), (23291,5,3), (23291,6,2), (23291,9,4), (76282,4,2), (76282,11,5), (954,2,4), (954,11,4), (44991,2,5), (44991,3,2), (44991,5,3), (44991,6,5), (35713,3,2), (35713,9,1), (2660,12,2), (68400,1,2), (68400,3,3), (68400,4,1), (68400,5,3), (85345,1,4), (12589,4,2), (31752,8,2), (31752,9,3), (31752,11,1), (31752,12,1), (89954,4,3), (89954,5,4), (89954,6,1), (89954,11,5), (83464,3,3), (83464,5,2), (83464,7,5), 
(83464,10,4), (83464,11,4), (83464,13,1), (69681,6,2), (86895,3,3), (86895,6,5), (86895,10,1), (86895,12,5), (9843,1,1), (9843,3,2), (9843,4,4), (9843,12,2), (63406,2,4), (63406,8,4), (69709,6,1), (69709,10,4), (69709,11,5), (69709,12,5), (23136,8,2), (23136,11,3), (88953,5,3), (88953,7,3), (88953,8,5), (88953,12,2), (77823,2,5), (77823,3,1), (77823,4,1), (77823,6,1), (77823,7,4), (89564,1,4), (89564,2,3), (89564,5,3), (89564,8,1), (32083,3,3), (32083,8,5), (76025,1,4), (76025,3,1), (76025,5,4), (76025,8,3), (76025,13,1), (14728,3,2), (14728,6,2), (14728,7,3), (14728,8,5), (14728,10,1), (14728,11,4), (54139,4,3), (54139,9,2), (76524,13,3), (68598,4,3), (68598,6,3), (68598,8,4), (68598,10,3), (2687,7,1), (2687,10,2), (2687,12,5), (1919,3,4), (1919,12,1), (84905,1,3), (84905,3,2), (84905,5,3), (84905,12,5), (64592,2,3), (64592,3,4), (64592,6,1), (64592,11,3), (96762,6,4), (96762,9,5), (96762,12,1), (75856,2,1), (75856,5,4), (75856,12,2), (19557,2,4), (98247,1,3), (98247,4,2), (34946,9,5), (34946,12,5), (34946,13,4), (18669,1,1), (18669,3,2), (18669,6,1), (18669,8,5), (18669,11,2), (64561,9,3), (15536,4,1), (15536,6,3), (42294,2,5), (42294,3,4), (7932,3,3), (7932,12,1), (7932,13,2), (63376,3,4), (63376,7,3), (63376,11,5), (37912,3,1), (37912,6,1), (37912,10,3), (86525,1,4), (86525,3,3), (86525,9,2), 
(65874,9,1), (65874,10,5), (20766,1,3), (20766,3,3), (20766,4,4), (20766,12,1), (20766,13,2), (41973,4,4), (41973,7,4), (41973,10,2), (41973,12,3), (94923,5,3), (94923,7,2), (94923,8,5), (94923,10,3), (43640,1,3), (43640,6,4), (43640,9,5), (43640,10,4), (40573,5,1), (92886,8,5), (92886,13,1), (80889,8,5), (80889,11,4), (80889,12,5), (80889,13,2), (39066,1,1), (39066,3,5), (39066,4,3), (39066,5,1), (39066,8,5), (39066,10,2), (238,1,3), (3231,4,4), (3231,5,1), (3231,9,1), (3231,11,1), (3231,12,3), (89361,3,2), (39843,2,5), (39843,7,3), (39843,9,4), (51588,7,1), (51588,8,3), (51588,9,2), (51588,13,2), (64130,9,3), (64130,10,5), (64130,11,5), (64130,12,4), (72649,1,5), (72649,6,1), (20926,5,3), (20926,10,4), (86106,3,4), (86106,12,3), (86106,13,1), (67540,7,3), (67540,13,1), (76285,2,4), (76285,3,1), (76285,4,3), (76285,8,5), (76285,9,5), (89752,2,1), (89752,4,2), (89752,11,2), (89752,12,2), (89752,13,4), (91225,1,4), (91225,10,1), (23210,4,4), (23210,6,1), (23210,8,3), (66,4,4), (66,7,3), (66,12,5), (41450,5,5), (41450,6,3), (41450,10,4), (41450,11,4), (19544,3,5), (19544,13,3), (14905,5,1), (14905,7,5), (14905,8,1), (14905,13,5), (9796,1,5), (9796,4,1), (9796,5,1), (9796,7,5), (9796,8,1), (9796,12,1), (9796,13,3), (747,12,2), (32803,8,3), (32803,9,5), (98863,3,4), (98863,12,2), (72719,4,4), 
(72719,6,3), (72719,9,5), (72719,11,1), (97902,2,2), (78113,5,2), (78113,8,1), (47624,2,3), (47624,9,4), (19817,3,1), (19817,5,2), (19817,11,2), (17093,1,4), (17093,11,1), (17093,13,2), (3130,5,3), (3130,7,5), (3130,8,4), (3130,12,4), (64819,1,2), (99687,1,5), (99687,9,1), (99687,12,5), (99687,13,2), (3066,1,3), (3066,2,4), (3066,6,2), (3066,10,2), (3066,12,3), (82709,1,1), (82709,2,1), (82709,7,5), (82709,11,2), (82709,13,3), (32765,2,2), (32765,6,4), (76634,2,1), (76634,5,1), (76634,7,2), (76634,8,5), (76634,13,2), (47673,6,5), (47673,12,1), (62217,2,1), (62217,7,5), (62217,13,5), (68276,12,1), (68276,13,1);

--------
-- Films
--------

CREATE TABLE Films (
    id INT PRIMARY KEY, 
    title VARCHAR(45) NOT NULL
);

INSERT INTO Films VALUES 
    (1, 'Star Wars: Episode I  The Phantom Menace'), 
    (2, 'Star Wars: Episode II  Attack of the Clones'), 
    (3, 'Star Wars: Episode III  Revenge of the Sith'), 
    (4, 'Star Wars: Episode IV  A New Hope'), 
    (5, 'Star Wars: Episode V The Empire Strikes Back'), 
    (6, 'Star Wars: Episode VI Return of the Jedi'); 

--------------
-- FilmRatings
--------------
CREATE TABLE FilmRatings (
    fan INT NOT NULL, 
    FOREIGN KEY (fan) REFERENCES Fans (id), 
    film INT NOT NULL, 
    FOREIGN KEY (film) REFERENCES Films (id), 
    PRIMARY KEY (fan, film),
    rating INT NOT NULL
);

INSERT INTO FilmRatings VALUES (6716,1,2), (6716,2,5), (29200,2,4), (29200,4,5), (29200,5,3), (67921,1,5), (67921,4,2), (67921,5,3), (53421,1,1), (53421,2,5), (53421,3,2), (53421,5,3), (61095,4,4), (61095,5,5), (24538,1,1), (24538,3,4), (24538,4,5), (24538,5,4), (62261,2,2), (62261,3,4), (62261,4,4), (62261,5,3), (22914,1,3), (22914,2,3), (22914,3,5), (22914,5,5), (71014,1,4), (71014,2,1), (71014,5,1), (75527,1,2), (75527,2,2), (75527,3,1), (75527,5,2), (99091,1,2), (99091,2,5), (99091,3,5), (99091,5,3), (92452,2,4), (92452,3,2), (92452,4,3), (92452,5,5), (28828,1,3), (28828,3,2), (28828,5,5), (32263,1,5), (32263,2,1), (32263,3,2), (32263,4,4), (28614,1,1), (28614,2,1), (28614,3,2), (28614,5,2), (28135,1,5), (28135,2,2), (28135,3,4), (28135,4,5), (20833,1,4), (20833,2,3), (20833,4,2), (20833,5,4), (83326,1,1), (83326,2,5), (83326,3,3), (83326,4,5), (83326,5,4), (12066,1,3), (12066,2,5), (12066,4,5), (87061,1,1), (87061,2,2), (87061,4,5), (87061,5,3), (35702,1,2), (35702,2,4), (35702,4,3), (35702,5,3), (90408,2,5), (90408,4,5), (6059,1,2), (6059,3,2), (6059,4,3), (6059,5,5), (89267,2,5), (89267,4,5), (89267,5,5), (57944,1,1), (57944,3,4), (57944,4,5), (57944,5,3), (28862,1,5), (28862,2,1), (28862,3,2), (28862,4,4), (28862,5,1), (56245,1,5), (56245,2,3), (56245,3,4), (56245,5,4), (55130,2,5), 
(55130,3,4), (55130,5,1), (45888,1,3), (45888,4,5), (45888,5,1), (51197,2,2), (51197,5,3), (9744,1,4), (9744,2,5), (9744,3,5), (9744,4,2), (36082,2,1), (36082,3,1), (36082,4,4), (61838,2,4), (61838,3,1), (61838,4,3), (61838,5,3), (73015,1,2), (73015,4,4), (73015,5,2), (71319,1,5), (71319,2,1), (71319,3,2), (71319,5,5), (7303,1,2), (7303,2,2), (7303,3,1), (7303,4,5), (93926,3,4), (93926,5,3), (25837,1,2), (25837,2,2), (25837,3,1), (25837,4,3), (25837,5,1), (73175,1,1), (73175,2,4), (73175,3,1), (73175,4,3), (83285,1,3), (83285,2,3), (83285,3,5), (83285,4,1), (83285,5,3), (87081,1,1), (87081,2,1), (87081,3,3), (87081,5,2), (93583,1,2), (93583,2,4), (93583,3,3), (93583,5,3), (39629,1,5), (39629,2,3), (39629,4,5), (39629,5,5), (49925,2,1), (49925,3,4), (49925,4,2), (49925,5,2), (75130,1,1), (75130,2,3), (75130,3,1), (75130,4,4), (75130,5,3), (1017,1,1), (1017,3,1), (1017,4,3), (1017,5,1), (37128,1,3), (37128,2,1), (37128,4,4), (33108,1,1), (33108,2,1), (33108,3,5), (33108,4,4), (33108,5,3), (20144,4,1), (20144,5,4), (46722,1,2), (46722,2,5), (46722,3,5), (46722,4,5), (93341,1,2), (93341,2,4), (93341,5,4), (69497,1,5), (69497,3,1), (69516,2,3), (69516,3,1), (69516,4,5), (69516,5,2), (6813,1,5), (6813,2,2), (6813,3,3), (6813,4,4), (85264,1,1), (85264,2,2), (85264,3,1), 
(85264,4,4), (85264,5,4), (71989,1,3), (71989,2,4), (71989,3,3), (71989,4,5), (34695,1,3), (34695,2,1), (34695,4,4), (69478,2,3), (69478,3,4), (25077,1,4), (25077,2,5), (25077,3,1), (25077,4,5), (25077,5,4), (31257,2,3), (31257,3,2), (31257,4,4), (31257,5,3), (93816,1,3), (93816,3,5), (93816,4,4), (86110,1,5), (86110,2,3), (86110,5,5), (42418,4,2), (85130,1,5), (85130,2,2), (85130,3,3), (85130,4,3), (85130,5,1), (82117,1,1), (82117,2,5), (82117,3,2), (82117,4,5), (82117,5,1), (17788,1,2), (17788,2,3), (17788,3,2), (17788,4,5), (17788,5,2), (61522,4,2), (61522,5,1), (17118,1,1), (17118,2,4), (17118,3,1), (17118,4,5), (17118,5,2), (33174,2,5), (33174,3,2), (33174,5,1), (5077,2,2), (5077,3,1), (5077,4,5), (5077,5,4), (94242,1,4), (94242,2,2), (94242,3,4), (94242,4,5), (94242,5,4), (18077,1,3), (18077,2,5), (18077,3,5), (18077,4,4), (18077,5,2), (94645,3,4), (94645,4,5), (94645,5,2), (89060,1,3), (89060,2,2), (89060,3,5), (89060,4,5), (89060,5,4), (58860,1,3), (58860,2,5), (58860,3,1), (58860,4,4), (65849,2,1), (65849,4,5), (67759,1,2), (67759,2,3), (67759,3,3), (67759,4,5), (67759,5,3), (47557,1,2), (47557,3,2), (47557,4,3), (44648,3,5), (44648,4,5), (44648,5,4), (45198,1,3), (45198,3,4), (39140,3,1), (39140,4,1), (39140,5,4), (78774,1,3), (78774,2,2), (78774,3,1), (78774,4,2), 
(78774,5,5), (20687,1,5), (20687,2,5), (20687,3,1), (20687,4,5), (20687,5,3), (10474,1,1), (10474,2,3), (10474,3,3), (10474,5,5), (16695,1,3), (16695,2,3), (16695,3,2), (7112,1,3), (7112,3,4), (7112,5,4), (32452,2,4), (32452,3,4), (32452,4,2), (32452,5,2), (39800,1,2), (39800,3,5), (39800,4,4), (39800,5,1), (59217,2,5), (59217,3,4), (59217,5,3), (51393,1,2), (51393,2,4), (51393,3,1), (51393,4,2), (51393,5,5), (67823,1,4), (67823,2,2), (67823,3,5), (80423,1,2), (80423,3,2), (80423,4,2), (80423,5,1), (22556,1,2), (22556,2,1), (22556,3,4), (22556,4,4), (22556,5,4), (1412,1,1), (1412,2,3), (1412,3,5), (1412,4,3), (1412,5,3), (56957,2,3), (56957,4,1), (56957,5,5), (68250,1,1), (68250,2,1), (68250,4,5), (21759,1,3), (21759,2,1), (21759,3,5), (21759,4,5), (21759,5,4), (60882,1,5), (60882,2,1), (60882,3,2), (60882,4,2), (11197,2,2), (11197,3,4), (63109,2,4), (63109,3,1), (63109,4,5), (63109,5,2), (38474,1,3), (38474,2,3), (38474,5,4), (60426,1,1), (60426,4,4), (65156,1,4), (65156,2,4), (65156,5,5), (96378,1,3), (96378,2,3), (96378,3,4), (96378,4,5), (96378,5,1), (40329,1,3), (40329,2,3), (40329,4,3), (19588,1,5), (19588,2,4), (19588,3,1), (19588,4,5), (19588,5,3), (30241,1,3), (30241,3,3), (30241,4,1), (30241,5,3), (17734,1,4), (17734,2,1), (17734,3,1), (17734,4,3), (17734,5,4), 
(80441,1,3), (80441,2,3), (80441,3,3), (80441,4,4), (80441,5,1), (78735,1,3), (78735,3,2), (78735,4,1), (78735,5,4), (91929,1,2), (91929,2,5), (91929,4,3), (91929,5,4), (3190,1,2), (3190,2,3), (3190,3,4), (3190,4,1), (56575,3,1), (56575,5,5), (19462,1,2), (19462,2,4), (19462,4,1), (19462,5,2), (49640,1,4), (49640,2,2), (49640,3,3), (49640,4,4), (49640,5,4), (74526,1,1), (74526,2,2), (74526,3,5), (74526,4,1), (74526,5,3), (33967,2,3), (33967,3,5), (33967,4,5), (77025,3,4), (77025,4,4), (77025,5,4), (16847,1,1), (16847,2,3), (16847,4,2), (46669,1,1), (46669,3,1), (46669,4,4), (46669,5,4), (12416,1,5), (12416,2,3), (12416,3,3), (12416,5,3), (52225,2,4), (52225,3,5), (52225,5,3), (34288,1,2), (34288,2,4), (34288,3,1), (34288,4,2), (64585,1,1), (64585,2,4), (64585,3,4), (64585,4,2), (64585,5,4), (84933,2,5), (84933,3,3), (84933,4,2), (84933,5,3), (23291,1,3), (23291,2,1), (23291,5,2), (76282,1,2), (76282,2,5), (954,2,3), (954,3,2), (954,5,5), (44991,2,5), (44991,3,2), (44991,4,2), (35713,1,3), (35713,2,3), (35713,3,3), (35713,4,1), (35713,5,2), (98066,1,5), (98066,2,1), (98066,3,5), (98066,5,3), (68400,1,2), (68400,3,3), (68400,4,3), (68400,5,5), (85345,1,1), (85345,3,3), (85345,4,2), (24257,1,1), (24257,5,1), (12589,1,3), (12589,2,1), (12589,3,5), (12589,4,3), (12589,5,5), 
(31752,2,3), (31752,3,4), (31752,4,2), (31752,5,3), (89954,1,4), (89954,2,2), (89954,4,2), (89954,5,2), (83464,1,5), (83464,2,3), (83464,3,5), (83464,4,2), (83464,5,2), (85367,2,3), (85367,3,5), (85367,4,4), (85367,5,3), (82809,2,1), (82809,3,1), (82809,5,5), (96179,1,5), (96179,3,2), (96179,4,3), (69681,1,3), (69681,2,3), (69681,3,2), (69681,4,3), (69681,5,5), (86895,1,3), (86895,2,2), (86895,3,5), (86895,4,2), (86895,5,5), (9843,2,3), (9843,3,4), (9843,4,1), (63406,1,5), (63406,2,2), (63406,3,3), (63406,4,3), (63406,5,4), (69709,1,3), (69709,3,2), (69709,5,5), (23136,1,3), (23136,2,3), (23136,4,5), (23136,5,5), (88953,1,2), (88953,2,4), (88953,3,2), (88953,4,5), (88953,5,5), (77823,1,2), (77823,3,3), (77823,4,2), (77823,5,4), (89564,1,2), (89564,3,2), (89564,4,4), (32083,3,1), (14728,1,3), (14728,2,4), (14728,3,5), (14728,4,1), (14728,5,4), (30790,1,4), (30790,2,1), (30790,3,3), (30790,4,2), (30790,5,3), (54139,1,2), (54139,2,3), (54139,3,1), (76524,1,1), (76524,2,5), (76524,3,3), (76524,4,3), (76524,5,3), (37263,1,3), (37263,2,1), (37263,4,3), (37263,5,3), (68598,1,2), (68598,2,1), (68598,4,2), (2687,1,4), (2687,4,4), (2687,5,3), (97523,1,1), (97523,2,5), (97523,4,1), (97523,5,1), (1919,1,5), (1919,2,5), (1919,3,3), (1919,4,2), (84905,1,5), (84905,2,3), (84905,3,3), 
(64592,1,3), (64592,2,3), (64592,4,5), (64592,5,4), (96762,1,3), (96762,3,1), (96762,4,1), (96762,5,5), (75856,1,4), (75856,2,2), (75856,4,5), (19557,1,3), (19557,2,3), (19557,5,4), (98247,1,5), (98247,3,1), (98247,4,3), (34946,1,4), (34946,2,2), (34946,3,3), (34946,4,1), (18669,1,1), (18669,2,3), (18669,4,3), (18669,5,2), (42294,1,5), (42294,2,4), (42294,4,1), (42294,5,3), (7932,1,1), (7932,2,5), (7932,3,4), (7932,5,4), (63376,1,5), (63376,2,4), (63376,3,1), (63376,5,5), (37912,1,4), (37912,2,3), (37912,4,5), (37912,5,2), (86525,1,3), (86525,3,3), (86525,4,1), (86525,5,2), (65874,2,1), (65874,3,2), (20766,2,1), (20766,3,4), (20766,5,2), (42652,1,1), (42652,3,3), (42652,5,3), (41973,2,1), (41973,3,2), (41973,4,4), (41973,5,4), (22969,1,5), (22969,2,5), (22969,3,5), (22969,5,4), (43640,1,5), (43640,3,5), (43640,4,3), (43640,5,4), (40573,1,5), (40573,2,5), (40573,4,4), (40573,5,2), (92886,1,1), (92886,2,2), (92886,3,1), (92886,4,4), (92886,5,4), (80889,1,5), (80889,2,5), (80889,3,2), (80889,4,4), (80889,5,3), (39066,1,4), (39066,2,4), (39066,3,2), (39066,5,2), (3231,1,3), (3231,2,1), (3231,3,3), (3231,5,4), (39843,3,1), (39843,4,3), (51588,1,4), (51588,2,1), (51588,3,2), (51588,4,3), (51588,5,2), (72649,3,4), (72649,4,1), (72649,5,2), (20926,2,3), (20926,3,3), (20926,4,4), 
(20926,5,4), (86106,1,5), (86106,2,1), (86106,3,2), (86106,4,4), (67540,1,1), (67540,3,1), (67540,5,2), (89752,2,3), (89752,5,5), (91225,1,5), (91225,2,5), (91225,3,2), (91225,4,5), (82754,1,5), (82754,2,1), (82754,4,1), (82754,5,4), (23210,1,3), (23210,2,2), (23210,3,1), (23210,5,2), (66,1,1), (66,2,5), (66,3,5), (66,4,4), (41450,1,5), (41450,2,4), (41450,3,1), (41450,4,3), (41450,5,3), (19544,3,3), (19544,4,3), (19544,5,2), (14905,1,2), (14905,2,1), (14905,3,3), (14905,4,5), (14905,5,5), (747,1,4), (747,3,5), (747,4,4), (747,5,5), (32803,1,4), (32803,3,5), (32803,4,2), (32803,5,1), (98863,1,2), (98863,2,1), (98863,4,1), (98863,5,1), (97902,1,3), (97902,2,2), (97902,3,5), (78113,1,4), (78113,2,4), (78113,3,1), (78113,4,5), (78113,5,5), (47624,1,5), (47624,2,1), (47624,3,1), (47624,4,2), (19817,1,3), (19817,2,2), (19817,3,5), (19817,4,5), (17093,2,4), (17093,3,2), (17093,4,4), (17093,5,4), (3130,1,2), (3130,2,2), (3130,3,3), (3130,4,2), (64819,1,4), (64819,3,5), (64819,5,2), (99687,1,3), (99687,3,4), (99687,4,2), (99687,5,5), (3066,1,2), (3066,2,1), (3066,3,3), (3066,4,1), (3066,5,5), (82709,2,3), (82709,4,4), (82709,5,2), (83797,1,4), (83797,2,4), (83797,3,4), (83797,4,3), (42667,1,5), (42667,3,5), (42667,4,2), (32765,1,4), (32765,4,1), (32765,5,4), 
(76634,1,4), (76634,2,2), (76634,3,3), (76634,4,2), (76634,5,3), (47673,1,4), (47673,2,2), (47673,3,4), (47673,4,1), (47673,5,4), (62217,1,2), (62217,3,1), (62217,4,1), (62217,5,5), (68276,1,2), (68276,2,3), (68276,3,1), (68276,4,5), (68276,5,3);

-- TODO: answer a minimum of 5 of the 7 questions below; you can get up to 7 points in this homework if you get ALL queries right

-- h) the top rated star wars film by the fans 

Select F.title, ROUND(AVG(FR.rating), 2) as avg FROM films F
RIGHT JOIN FilmRatings FR
ON F.id = FR.film
GROUP BY F.title
ORDER BY avg DESC
LIMIT 1;

-- j) the top rated film by fans with income '$150,000+'

Select F.title, ROUND(AVG(FR.rating), 2) as avg FROM films F
RIGHT JOIN FilmRatings FR
ON F.id = FR.film
LEFT JOIN Fans FA
ON FR.fan = FA.id
LEFT JOIN IncomeLevels I
ON FA.income = I.seq
WHERE I.description = '$150,000+'
GROUP BY F.title
ORDER BY avg DESC
LIMIT 1;

-- k) the number of ratings AND the average rating received by "Princess Leia", rounded to 2 decimals

SELECT C.name, COUNT(CR.rating), ROUND(AVG(CR.rating), 2) FROM characters as C
LEFT JOIN CharacterRatings as CR
on C.id = CR.character
WHERE C.name = 'Princess Leia'
GROUP BY C.name
ORDER BY C.name;

-- l) the average rating of "Star Wars: Episode V The Empire Strikes Back", rounded to 2 decimals

Select F.title, ROUND(AVG(FR.rating), 2) as avg FROM films F
RIGHT JOIN FilmRatings FR
ON F.id = FR.film
WHERE F.title LIKE 'Star Wars: Episode V%'
GROUP BY F.title;

-- m) the name of the character that received the least number of ratings 

Select C.name, Count(CR.rating) as count FROM characters C
LEFT JOIN CharacterRatings CR
ON C.id = CR.character
GROUP BY C.name
ORDER BY count
LIMIT 1;

-- n) the favorite character according the yongest fan audience

SELECT C.name, ROUND(AVG(CR.rating), 2) as avg FROM Characters c
RIGHT JOIN CharacterRatings CR
ON C.id = CR.character
GROUP BY C.name
ORDER BY avg DESC
LIMIT 1;

-- o) the income levels (descriptions) that has at least 100 fans, ordered by income sequential number

SELECT I.description, COUNT(i.seq) as count FROM Fans f
RIGHT JOIN IncomeLevels I
ON F.income = I.seq
GROUP BY I.seq, I.description
HAVING COUNT(i.seq) >= 100
ORDER BY I.seq;