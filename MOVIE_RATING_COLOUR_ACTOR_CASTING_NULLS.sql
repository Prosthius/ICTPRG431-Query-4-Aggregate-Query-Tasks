-- The IF EXISTS condition/syntax (below) only works on SQL Server 2016 and later & Azure

CREATE DATABASE ICTPRG431_Query_4_Aggregate_Query_Tasks;
GO
USE ICTPRG431_Query_4_Aggregate_Query_Tasks;
GO

DROP TABLE IF EXISTS CASTING9468;
DROP TABLE IF EXISTS ACTOR9468;
DROP TABLE IF EXISTS MOVIE9468;
DROP TABLE IF EXISTS COLOURTYPE9468; 
DROP TABLE IF EXISTS RATING9468;

-- For earlier Versions of SQL Server (e.g. SQL Server 2014) use the following instead

/*	
IF OBJECT_ID('CASTING9468') IS NOT NULL
	DROP TABLE CASTING9468;

IF OBJECT_ID('ACTOR9468') IS NOT NULL
	DROP TABLE ACTOR9468;

IF OBJECT_ID('MOVIE9468') IS NOT NULL
	DROP TABLE MOVIE9468;
			
IF OBJECT_ID('COLOURTYPE9468') IS NOT NULL
	DROP TABLE COLOURTYPE9468;
	
IF OBJECT_ID('RATING9468') IS NOT NULL
	DROP TABLE RATING9468;

GO
*/

-- The script after this will not change regardless of the server version used		

CREATE TABLE RATING9468 (
  RATINGCODE   VARCHAR(2) 
, SHORTDESC    VARCHAR(30) 
, LONGDESC     VARCHAR(100) 
, PRIMARY KEY  (RATINGCODE) 
);


CREATE TABLE COLOURTYPE9468 (
  COLOURCODE   VARCHAR(1) 
, COLOURNAME   VARCHAR(30) 
, PRIMARY KEY  (COLOURCODE) 
);

CREATE TABLE MOVIE9468 (
  MOVIENO      INT PRIMARY KEY  
, TITLE        VARCHAR(100) 
, RELYEAR      SMALLINT
, RUNTIME      SMALLINT
, RATINGCODE   VARCHAR(2) 
, COLOURCODE   VARCHAR(1) 
, TMDB_SCORE   DECIMAL(3,1) 
, TMDB_VOTES   DECIMAL
, TMDB_ID      VARCHAR(12) 
);

CREATE TABLE ACTOR9468 (
  ACTORNO    INT
, FULLNAME   VARCHAR(100)
, GIVENNAME  VARCHAR(100)
, SURNAME    VARCHAR(100)
, GENDER     VARCHAR(1)
, BIRTHDATE  DATE
, IMDBID     VARCHAR(20)
, BIRTHCOUNTRY     VARCHAR(50)
, PRIMARY KEY (ACTORNO)
);

CREATE TABLE CASTING9468 (
  CASTID  INT
, ACTORNO INT
, MOVIENO INT
, PRIMARY KEY (CASTID)
, FOREIGN KEY (ACTORNO) references ACTOR9468
, FOREIGN KEY (MOVIENO) references MOVIE9468
);


INSERT INTO COLOURTYPE9468 (colourcode, colourname) VALUES 
('B', 'Black & White Movie'),
('C', 'Colour Movie');

INSERT INTO RATING9468 (ratingcode, shortdesc, longdesc) VALUES 
('G', 'GENERAL','Suitable for all ages'),
('M', 'MATURE (15+)','Recommended for mature audiences 15 years and over'),
('MA', 'MATURE ACCOMPANIED (15+)','Persons under 15 years must be accompanied by a mature adult'),
('PG', 'PARENTAL GUIDANCE','Parental guidance recommended for persons under 15 years'),
('R', 'RESTRICTED (18+)','Restricted to mature adults 18 years and over');


INSERT INTO MOVIE9468 (MOVIENO, TITLE, RELYEAR, RUNTIME, RATINGCODE, COLOURCODE, TMDB_SCORE, TMDB_VOTES, TMDB_ID) VALUES (620,'Ghostbusters',1984,107,'PG','C',6.8,570,'tt0087332'),
  (324668,'Jason Bourne',2016,123,'M','C',7.2,121,'tt4196776'),
  (1572,'Die Hard: With a Vengeance',1995,131,'M','C',6.5,803,'tt0112864'),
  (869,'Planet of the Apes',2001,119,'M','C',5.7,201,'tt0133152'),
  (152532,'Dallas Buyers Club',2013,117,'MA','C',7.8,281,'tt0790636'),
  (58595,'Snow White and the Huntsman',2012,127,'M','C',5.4,1076,'tt1735898'),
  (10141,'Dirty Rotten Scoundrels',1988,110,'PG','C',7.1,18,'tt0095031'),
  (62211,'Monsters University',2013,104,'G','C',7,1032,'tt1453405'),
  (1637,'Speed',1994,116,'MA','C',6.3,302,'tt0111257'),
  (209112,'Batman v Superman: Dawn of Justice',2016,151,'M','C',5.6,2822,'tt2975590'),
  (8818,'Evita',1996,134,'PG','C',5.7,13,'tt0116250'),
  (10648,'Magnum Force',1973,124,'MA','C',7.1,21,'tt0070355'),
  (11300,'Something Wild',1986,113,'MA','C',6.4,4,'tt0091983'),
  (3981,'What Women Want',2000,127,'M','C',5.8,188,'tt0207201'),
  (65754,'The Girl with the Dragon Tattoo',2009,158,'MA','C',6.6,678,'tt1568346'),
  (95,'Armageddon',1998,151,'M','C',6.2,760,'tt0120591'),
  (8866,'The Truth About Cats & Dogs',1996,93,'M','C',6.4,8,'tt0117979'),
  (674,'Harry Potter and the Goblet of Fire',2005,157,'M','C',6.7,1644,'tt0330373'),
  (11003,'The Wedding Singer',1998,95,'M','C',6.4,116,'tt0120888'),
  (1930,'The Amazing Spider-Man',2012,136,'M','C',6.2,2987,'tt0948470'),
  (1422,'The Departed',2006,151,'MA','C',7.3,1124,'tt0407887'),
  (261860,'Dior and I',2015,90,'M','C',7.2,28,'tt3539664'),
  (120467,'The Grand Budapest Hotel',2014,99,'MA','C',8.1,746,'tt2278388'),
  (85350,'Boyhood',2014,165,'MA','C',7.9,510,'tt1065073'),
  (903,'Cool Hand Luke',1967,126,'M','C',7,51,'tt0061512'),
  (293660,'Deadpool',2016,108,'MA','C',7.1,4387,'tt1431045'),
  (22,'Pirates of the Caribbean: The Curse of the Black Pearl',2003,143,'M','C',6.9,2114,'tt0325980'),
  (712,'Four Weddings and a Funeral',1994,117,'M','C',6.1,55,'tt0109831'),
  (102382,'The Amazing Spider-Man 2',2014,142,'M','C',7.1,464,'tt1872181'),
  (2567,'The Aviator',2004,170,'M','C',6.2,205,'tt0338751'),
  (45772,'Gnomeo & Juliet',2011,84,'G','C',6,110,'tt0377981'),
  (816,'Austin Powers: International Man of Mystery',1997,94,'M','C',6.3,201,'tt0118655'),
  (11287,'A League of Their Own',1992,128,'PG','C',6.4,55,'tt0104694'),
  (24,'Kill Bill: Vol. 1',2003,111,'MA','C',6.9,1021,'tt0266697'),
  (11631,'Mamma Mia!',2008,108,'M','C',5.9,211,'tt0795421'),
  (773,'Little Miss Sunshine',2006,102,'MA','C',6.8,270,'tt0449059'),
  (11584,'Roxanne',1987,107,'PG','C',7.1,12,'tt0093886'),
  (121,'The Lord of the Rings: The Two Towers',2002,179,'M','C',7.4,2877,'tt0167261'),
  (91314,'Transformers: Age of Extinction',2014,165,'PG','C',6.7,343,'tt2109248'),
  (557,'Spider-Man',2002,121,'M','C',6.2,1500,'tt0145487'),
  (37799,'The Social Network',2010,120,'M','C',6.8,832,'tt1285016'),
  (82693,'Silver Linings Playbook',2012,122,'MA','C',6.7,1603,'tt1045658'),
  (414,'Batman Forever',1995,121,NULL,'C',5.3,341,'tt0112462'),
  (114,'Pretty Woman',1990,119,'MA','C',6.4,303,'tt0100405'),
  (509,'Notting Hill',1999,124,'M','C',6.3,162,'tt0125439'),
  (50646,'Crazy, Stupid, Love.',2011,118,'M','C',6.6,548,'tt1570728'),
  (50544,'Friends With Benefits',2011,109,'M','C',6,409,'tt1632708'),
  (24428,'The Avengers',2012,143,'M','C',7.1,5995,'tt0848228'),
  (9398,'Zoolander',2001,89,'M','C',5.9,151,'tt0196229'),
  (163,'Ocean''s Twelve',2004,125,'M','C',6.3,587,'tt0349903'),
  (7350,'The Bucket List',2007,97,'M','C',6.6,233,'tt0825232'),
  (10764,'Quantam of Solace',2008,106,'M','C',6,531,'tt0830515'),
  (153,'Lost in Translation',2003,102,'MA','C',7,369,'tt0335266'),
  (59436,'Midnight in Paris',2011,94,'M','C',7.7,410,'tt1605783'),
  (164,'Breakfast at Tiffany''s',1961,110,'PG','C',6.8,162,'tt0054698'),
  (58574,'Sherlock Holmes: A Game of Shadows',2011,129,'M','C',6.7,1361,'tt1515091'),
  (2022,'Mr. Deeds',2002,96,'M','C',6,127,'tt0280590'),
  (804,'Roman Holiday',1953,118,'PG','B',7.8,56,'tt0046250'),
  (16614,'Adventureland',2009,107,'M','C',6.2,104,'tt1091722'),
  (19908,'Zombieland',2009,88,'MA','C',7,878,'tt1156398'),
  (310,'Bruce Almighty',2003,101,'M','C',6,663,'tt0315327'),
  (10193,'Toy Story 3',2010,103,'G','C',7.2,1603,'tt0435761'),
  (607,'Men in Black',1997,98,'M','C',6.5,1425,'tt0119654'),
  (381,'To Catch a Thief',1955,106,'M','C',7.4,30,'tt0048728'),
  (241259,'Alice Through the Looking Glass',2016,118,'PG','C',6.6,283,'tt2567026'),
  (37247,'The Graduate',1967,106,'PG','C',6.6,107,'tt0061722'),
  (817,'Austin Powers: The Spy Who Shagged Me',1999,95,'M','C',5.9,186,'tt0145660'),
  (787,'Mr. & Mrs. Smith',2005,120,'M','C',6.3,524,'tt0356910'),
  (1726,'Iron Man',2008,126,'M','C',7,3791,'tt0371746'),
  (10330,'Freaky Friday',2003,97,'PG','C',5.7,97,'tt0322330'),
  (37724,'Skyfall',2012,143,'M','C',6.5,3941,'tt1074638'),
  (568,'Apollo 13',1995,140,'PG','C',6.6,375,'tt0112384'),
  (271110,'Captain America: Civil War',2016,146,'M','C',6.9,2301,'tt3498820'),
  (287,'Bull Durham',1988,108,'MA','C',7,22,'tt0094812'),
  (77,'Memento',2000,113,'MA','C',7.4,788,'tt0209144'),
  (12445,'Harry Potter and the Deathly Hallows: Part 2',2011,130,'M','C',7.2,1869,'tt1201607'),
  (9277,'The Sting',1973,129,'PG','C',7.5,82,'tt0070735'),
  (257211,'The Intern',2015,121,'M','C',7.1,975,'tt2361509'),
  (1574,'Chicago',2002,113,'M','C',6,118,'tt0299658'),
  (137,'Groundhog Day',1993,101,'PG','C',6.8,396,'tt0107048'),
  (100402,'Captain America: The Winter Soldier',2014,128,'M','C',7.7,552,'tt1843866'),
  (43074,'Ghostbusters',2016,116,'PG','C',5.3,147,'tt1289401'),
  (629,'The Usual Suspects',1995,106,'MA','C',7.7,726,'tt0114814'),
  (6037,'Murder by Death',1976,94,'PG','C',8.1,23,'tt0074937'),
  (818,'Austin Powers in Goldmember',2002,94,'M','C',6.1,202,'tt0295178'),
  (4995,'Boogie Nights',1997,155,'MA','C',6.8,103,'tt0118749'),
  (559,'Spider-Man 3',2007,139,'M','C',5.6,898,'tt0413300'),
  (74643,'The Artist',2011,100,'M','B',7.1,222,'tt1655442'),
  (539,'Psycho',1960,109,'MA','B',7.2,309,'tt0054215'),
  (714,'Tomorrow Never Dies',1997,119,'M','C',5.8,235,'tt0120347'),
  (424,'Schindler''s List',1993,195,'MA','B',7.6,1128,'tt0108052'),
  (68721,'Iron Man 3',2013,130,NULL,'C',6.8,4681,'tt1300854'),
  (403,'Driving Miss Daisy',1989,99,'PG','C',7.2,41,'tt0097239'),
  (127585,'X-Men: Days of Future Past',2014,131,'M','C',7.9,592,'tt1877832'),
  (9471,'Charlie''s Angels: Full Throttle',2003,106,'PG','C',5.6,169,'tt0305357'),
  (745,'The Sixth Sense',1999,107,'M','C',7.1,754,'tt0167404'),
  (675,'Harry Potter and the Order of the Phoenix',2007,138,'M','C',6.7,1613,'tt0373889'),
  (10537,'The Doors',1991,140,'MA','C',6.9,32,'tt0101761'),
  (80278,'The Impossible',2012,113,'M','C',6.6,484,'tt1649419'),
  (862,'Toy Story',1995,81,'G','C',7.2,1696,'tt0114709'),
  (268,'Batman',1989,126,'M','C',6.5,488,'tt0096895'),
  (4327,'Charlie''s Angels',2000,98,'PG','C',5.3,200,'tt0160127'),
  (43347,'Love & Other Drugs',2010,112,'MA','C',6.2,172,'tt0758752'),
  (49040,'The Bourne Legacy',2012,120,'M','C',5.8,1361,'tt1194173'),
  (243,'High Fidelity',2000,113,'MA','C',6.7,119,'tt0146882'),
  (44147,'Wild Target',2010,98,'M','C',6.5,22,'tt1235189'),
  (2067,'Mission to Mars',2000,114,'PG','C',6.2,43,'tt0183523'),
  (36657,'X-Men',2000,104,'M','C',6.5,1693,'tt0120903'),
  (22538,'Scott Pilgrim vs. the World',2010,112,'M','C',7,513,'tt0446029'),
  (597,'Titanic',1997,194,'M','C',6.8,2414,'tt0120338'),
  (9928,'Robots',2005,91,'PG','C',5.8,288,'tt0358082'),
  (10710,'Envy',2004,99,'PG','C',6.1,15,'tt0326856'),
  (68718,'Django Unchained',2012,165,'MA','C',7.3,4393,'tt1853728'),
  (8952,'I Love You Phillip Morris',2009,98,'MA','C',6.1,75,'tt1045772'),
  (861,'Total Recall',1990,113,'MA','C',6.6,360,'tt0100802'),
  (16084,'Freaky Friday',1976,95,'G','C',7.2,13,'tt0076054'),
  (881,'A Few Good Men',1992,138,'M','C',6.7,190,'tt0104257'),
  (7131,'Van Helsing',2004,131,'M','C',5.8,327,'tt0338526'),
  (1552,'Parenthood',1989,124,'M','C',6.9,21,'tt0098067'),
  (4638,'Hot Fuzz',2007,121,'MA','C',6.8,478,'tt0425112'),
  (68734,'Argo',2012,120,'M','C',6.7,1473,'tt1024648'),
  (10137,'Stuart Little',1999,84,'PG','C',5.6,141,'tt0164912'),
  (1493,'Miss Congeniality',2000,109,'M','C',6,169,'tt0212346'),
  (1571,'Live Free or Die Hard',2007,128,'M','C',6.3,816,'tt0337978'),
  (8699,'Anchorman: The Legend of Ron Burgundy',2004,94,'M','C',6.6,312,'tt0357413'),
  (2157,'Lost in Space',1998,130,'PG','C',5.2,53,'tt0120738'),
  (604,'The Matrix Reloaded',2003,138,'MA','C',6.5,1317,'tt0234215'),
  (211672,'Minions',2015,91,NULL,'C',6.6,263,'tt2293640'),
  (155,'The Dark Knight',2008,152,'M','C',7.7,4843,'tt0468569'),
  (101299,'The Hunger Games: Catching Fire',2013,146,'M','C',7.7,890,'tt1951264'),
  (245,'About a Boy',2002,101,'M','C',6.3,89,'tt0276751'),
  (242582,'Nightcrawler',2014,117,'MA','C',7.7,583,'tt2872718'),
  (544,'There''s Something About Mary',1998,119,'MA','C',6.3,223,'tt0129387'),
  (7446,'Tropic Thunder',2008,107,'MA','C',6.2,273,'tt0942385'),
  (11665,'Get Smart',2008,110,'PG','C',5.8,228,'tt0425061'),
  (744,'Top Gun',1986,110,'PG','C',6.3,446,'tt0092099'),
  (9472,'DodgeBall: A True Underdog Story',2004,92,'PG','C',6.4,182,'tt0364725'),
  (1771,'Captain America: The First Avenger',2011,124,'M','C',6.2,2815,'tt0458339'),
  (9778,'Serendipity',2001,90,'M','C',6.4,105,'tt0240890'),
  (54138,'Star Trek Into Darkness',2013,132,'M','C',7.5,1898,'tt1408101'),
  (807,'Se7en',1995,127,'MA','C',7.5,1557,'tt0114369'),
  (11132,'Confessions of a Teenage Drama Queen',2004,89,'PG','C',4.7,19,'tt0361467'),
  (49051,'The Hobbit: An Unexpected Journey',2012,169,'M','C',6.6,4257,'tt0903624'),
  (2698,'Evan Almighty',2007,96,'PG','C',5.4,185,'tt0413099'),
  (747,'Shaun of the Dead',2004,99,'MA','C',7,377,'tt0365748'),
  (9502,'Kung Fu Panda',2008,90,'PG','C',6.5,945,'tt0441773'),
  (314,'Catwoman',2004,104,'PG','C',4.9,107,'tt0327554'),
  (74465,'We Bought a Zoo',2011,124,'PG','C',6.2,179,'tt1389137'),
  (585,'Monsters, Inc.',2001,92,'G','C',7,2371,'tt0198781'),
  (56292,'Mission: Impossible - Ghost Protocol',2011,133,'M','C',6.4,1788,'tt1229238'),
  (863,'Toy Story 2',1999,92,'G','C',6.7,945,'tt0120363'),
  (70,'Million Dollar Baby',2004,132,'M','C',7,371,'tt0405159'),
  (1584,'School of Rock',2003,108,'M','C',6.1,279,'tt0332379'),
  (19995,'Avatar',2009,162,'M','C',6.9,5601,'tt0499549'),
  (118,'Charlie and the Chocolate Factory',2005,115,'PG','C',6,426,'tt0367594'),
  (109445,'Frozen',2013,102,'G','C',7.7,799,'tt2294629'),
  (31052,'The Accidental Tourist',1988,121,'PG','C',5.9,4,'tt0094606'),
  (152760,'The Monuments Men',2014,118,'M','C',6.2,199,'tt2177771'),
  (2501,'The Bourne Identity',2002,119,'M','C',7,1518,'tt0258463'),
  (36669,'Die Another Day',2002,133,'M','C',5.7,283,'tt0246460'),
  (131634,'The Hunger Games: Mockingjay - Part 2',2015,136,'M','C',6.6,1914,'tt1951266'),
  (1895,'Star Wars: Episode III - Revenge of the Sith',2005,140,'M','C',6.7,1127,'tt0121766'),
  (236,'Muriel''s Wedding',1994,106,'MA','C',7,15,'tt0110598'),
  (27205,'Inception',2010,148,NULL,'C',7.5,5754,'tt1375666'),
  (298,'Ocean''s Thirteen',2007,122,'M','C',6.3,680,'tt0496806'),
  (127380,'Finding Dory',2016,103,'G','C',6.5,593,'tt2277860'),
  (564,'The Mummy',1999,124,'M','C',6,783,'tt0120616'),
  (676,'Pearl Harbor',2001,183,'M','C',6,315,'tt0213149'),
  (80035,'The Watch',2012,98,'MA','C',5.1,227,'tt1298649'),
  (1573,'Die Hard 2',1990,124,'M','C',6.3,699,'tt0099423'),
  (824,'Moulin Rouge!',2001,127,'M','C',6.8,208,'tt0203009'),
  (489,'Good Will Hunting',1997,126,'M','C',7.1,470,'tt0119217'),
  (603,'The Matrix',1999,136,'MA','C',7.5,3773,'tt0133093'),
  (329833,'Zoolander 2',2016,100,'M','C',4.7,337,'tt1608290'),
  (4808,'Charade',1963,113,'M','C',7.5,69,'tt0056923'),
  (21332,'Quicksilver',1986,115,'PG','C',6.1,111,'tt0091814'),
  (651,'MASH',1970,116,'M','C',7.5,35,'tt0066026'),
  (9522,'Wedding Crashers',2005,119,'MA','C',6.2,228,'tt0396269'),
  (254,'King Kong',2005,187,'M','C',6.2,418,'tt0360717'),
  (299,'Ocean''s Eleven',1960,127,'PG','C',6.1,20,'tt0054135'),
  (1824,'50 First Dates',2004,99,'M','C',6.4,455,'tt0343660'),
  (671,'Harry Potter and the Philosopher''s Stone',2001,152,'PG','C',6.7,2191,'tt0241527'),
  (34544,'The A-Team',2010,117,'PG','C',6.2,545,'tt0429493'),
  (36685,'The Rocky Horror Picture Show',1975,100,'MA','C',6.3,72,'tt0073629'),
  (27578,'The Expendables',2010,103,'MA','C',5.8,1213,'tt1320253'),
  (82695,'Les Miserables',2012,157,'M','C',6.8,612,'tt1707386'),
  (131631,'The Hunger Games: Mockingjay - Part 1',2014,123,'M','C',6.7,2019,'tt1951265'),
  (86834,'Noah',2014,139,'PG','C',5.9,313,'tt1959490'),
  (157336,'Interstellar',2014,169,'M','C',8.6,1453,'tt0816692'),
  (12157,'Green Card',1990,108,'PG','C',5.9,10,'tt0099699'),
  (10536,'The Italian Job',1969,99,'M','C',7.8,36,'tt0064505'),
  (274,'The Silence of the Lambs',1991,118,'MA','C',7.4,1002,'tt0102926'),
  (278,'The Shawshank Redemption',1994,142,'MA','C',8,3306,'tt0111161'),
  (9880,'The Princess Diaries',2001,115,'G','C',5.6,118,'tt0247638'),
  (1621,'Trading Places',1983,116,'MA','C',6.8,70,'tt0086465'),
  (11520,'Grumpy Old Men',1993,103,'PG','C',6.5,26,'tt0107050'),
  (272,'Batman Begins',2005,140,'M','C',7.1,2622,'tt0372784'),
  (9384,'Starsky & Hutch',2004,101,'M','C',5.8,97,'tt0335438'),
  (7326,'Juno',2007,96,'M','C',6.5,439,'tt0467406'),
  (871,'Planet of the Apes',1968,112,'M','C',6.8,149,'tt0063442'),
  (672,'Harry Potter and the Chamber of Secrets',2002,161,'PG','C',6.7,1628,'tt0295297'),
  (9836,'Happy Feet',2006,108,'G','C',5.6,362,'tt0366548'),
  (508,'Love Actually',2003,135,'MA','C',6.7,465,'tt0314331'),
  (7980,'The Lovely Bones',2009,135,'M','C',6.2,150,'tt0380510'),
  (87827,'Life Of Pi',2012,127,'PG','C',7.8,231,'tt0454876'),
  (8966,'Twilight',2008,122,'M','C',5.5,850,'tt1099212'),
  (114150,'Pitch Perfect',2012,112,'M','C',6.7,462,'tt1981677'),
  (7552,'Fun With Dick and Jane',2005,90,'PG','C',6.2,115,'tt0369441'),
  (11808,'US Marshals',1998,131,'M','C',6.2,235,'tt0120873'),
  (11199,'Wild Hogs',2007,100,'M','C',5.8,85,'tt0486946'),
  (393,'Kill Bill: Vol. 2',2004,136,'MA','C',7,750,'tt0378194'),
  (72105,'Ted',2012,106,NULL,'C',6.2,1554,'tt1637725'),
  (142,'Brokeback Mountain',2005,134,'MA','C',6.5,204,'tt0388795'),
  (162,'Edward Scissorhands',1990,105,'PG','C',6.7,492,'tt0099487'),
  (562,'Die Hard',1988,131,'M','C',6.9,1692,'tt0095016'),
  (558,'Spider-Man 2',2004,127,'M','C',6.1,1315,'tt0316654'),
  (32856,'Valentine''s Day',2010,125,'M','C',5.4,175,'tt0817230'),
  (49521,'Man of Steel',2013,143,'M','C',6.6,2637,'tt0770828'),
  (1633,'Fried Green Tomatoes',1991,130,'PG','C',6.9,30,'tt0101921'),
  (68728,'Oz: The Great and Powerful',2013,130,'PG','C',5.5,2102,'tt1623205'),
  (1819,'You, Me and Dupree',2006,108,'M','C',5.4,49,'tt0463034'),
  (8963,'Crimson Tide',1995,116,'M','C',6.7,100,'tt0112740'),
  (39513,'Paul',2011,104,'MA','C',6.4,338,'tt1092026'),
  (10688,'Hamlet',2000,112,'M','C',6,1,'tt0171359'),
  (45243,'The Hangover Part II',2011,102,'MA','C',5.8,1513,'tt1411697'),
  (122,'The Lord of the Rings: The Return of the King',2003,201,'M','C',7.5,3307,'tt0167260'),
  (17696,'Robin and the 7 Hoods',1964,123,'PG','C',7.2,3,'tt0058529'),
  (10316,'The Ides of March',2011,101,'MA','C',6.1,191,'tt1124035'),
  (355008,'Special Correspondents',2016,100,'M','C',5.6,56,'tt4181052'),
  (11356,'The Odd Couple',1968,106,'M','C',7.9,6,'tt0063374'),
  (475,'Bonnie and Clyde',1967,111,'MA','C',7.5,37,'tt0061418'),
  (11450,'Quiz Show',1994,133,'M','C',6.5,134,'tt1100932'),
  (4944,'Burn After Reading',2008,96,'MA','C',6.3,226,'tt0887883'),
  (415,'Batman & Robin',1997,125,'M','C',4.8,272,'tt0118688'),
  (790,'The Fog',1980,89,'MA','C',6.6,27,'tt0080749'),
  (161,'Ocean''s Eleven',2001,116,'M','C',6.8,1606,'tt0240772'),
  (10625,'Mean Girls',2004,97,'M','C',6.6,245,'tt0377092'),
  (10364,'Catch-22',1970,121,'M','C',7.4,8,'tt0065528'),
  (271718,'Trainwreck',2015,125,'M','C',6.1,721,'tt3152624'),
  (9481,'The Bone Collector',1999,118,'MA','C',6.2,111,'tt0145681'),
  (1541,'Thelma & Louise',1991,130,'MA','C',6.8,98,'tt0103074'),
  (2034,'Training Day',2001,122,'MA','C',6.7,317,'tt0139654'),
  (212778,'Chef',2014,115,'M','C',7.6,31,'tt2883512'),
  (550,'Fight Club',1999,139,'MA','C',7.7,2940,'tt0137523'),
  (2616,'Uncle Buck',1989,100,'PG','C',6.6,421,'tt0098554'),
  (10776,'Little Shop of Horrors',1986,94,'M','C',5.9,50,'tt0091419'),
  (767,'Harry Potter and the Half-Blood Prince',2009,153,'M','C',6.8,1499,'tt0417741'),
  (290250,'The Nice Guys',2016,116,'M','C',6.9,322,'tt3799694'),
  (316023,'Mike & Dave Need Wedding Dates',2016,98,'M','C',5.7,31,'tt2823054'),
  (277,'Underworld',2003,121,'MA','C',6.8,377,'tt0320691'),
  (120,'The Lord of the Rings: The Fellowship of the Ring',2001,178,'M','C',7.4,3515,'tt0120737'),
  (206647,'Spectre',2015,148,'M','C',6.2,2844,'tt2379713'),
  (1858,'Transformers',2007,144,'M','C',6.6,1423,'tt0418279'),
  (680,'Pulp Fiction',1994,154,'MA','C',7.6,2682,'tt0110912'),
  (226486,'Tammy',2014,97,'M','C',4.9,32,'tt2103254'),
  (187,'Sin City',2005,124,'MA','B',6.8,640,'tt0401792'),
  (22970,'The Cabin in the Woods',2012,95,'MA','C',6.3,570,'tt1259521'),
  (673,'Harry Potter and the Prisoner of Azkaban',2004,141,'PG','C',6.8,1526,'tt0304141'),
  (70160,'The Hunger Games',2012,142,'M','C',6.3,4508,'tt1392170'),
  (12096,'The Pink Panther',2006,93,'PG','C',5.7,69,'tt0383216'),
  (168672,'American Hustle',2013,138,'M','C',7.1,460,'tt1800241'),
  (1593,'Night at the Museum',2006,108,'PG','C',5.8,400,'tt0477347'),
  (421,'The Life Aquatic With Steve Zissou',2004,119,'MA','C',7,133,'tt0362270'),
  (9676,'The Black Dahlia',2006,121,'MA','C',6.1,36,'tt0387877'),
  (62213,'Dark Shadows',2012,113,'M','C',5.5,582,'tt1077368'),
  (11774,'Lemony Snicket''s A Series of Unfortunate Events',2004,108,'PG','C',6.2,176,'tt0339291'),
  (49026,'The Dark Knight Rises',2012,165,'M','C',7.2,4243,'tt1345836'),
  (605,'The Matrix Revolutions',2003,129,'MA','C',6.3,1183,'tt0242653'),
  (9377,'Ferris Bueller''s Day Off',1986,103,'PG','C',6.7,316,'tt0091042'),
  (72190,'World War Z',2013,116,'M','C',6.8,1498,'tt0816711'),
  (62838,'New Year''s Eve',2011,118,'M','C',5.5,115,'tt1598822'),
  (2759,'The Adventures of Priscilla, Queen of the Desert',1994,104,'MA','C',7,18,'tt0109045'),
  (78,'Blade Runner',1982,117,'MA','C',7.5,986,'tt0083658'),
  (76492,'Hotel Transylvania',2012,91,'PG','C',6.5,761,'tt0837562'),
  (4599,'Raising Helen',2004,119,'M','C',6.3,17,'tt0350028'),
  (10549,'Hamlet',1996,242,'M','C',6.8,15,'tt0116477'),
  (634,'Bridget Jones''s Diary',2001,97,'MA','C',6.2,157,'tt0243155'),
  (10528,'Sherlock Holmes',2009,128,'M','C',6.7,2315,'tt0988045'),
  (18785,'The Hangover',2009,100,'MA','C',6.8,2173,'tt1119646'),
  (141,'Donnie Darko',2001,113,'MA','C',7.3,542,'tt0246578'),
  (11967,'Young Guns',1988,107,'MA','C',6.5,202,'tt0096487'),
  (9722,'Bewitched',2005,102,'M','C',5.1,56,'tt0374536'),
  (58233,'Johnny English Reborn',2011,101,'PG','C',6.1,298,'tt1634122'),
  (8467,'Dumb and Dumber',1994,107,'PG','C',6.4,211,'tt0109686'),
  (9654,'The Italian Job',2003,111,'M','C',6.3,610,'tt0317740'),
  (10195,'Thor',2011,115,'M','C',6.3,2533,'tt0800369'),
  (64635,'Total Recall',2012,121,'M','C',5.7,1089,'tt1386703'),
  (350,'The Devil Wears Prada',2006,109,'M','C',6.4,354,'tt0458352'),
  (23082,'The Invention of Lying',2009,100,'M','C',5.9,92,'tt1058017'),
  (788,'Mrs. Doubtfire',1993,125,'M','C',6.3,146,'tt0107614'),
  (203801,'The Man from U.N.C.L.E.',2015,116,'M','C',7,1267,'tt1638355'),
  (77866,'Contraband',2012,109,'MA','C',6,285,'tt1524137'),
  (76338,'Thor: The Dark World',2013,112,'M','C',7.1,818,'tt1981115'),
  (12560,'The Big Chill',1983,105,'M','C',8.4,14,'tt0085244'),
  (57201,'The Lone Ranger',2013,149,'M','C',6.1,610,'tt1210819'),
  (12444,'Harry Potter and the Deathly Hallows: Part 1',2010,146,'M','C',6.9,1675,'tt0926084'),
  (10138,'Iron Man 2',2010,124,'M','C',6.5,3033,'tt1228705'),
  (83542,'Cloud Atlas',2012,172,'MA','C',6.3,1204,'tt1371111'),
  (534,'Terminator Salvation',2009,115,'M','C',5.8,782,'tt0438488'),
  (6957,'The 40 Year Old Virgin',2005,116,'MA','C',6.1,361,'tt0405422'),
  (76163,'The Expendables 2',2012,103,'MA','C',5.9,1398,'tt1764651'),
  (9486,'Johnny English',2003,88,'PG','C',6,149,'tt0274166'),
  (83686,'The Words',2012,96,'PG','C',6.1,55,'tt1840417'),
  (2289,'Cold Mountain',2003,154,'MA','C',6.3,93,'tt0159365'),
  (9899,'The Producers',2005,134,'M','C',6.5,18,'tt0395251'),
  (9824,'Mystery Men',1999,121,'PG','C',5.9,28,'tt0132347'),
  (10264,'Hamlet',1990,130,'PG','C',5.8,9,'tt0099726'),
  (49047,'Gravity',2013,91,'PG','C',7.9,1083,'tt1454468'),
  (5503,'The Fugitive',1993,130,'M','C',6.7,292,'tt0106977'),
  (642,'Butch Cassidy and the Sundance Kid',1969,110,'PG','C',6.4,180,'tt0064115'),
  (1635,'The Island',2005,136,'M','C',6.3,328,'tt0399201'),
  (23629,'Sucker Punch',2011,110,'MA','C',5.9,379,'tt0978764'),
  (37233,'The Firm',1993,154,'MA','C',6.7,58,'tt0106918'),
  (136795,'The Heat',2013,117,'MA','C',6.7,450,'tt2404463'),
  (9798,'Enemy of the State',1998,132,'M','C',6.3,423,'tt0120660'),
  (44214,'Black Swan',2010,108,'MA','C',6.5,996,'tt0947798'),
  (275,'Fargo',1996,98,'MA','C',7.2,310,'tt0116282'),
  (286217,'The Martian',2015,141,'M','C',7.6,3717,'tt3659388');


INSERT INTO ACTOR9468 (ActorNo,FullName,GivenName,Surname,Gender,Birthdate,IMDBid,BirthCountry) values 
(7,'Andrew Stanton','Andrew','Stanton','M',CONVERT(DATETIME,'13/01/1958',103),'nm0004056','USA'),
(8,'Lee Unkrich','Lee','Unkrich','M',CONVERT(DATETIME,'08/08/1967',103),'nm0881279','USA'),
(10,'Bob Peterson','Bob','Peterson','M',CONVERT(DATETIME,'18/01/1961',103),'nm0677037','USA'),
(19,'Allison Janney','Allison','Janney','F',CONVERT(DATETIME,'19/11/1959',103),'nm0005049','USA'),
(31,'Tom Hanks','Tom','Hanks','M',CONVERT(DATETIME,'09/07/1956',103),'nm0000158','USA'),
(35,'Sally Field','Sally','Field','F',CONVERT(DATETIME,'06/11/1946',103),'nm0000398','USA'),
(48,'Sean Bean','Sean','Bean','M',CONVERT(DATETIME,'17/04/1959',103),'nm0000293','England'),
(62,'Bruce Willis','Bruce','Willis','M',CONVERT(DATETIME,'19/03/1955',103),'nm0000246','Germany'),
(64,'Gary Oldman','Gary','Oldman','M',CONVERT(DATETIME,'21/03/1958',103),'nm0000198','England'),
(65,'Ian Holm','Ian','Holm','M',CONVERT(DATETIME,'12/09/1931',103),'nm0000453','England'),
(85,'Johnny Depp','Johnny','Depp','M',CONVERT(DATETIME,'09/06/1963',103),'nm0000136','USA'),
(109,'Elijah Wood','Elijah','Wood','M',CONVERT(DATETIME,'28/01/1981',103),'nm0000704','USA'),
(110,'Viggo Mortensen','Viggo','Mortensen','M',CONVERT(DATETIME,'20/10/1958',103),'nm0001557','USA'),
(112,'Cate Blanchett','Cate','Blanchett','F',CONVERT(DATETIME,'14/05/1969',103),'nm0000949','Australia'),
(113,'Christopher Lee','Christopher','Lee','M',CONVERT(DATETIME,'27/05/1922',103),'nm0000489','England'),
(114,'Orlando Bloom','Orlando','Bloom','M',CONVERT(DATETIME,'13/01/1977',103),'nm0089217','England'),
(131,'Jake Gyllenhaal','Jake','Gyllenhaal','M',CONVERT(DATETIME,'19/12/1980',103),'nm0350453','USA'),
(134,'Jamie Foxx','Jamie','Foxx','M',CONVERT(DATETIME,'13/12/1967',103),'nm0004937','USA'),
(139,'Uma Thurman','Uma','Thurman','F',CONVERT(DATETIME,'29/04/1970',103),'nm0000235','USA'),
(140,'Lucy Liu','Lucy','Liu','F',CONVERT(DATETIME,'02/12/1968',103),'nm0005154','USA'),
(147,'Michael Madsen','Michael','Madsen','M',CONVERT(DATETIME,'25/09/1957',103),'nm0000514','USA'),
(192,'Morgan Freeman','Morgan','Freeman','M',CONVERT(DATETIME,'01/06/1937',103),'nm0000151','USA'),
(193,'Gene Hackman','Gene','Hackman','M',CONVERT(DATETIME,'30/01/1930',103),'nm0000432','USA'),
(205,'Kirsten Dunst','Kirsten','Dunst','F',CONVERT(DATETIME,'30/04/1982',103),'nm0000379','USA'),
(206,'Jim Carrey','Jim','Carrey','M',CONVERT(DATETIME,'17/01/1962',103),'nm0000120','Canada'),
(207,'Tom Wilkinson','Tom','Wilkinson','M',CONVERT(DATETIME,'05/02/1948',103),'nm0929489','England'),
(227,'William Hurt','William','Hurt','M',CONVERT(DATETIME,'20/03/1950',103),'nm0000458','USA'),
(228,'Ed Harris','Ed','Harris','M',CONVERT(DATETIME,'28/11/1950',103),'nm0000438','USA'),
(287,'Brad Pitt','Brad','Pitt','M',CONVERT(DATETIME,'18/12/1963',103),'nm0000093','USA'),
(335,'Michael Shannon','Michael','Shannon','M',CONVERT(DATETIME,'07/08/1974',103),'nm0788335','USA'),
(349,'Scott Glenn','Scott','Glenn','M',CONVERT(DATETIME,'26/01/1941',103),'nm0001277','USA'),
(368,'Reese Witherspoon','Reese','Witherspoon','F',CONVERT(DATETIME,'22/03/1976',103),'nm0000702','USA'),
(378,'Jonathan Pryce','Jonathan','Pryce','M',CONVERT(DATETIME,'01/06/1947',103),'nm0000596','Wales'),
(380,'Robert De Niro','Robert','De Niro','M',CONVERT(DATETIME,'17/08/1943',103),'nm0000134','USA'),
(388,'Jim Broadbent','Jim','Broadbent','M',CONVERT(DATETIME,'24/05/1949',103),'nm0000980','England'),
(448,'Hilary Swank','Hilary','Swank','F',CONVERT(DATETIME,'30/07/1974',103),'nm0005476','USA'),
(454,'Michael Peña','Michael','Peña','M',CONVERT(DATETIME,'13/01/1976',103),'nm0671567','USA'),
(477,'Julie Walters','Julie','Walters','F',CONVERT(DATETIME,'22/02/1950',103),'nm0910278','England'),
(500,'Tom Cruise','Tom','Cruise','M',CONVERT(DATETIME,'03/07/1962',103),'nm0000129','USA'),
(504,'Tim Robbins','Tim','Robbins','M',CONVERT(DATETIME,'16/10/1958',103),'nm0000209','USA'),
(514,'Jack Nicholson','Jack','Nicholson','M',CONVERT(DATETIME,'22/04/1937',103),'nm0000197','USA'),
(517,'Pierce Brosnan','Pierce','Brosnan','M',CONVERT(DATETIME,'16/05/1953',103),'nm0000112','Ireland'),
(524,'Natalie Portman','Natalie','Portman','F',CONVERT(DATETIME,'09/06/1981',103),'nm0000204','Israel'),
(526,'Lukas Haas','Lukas','Haas','M',CONVERT(DATETIME,'16/04/1976',103),'nm0001305','USA'),
(529,'Guy Pearce','Guy','Pearce','M',CONVERT(DATETIME,'05/10/1967',103),'nm0001602','England'),
(530,'Carrie-Anne Moss','Carrie-Anne','Moss','F',CONVERT(DATETIME,'21/08/1967',103),'nm0005251','Canada'),
(532,'Joe Pantoliano','Joe','Pantoliano','M',CONVERT(DATETIME,'12/09/1951',103),'nm0001592','USA'),
(534,'Mark Boone Junior','Mark','Boone Junior','M',CONVERT(DATETIME,'17/03/1955',103),'nm0095478','USA'),
(535,'Russ Fega','Russ','Fega','M',CONVERT(DATETIME,'08/02/1983',103),'nm0270383','Unknown'),
(537,'Stephen Tobolowsky','Stephen','Tobolowsky','M',CONVERT(DATETIME,'30/05/1951',103),'nm0864997','USA'),
(585,'Rutger Hauer','Rutger','Hauer','M',CONVERT(DATETIME,'23/01/1944',103),'nm0000442','Neterlands'),
(589,'Daryl Hannah','Daryl','Hannah','F',CONVERT(DATETIME,'03/12/1960',103),'nm0000435','USA'),
(655,'John Rhys-Davies','John','Rhys-Davies','M',CONVERT(DATETIME,'05/05/1944',103),'nm0722636','England'),
(658,'Alfred Molina','Alfred','Molina','M',CONVERT(DATETIME,'24/05/1953',103),'nm0000547','England'),
(707,'Dan Aykroyd','Dan','Aykroyd','M',CONVERT(DATETIME,'01/07/1952',103),'nm0000101','Canada'),
(819,'Edward Norton','Edward','Norton','M',CONVERT(DATETIME,'18/08/1969',103),'nm0001570','USA'),
(827,'Elliott Gould','Elliott','Gould','M',CONVERT(DATETIME,'29/08/1938',103),'nm0001285','USA'),
(865,'Michael Bay','Michael','Bay','M',CONVERT(DATETIME,'17/02/1965',103),'nm0000881','USA'),
(880,'Ben Affleck','Ben','Affleck','M',CONVERT(DATETIME,'15/08/1972',103),'nm0000255','USA'),
(882,'Liv Tyler','Liv','Tyler','F',CONVERT(DATETIME,'01/07/1977',103),'nm0000239','USA'),
(884,'Steve Buscemi','Steve','Buscemi','M',CONVERT(DATETIME,'13/12/1957',103),'nm0000114','USA'),
(886,'William Fichtner','William','Fichtner','M',CONVERT(DATETIME,'27/11/1956',103),'nm0001209','USA'),
(887,'Owen Wilson','Owen','Wilson','M',CONVERT(DATETIME,'18/11/1968',103),'nm0005562','USA'),
(934,'Russell Crowe','Russell','Crowe','M',CONVERT(DATETIME,'07/04/1964',103),'nm0000128','New Zealand'),
(976,'Jason Statham','Jason','Statham','M',CONVERT(DATETIME,'26/07/1967',103),'nm0005458','England'),
(1064,'Crispin Glover','Crispin','Glover','M',CONVERT(DATETIME,'20/04/1964',103),'nm0000417','USA'),
(1100,'Arnold Schwarzenegger','Arnold','Schwarzenegger','M',CONVERT(DATETIME,'30/07/1947',103),'nm0000216','Austria'),
(1121,'Benicio del Toro','Benicio','del Toro','M',CONVERT(DATETIME,'19/02/1967',103),'nm0001125','Puerto Rico'),
(1204,'Julia Roberts','Julia','Roberts','F',CONVERT(DATETIME,'28/10/1967',103),'nm0000210','USA'),
(1210,'Héctor Elizondo','Héctor','Elizondo','M',CONVERT(DATETIME,'22/12/1936',103),'nm0001185','USA'),
(1230,'John Goodman','John','Goodman','M',CONVERT(DATETIME,'20/06/1952',103),'nm0000422','USA'),
(1231,'Julianne Moore','Julianne','Moore','F',CONVERT(DATETIME,'03/12/1960',103),'nm0000194','USA'),
(1233,'Philip Seymour Hoffman','Philip','Seymour Hoffman','M',CONVERT(DATETIME,'23/07/1967',103),'nm0000450','USA'),
(1245,'Scarlett Johansson','Scarlett','Johansson','F',CONVERT(DATETIME,'22/11/1984',103),'nm0424060','USA'),
(1269,'Kevin Costner','Kevin','Costner','M',CONVERT(DATETIME,'18/01/1955',103),'nm0000126','USA'),
(1271,'Andy García','Andy','García','M',CONVERT(DATETIME,'12/04/1956',103),'nm0000412','Cuba'),
(1283,'Helena Bonham Carter','Helena','Bonham Carter','F',CONVERT(DATETIME,'26/05/1966',103),'nm0000307','England'),
(1294,'Missi Pyle','Missi','Pyle','F',CONVERT(DATETIME,'16/11/1972',103),'nm0701512','USA'),
(1327,'Ian McKellen','Ian','McKellen','M',CONVERT(DATETIME,'25/05/1939',103),'nm0005212','England'),
(1328,'Sean Astin','Sean','Astin','M',CONVERT(DATETIME,'25/02/1971',103),'nm0000276','USA'),
(1329,'Billy Boyd','Billy','Boyd','M',CONVERT(DATETIME,'28/08/1968',103),'nm0101710','Scotland'),
(1330,'Dominic Monaghan','Dominic','Monaghan','M',CONVERT(DATETIME,'08/12/1976',103),'nm0597480','Germany'),
(1331,'Hugo Weaving','Hugo','Weaving','M',CONVERT(DATETIME,'04/04/1960',103),'nm0915989','Nigeria'),
(1333,'Andy Serkis','Andy','Serkis','M',CONVERT(DATETIME,'20/04/1964',103),'nm0785227','England'),
(1365,'Lawrence Makoare','Lawrence','Makoare','M',CONVERT(DATETIME,'20/03/1968',103),'nm0538692','New Zealand'),
(1369,'Bernard Hill','Bernard','Hill','M',CONVERT(DATETIME,'17/12/1944',103),'nm0384060','England'),
(1371,'David Wenham','David','Wenham','M',CONVERT(DATETIME,'21/09/1965',103),'nm0920992','Australia'),
(1372,'Karl Urban','Karl','Urban','M',CONVERT(DATETIME,'07/06/1972',103),'nm0881631','New Zealand'),
(1461,'George Clooney','George','Clooney','M',CONVERT(DATETIME,'06/05/1961',103),'nm0000123','USA'),
(1532,'Bill Murray','Bill','Murray','M',CONVERT(DATETIME,'21/09/1950',103),'nm0000195','USA'),
(1533,'Andie MacDowell','Andie','MacDowell','F',CONVERT(DATETIME,'21/04/1958',103),'nm0000510','USA'),
(1542,'Willie Garson','Willie','Garson','M',CONVERT(DATETIME,'20/02/1964',103),'nm0308606','Unknown'),
(1640,'Stellan Skarsgård','Stellan','Skarsgård','M',CONVERT(DATETIME,'13/06/1951',103),'nm0001745','Sweden'),
(1643,'Adrian Rawlins','Adrian','Rawlins','M',CONVERT(DATETIME,'27/03/1958',103),'nm0712628','England'),
(1665,'Eddie Marsan','Eddie','Marsan','M',CONVERT(DATETIME,'23/06/1968',103),'nm0550371','England'),
(1771,'Giovanni Ribisi','Giovanni','Ribisi','M',CONVERT(DATETIME,'17/12/1974',103),'nm0000610','USA'),
(1813,'Anne Hathaway','Anne','Hathaway','F',CONVERT(DATETIME,'12/11/1982',103),'nm0004266','USA'),
(1834,'Shirley Henderson','Shirley','Henderson','F',CONVERT(DATETIME,'24/11/1965',103),'nm0376602','Scotland'),
(1892,'Matt Damon','Matt','Damon','M',CONVERT(DATETIME,'08/10/1970',103),'nm0000354','USA'),
(1893,'Casey Affleck','Casey','Affleck','M',CONVERT(DATETIME,'12/08/1975',103),'nm0000729','USA'),
(1894,'Scott Caan','Scott','Caan','M',CONVERT(DATETIME,'23/08/1976',103),'nm0004790','USA'),
(1895,'Carl Reiner','Carl','Reiner','M',CONVERT(DATETIME,'20/03/1922',103),'nm0005348','USA'),
(1896,'Don Cheadle','Don','Cheadle','M',CONVERT(DATETIME,'29/11/1964',103),'nm0000332','USA'),
(1897,'Bernie Mac','Bernie','Mac','M',CONVERT(DATETIME,'05/10/1957',103),'nm0005170','USA'),
(1898,'Eddie Jemison','Eddie','Jemison','M',CONVERT(DATETIME,'24/07/1963',103),'nm0420646','Unknown'),
(1900,'Shaobo Qin','Shaobo','Qin','M',CONVERT(DATETIME,'21/03/1982',103),'nm0702660','Unknown'),
(1903,'Alan Arkin','Alan','Arkin','M',CONVERT(DATETIME,'26/03/1934',103),'nm0000273','USA'),
(1920,'Winona Ryder','Winona','Ryder','F',CONVERT(DATETIME,'29/10/1971',103),'nm0000213','USA'),
(1922,'Catherine Zeta-Jones','Catherine','Zeta-Jones','F',CONVERT(DATETIME,'25/09/1969',103),'nm0001876','Wales'),
(1923,'Robbie Coltrane','Robbie','Coltrane','M',CONVERT(DATETIME,'30/03/1950',103),'nm0001059','Scotland'),
(1925,'Vincent Cassel','Vincent','Cassel','M',CONVERT(DATETIME,'23/11/1966',103),'nm0001993','France'),
(1926,'Eddie Izzard','Eddie','Izzard','M',CONVERT(DATETIME,'07/02/1962',103),'nm0412850','Yeman'),
(1932,'Audrey Hepburn','Audrey','Hepburn','F',CONVERT(DATETIME,'04/05/1929',103),'nm0000030','Belgium'),
(1936,'Martin Balsam','Martin','Balsam','M',CONVERT(DATETIME,'04/11/1919',103),'nm0000842','USA'),
(1954,'Billy Zane','Billy','Zane','M',CONVERT(DATETIME,'24/02/1966',103),'nm0000708','USA'),
(2037,'Cillian Murphy','Cillian','Murphy','M',CONVERT(DATETIME,'25/05/1976',103),'nm0614165','Ireland'),
(2039,'Brendan Gleeson','Brendan','Gleeson','M',CONVERT(DATETIME,'29/03/1955',103),'nm0322407','Ireland'),
(2053,'Bill Paxton','Bill','Paxton','M',CONVERT(DATETIME,'17/05/1955',103),'nm0000200','USA'),
(2141,'Ned Bellamy','Ned','Bellamy','M',CONVERT(DATETIME,'07/05/1957',103),'nm0068709','USA'),
(2157,'Robin Williams','Robin','Williams','M',CONVERT(DATETIME,'21/07/1951',103),'nm0000245','USA'),
(2176,'Tommy Lee Jones','Tommy','Lee Jones','M',CONVERT(DATETIME,'15/09/1946',103),'nm0000169','USA'),
(2192,'Lambert Wilson','Lambert','Wilson','M',CONVERT(DATETIME,'03/08/1958',103),'nm0933727','France'),
(2207,'Lois Smith','Lois','Smith','F',CONVERT(DATETIME,'03/11/1930',103),'nm0809135','Unknown'),
(2219,'Tobey Maguire','Tobey','Maguire','M',CONVERT(DATETIME,'27/06/1975',103),'nm0001497','USA'),
(2227,'Nicole Kidman','Nicole','Kidman','F',CONVERT(DATETIME,'20/06/1967',103),'nm0000173','USA'),
(2231,'Samuel L. Jackson','Samuel','L. Jackson','M',CONVERT(DATETIME,'21/12/1948',103),'nm0000168','USA'),
(2283,'Stanley Tucci','Stanley','Tucci','M',CONVERT(DATETIME,'11/11/1960',103),'nm0001804','USA'),
(2295,'Mickey Rourke','Mickey','Rourke','M',CONVERT(DATETIME,'16/09/1952',103),'nm0000620','USA'),
(2296,'Clive Owen','Clive','Owen','M',CONVERT(DATETIME,'03/10/1964',103),'nm0654110','England'),
(2299,'Josh Hartnett','Josh','Hartnett','M',CONVERT(DATETIME,'21/07/1978',103),'nm0001326','USA'),
(2368,'Elya Baskin','Elya','Baskin','F',CONVERT(DATETIME,'11/08/1950',103),'nm0059946','Latvia'),
(2387,'Patrick Stewart','Patrick','Stewart','M',CONVERT(DATETIME,'13/07/1940',103),'nm0001772','England'),
(2440,'Bill Nighy','Bill','Nighy','M',CONVERT(DATETIME,'12/12/1949',103),'nm0631490','England'),
(2482,'David O''Hara','David','O''Hara','M',CONVERT(DATETIME,'09/07/1965',103),'nm0641244','Scotland'),
(2505,'James Cromwell','James','Cromwell','M',CONVERT(DATETIME,'27/01/1940',103),'nm0000342','USA'),
(2535,'Vivica A. Fox','Vivica','A. Fox','F',CONVERT(DATETIME,'30/07/1964',103),'nm0000407','USA'),
(2536,'Michael Parks','Michael','Parks','M',CONVERT(DATETIME,'24/04/1940',103),'nm0662981','USA'),
(2954,'Jeffrey Wright','Jeffrey','Wright','M',CONVERT(DATETIME,'07/12/1965',103),'nm0942482','USA'),
(2975,'Laurence Fishburne','Laurence','Fishburne','M',CONVERT(DATETIME,'30/07/1961',103),'nm0000401','USA'),
(3051,'Toni Collette','Toni','Collette','F',CONVERT(DATETIME,'01/11/1972',103),'nm0001057','Australia'),
(3061,'Ewan McGregor','Ewan','McGregor','M',CONVERT(DATETIME,'31/03/1971',103),'nm0000191','Scotland'),
(3125,'Madonna','Madonna','Madonna','F',CONVERT(DATETIME,'16/08/1958',103),'nm0000187','USA'),
(3141,'Marisa Tomei','Marisa','Tomei','F',CONVERT(DATETIME,'04/12/1964',103),'nm0000673','USA'),
(3151,'Jack Lemmon','Jack','Lemmon','M',CONVERT(DATETIME,'08/02/1925',103),'nm0000493','USA'),
(3223,'Robert Downey Jr.','Robert','Downey Jr.','M',CONVERT(DATETIME,'04/04/1965',103),'nm0000375','USA'),
(3234,'Joan Cusack','Joan','Cusack','F',CONVERT(DATETIME,'11/10/1962',103),'nm0000349','USA'),
(3291,'Hugh Grant','Hugh','Grant','M',CONVERT(DATETIME,'09/09/1960',103),'nm0000424','England'),
(3293,'Rachel Weisz','Rachel','Weisz','F',CONVERT(DATETIME,'07/03/1970',103),'nm0001838','England'),
(3300,'Natalia Tena','Natalia','Tena','F',CONVERT(DATETIME,'01/11/1984',103),'nm1164730','England'),
(3636,'Paul Newman','Paul','Newman','M',CONVERT(DATETIME,'26/01/1925',103),'nm0000056','USA'),
(3796,'Michael Gough','Michael','Gough','M',CONVERT(DATETIME,'23/11/1916',103),'nm0001284','Malaya'),
(3798,'Pat Hingle','Pat','Hingle','M',CONVERT(DATETIME,'19/07/1924',103),'nm0385757','USA'),
(3801,'Tracey Walter','Tracey','Walter','M',CONVERT(DATETIME,'25/11/1947',103),'nm0910145','USA'),
(3894,'Christian Bale','Christian','Bale','M',CONVERT(DATETIME,'30/01/1974',103),'nm0000288','Wales'),
(3895,'Michael Caine','Michael','Caine','M',CONVERT(DATETIME,'14/03/1933',103),'nm0000323','England'),
(3896,'Liam Neeson','Liam','Neeson','M',CONVERT(DATETIME,'07/06/1952',103),'nm0000553','Ireland'),
(3899,'Ken Watanabe','Ken','Watanabe','M',CONVERT(DATETIME,'21/10/1959',103),'nm0913822','Japan'),
(3905,'William H. Macy','William','H. Macy','M',CONVERT(DATETIME,'13/03/1950',103),'nm0000513','USA'),
(3911,'John Carroll Lynch','John','Carroll Lynch','M',CONVERT(DATETIME,'01/08/1963',103),'nm0002253','USA'),
(3926,'Albert Finney','Albert','Finney','M',CONVERT(DATETIME,'09/05/1936',103),'nm0001215','England'),
(3967,'Kate Beckinsale','Kate','Beckinsale','F',CONVERT(DATETIME,'26/07/1973',103),'nm0000295','England'),
(4038,'Susan Sarandon','Susan','Sarandon','F',CONVERT(DATETIME,'04/10/1946',103),'nm0000215','USA'),
(4135,'Robert Redford','Robert','Redford','M',CONVERT(DATETIME,'18/08/1936',103),'nm0000602','USA'),
(4139,'Tom Skerritt','Tom','Skerritt','M',CONVERT(DATETIME,'25/08/1933',103),'nm0000643','USA'),
(4173,'Anthony Hopkins','Anthony','Hopkins','M',CONVERT(DATETIME,'31/12/1937',103),'nm0000164','Wales'),
(4175,'Jeffrey Tambor','Jeffrey','Tambor','M',CONVERT(DATETIME,'08/07/1944',103),'nm0001787','USA'),
(4430,'Sharon Stone','Sharon','Stone','F',CONVERT(DATETIME,'10/03/1958',103),'nm0000232','USA'),
(4432,'Frances Conroy','Frances','Conroy','F',CONVERT(DATETIME,'13/11/1953',103),'nm0175814','USA'),
(4483,'Dustin Hoffman','Dustin','Hoffman','M',CONVERT(DATETIME,'08/08/1937',103),'nm0000163','USA'),
(4492,'Philip Baker Hall','Philip','Baker Hall','M',CONVERT(DATETIME,'10/09/1931',103),'nm0001311','USA'),
(4495,'Steve Carell','Steve','Carell','M',CONVERT(DATETIME,'16/08/1962',103),'nm0136797','USA'),
(4566,'Alan Rickman','Alan','Rickman','M',CONVERT(DATETIME,'21/02/1946',103),'nm0000614','England'),
(4581,'Steve Coogan','Steve','Coogan','M',CONVERT(DATETIME,'14/10/1965',103),'nm0176869','England'),
(4587,'Halle Berry','Halle','Berry','F',CONVERT(DATETIME,'14/08/1966',103),'nm0000932','USA'),
(4589,'Benjamin Bratt','Benjamin','Bratt','M',CONVERT(DATETIME,'16/12/1963',103),'nm0000973','USA'),
(4690,'Christopher Walken','Christopher','Walken','M',CONVERT(DATETIME,'31/03/1943',103),'nm0000686','USA'),
(4724,'Kevin Bacon','Kevin','Bacon','M',CONVERT(DATETIME,'08/07/1958',103),'nm0000102','USA'),
(4756,'Matthew Broderick','Matthew','Broderick','M',CONVERT(DATETIME,'21/03/1962',103),'nm0000111','USA'),
(4764,'John C. Reilly','John','C. Reilly','M',CONVERT(DATETIME,'24/05/1965',103),'nm0000604','USA'),
(4935,'Pete Postlethwaite','Pete','Postlethwaite','M',CONVERT(DATETIME,'07/02/1945',103),'nm0000592','England'),
(4937,'Vince Vaughn','Vince','Vaughn','M',CONVERT(DATETIME,'28/03/1970',103),'nm0000681','USA'),
(5049,'John Hurt','John','Hurt','M',CONVERT(DATETIME,'22/01/1940',103),'nm0000457','England'),
(5064,'Meryl Streep','Meryl','Streep','F',CONVERT(DATETIME,'22/06/1949',103),'nm0000658','USA'),
(5081,'Emily Blunt','Emily','Blunt','F',CONVERT(DATETIME,'23/02/1983',103),'nm1289434','England'),
(5149,'Bonnie Hunt','Bonnie','Hunt','F',CONVERT(DATETIME,'22/09/1961',103),'nm0001372','USA'),
(5151,'Beth Grant','Beth','Grant','F',CONVERT(DATETIME,'18/09/1949',103),'nm0335275','USA'),
(5292,'Denzel Washington','Denzel','Washington','M',CONVERT(DATETIME,'28/12/1954',103),'nm0000243','USA'),
(5293,'Willem Dafoe','Willem','Dafoe','M',CONVERT(DATETIME,'22/07/1955',103),'nm0000353','USA'),
(5309,'Judi Dench','Judi','Dench','F',CONVERT(DATETIME,'09/12/1934',103),'nm0001132','England'),
(5469,'Ralph Fiennes','Ralph','Fiennes','M',CONVERT(DATETIME,'22/12/1962',103),'nm0000146','England'),
(5472,'Colin Firth','Colin','Firth','M',CONVERT(DATETIME,'10/09/1960',103),'nm0000147','England'),
(5502,'Bill Nunn','Bill','Nunn','M',CONVERT(DATETIME,'20/10/1953',103),'nm0638056','USA'),
(5538,'Ray Winstone','Ray','Winstone','M',CONVERT(DATETIME,'19/02/1957',103),'nm0935653','England'),
(5576,'Val Kilmer','Val','Kilmer','M',CONVERT(DATETIME,'31/12/1959',103),'nm0000174','USA'),
(5577,'Chris O''Donnell','Chris','O''Donnell','M',CONVERT(DATETIME,'26/06/1970',103),'nm0000563','USA'),
(5587,'Hank Azaria','Hank','Azaria','M',CONVERT(DATETIME,'25/04/1964',103),'nm0000279','USA'),
(5658,'Michael Gambon','Michael','Gambon','M',CONVERT(DATETIME,'19/10/1940',103),'nm0002091','Ireland'),
(5723,'John Leguizamo','John','Leguizamo','M',CONVERT(DATETIME,'22/07/1964',103),'nm0000491','Colombia'),
(6162,'Paul Bettany','Paul','Bettany','M',CONVERT(DATETIME,'27/05/1971',103),'nm0079273','England'),
(6193,'Leonardo DiCaprio','Leonardo','DiCaprio','M',CONVERT(DATETIME,'11/11/1974',103),'nm0000138','USA'),
(6199,'Miriam Margolyes','Miriam','Margolyes','F',CONVERT(DATETIME,'18/05/1941',103),'nm0546816','England'),
(6368,'Embeth Davidtz','Embeth','Davidtz','F',CONVERT(DATETIME,'11/08/1965',103),'nm0001110','USA'),
(6384,'Keanu Reeves','Keanu','Reeves','M',CONVERT(DATETIME,'02/09/1964',103),'nm0000206','Lebanon'),
(6573,'William Sadler','William','Sadler','M',CONVERT(DATETIME,'13/04/1950',103),'nm0006669','USA'),
(6576,'Mark Rolston','Mark','Rolston','M',CONVERT(DATETIME,'07/12/1956',103),'nm0001679','USA'),
(6752,'Zeljko Ivanek','Zeljko','Ivanek','M',CONVERT(DATETIME,'15/08/1957',103),'nm0411964','Slovenia'),
(6837,'Walter Matthau','Walter','Matthau','M',CONVERT(DATETIME,'01/10/1920',103),'nm0000527','USA'),
(6941,'Cameron Diaz','Cameron','Diaz','F',CONVERT(DATETIME,'30/08/1972',103),'nm0000139','USA'),
(6949,'John Malkovich','John','Malkovich','M',CONVERT(DATETIME,'09/12/1953',103),'nm0000518','USA'),
(6968,'Hugh Jackman','Hugh','Jackman','M',CONVERT(DATETIME,'12/10/1968',103),'nm0413168','Australia'),
(7026,'Rhys Ifans','Rhys','Ifans','M',CONVERT(DATETIME,'22/07/1967',103),'nm0406975','Wales'),
(7056,'Emma Thompson','Emma','Thompson','F',CONVERT(DATETIME,'15/04/1959',103),'nm0000668','England'),
(7060,'Martin Freeman','Martin','Freeman','M',CONVERT(DATETIME,'08/09/1971',103),'nm0293509','England'),
(7090,'Kelsey Grammer','Kelsey','Grammer','M',CONVERT(DATETIME,'21/02/1955',103),'nm0001288','Virgin Islands'),
(7166,'Kevin Pollak','Kevin','Pollak','M',CONVERT(DATETIME,'30/10/1957',103),'nm0001629','USA'),
(7167,'Don Rickles','Don','Rickles','M',CONVERT(DATETIME,'08/05/1926',103),'nm0725543','USA'),
(7219,'David Andrews','David','Andrews','M',CONVERT(DATETIME,'02/11/1952',103),'nm0028625','USA'),
(7399,'Ben Stiller','Ben','Stiller','M',CONVERT(DATETIME,'30/11/1965',103),'nm0001774','USA'),
(7447,'Alec Baldwin','Alec','Baldwin','M',CONVERT(DATETIME,'03/04/1958',103),'nm0000285','USA'),
(7624,'Stan Lee','Stan','Lee','M',CONVERT(DATETIME,'28/12/1922',103),'nm0498278','USA'),
(7672,'Reginald VelJohnson','Reginald','VelJohnson','M',CONVERT(DATETIME,'16/08/1952',103),'nm0001817','USA'),
(7676,'William Atherton','William','Atherton','M',CONVERT(DATETIME,'30/07/1947',103),'nm0040472','USA'),
(7795,'Buck Henry','Buck','Henry','M',CONVERT(DATETIME,'09/12/1930',103),'nm0377750','USA'),
(7882,'Jeff Pidgeon','Jeff','Pidgeon','M',CONVERT(DATETIME,'19/03/1965',103),'nm0682066','Unknown'),
(7904,'Billy Crystal','Billy','Crystal','M',CONVERT(DATETIME,'14/03/1948',103),'nm0000345','USA'),
(7906,'Jennifer Tilly','Jennifer','Tilly','F',CONVERT(DATETIME,'16/09/1958',103),'nm0000236','USA'),
(7907,'John Ratzenberger','John','Ratzenberger','M',CONVERT(DATETIME,'06/04/1947',103),'nm0001652','USA'),
(7908,'Frank Oz','Frank','Oz','M',CONVERT(DATETIME,'25/05/1944',103),'nm0000568','England'),
(7911,'Joe Ranft','Joe','Ranft','M',CONVERT(DATETIME,'13/03/1960',103),'nm0710020','Unknown'),
(8189,'Tracy Reiner','Tracy','Reiner','F',CONVERT(DATETIME,'07/07/1964',103),'nm0718021','Unknown'),
(8191,'Chris Ellis','Chris','Ellis','M',CONVERT(DATETIME,'14/04/1956',103),'nm0254760','USA'),
(8265,'John Michael Higgins','John','Michael Higgins','M',CONVERT(DATETIME,'12/02/1963',103),'nm0383422','USA'),
(8293,'Marion Cotillard','Marion','Cotillard','F',CONVERT(DATETIME,'30/09/1975',103),'nm0182839','France'),
(8349,'Martin Sheen','Martin','Sheen','M',CONVERT(DATETIME,'03/08/1940',103),'nm0000640','USA'),
(8447,'Jeff Daniels','Jeff','Daniels','M',CONVERT(DATETIME,'19/02/1955',103),'nm0001099','USA'),
(8534,'Kathy Bates','Kathy','Bates','F',CONVERT(DATETIME,'28/06/1948',103),'nm0000870','USA'),
(8655,'R. Lee Ermey','R.','Lee Ermey','M',CONVERT(DATETIME,'24/03/1944',103),'nm0000388','USA'),
(8691,'Zoe Saldana','Zoe','Saldana','F',CONVERT(DATETIME,'19/06/1978',103),'nm0757855','USA'),
(8784,'Daniel Craig','Daniel','Craig','M',CONVERT(DATETIME,'02/03/1968',103),'nm0185819','England'),
(8785,'Ciarán Hinds','Ciarán','Hinds','M',CONVERT(DATETIME,'09/02/1953',103),'nm0001354','Northern Ireland'),
(8872,'Rick Moranis','Rick','Moranis','M',CONVERT(DATETIME,'18/04/1953',103),'nm0001548','Canada'),
(8873,'Annie Potts','Annie','Potts','F',CONVERT(DATETIME,'28/10/1952',103),'nm0001633','USA'),
(8874,'Ernie Hudson','Ernie','Hudson','M',CONVERT(DATETIME,'17/12/1945',103),'nm0001368','USA'),
(8930,'John Cleese','John','Cleese','M',CONVERT(DATETIME,'27/10/1939',103),'nm0000092','England'),
(8944,'Jamie Lee Curtis','Jamie','Lee Curtis','F',CONVERT(DATETIME,'22/11/1958',103),'nm0000130','USA'),
(9048,'Clark Gregg','Clark','Gregg','M',CONVERT(DATETIME,'02/04/1962',103),'nm0163988','USA'),
(9137,'Renée Zellweger','Renée','Zellweger','F',CONVERT(DATETIME,'25/04/1969',103),'nm0000250','USA'),
(9138,'Gemma Jones','Gemma','Jones','F',CONVERT(DATETIME,'04/12/1942',103),'nm0428121','England'),
(9191,'Timothy Spall','Timothy','Spall','M',CONVERT(DATETIME,'27/02/1957',103),'nm0001758','England'),
(9208,'Robert Wagner','Robert','Wagner','M',CONVERT(DATETIME,'10/02/1930',103),'nm0001822','USA'),
(9273,'Amy Adams','Amy','Adams','F',CONVERT(DATETIME,'20/08/1974',103),'nm0010736','Italy'),
(9278,'Jennifer Garner','Jennifer','Garner','F',CONVERT(DATETIME,'17/04/1972',103),'nm0004950','USA'),
(9281,'Elizabeth Banks','Elizabeth','Banks','F',CONVERT(DATETIME,'10/02/1974',103),'nm0006969','USA'),
(9462,'Randall Duk Kim','Randall','Duk Kim','M',CONVERT(DATETIME,'24/09/1943',103),'nm0453641','Unknown'),
(9464,'Harry Lennix','Harry','Lennix','M',CONVERT(DATETIME,'16/11/1964',103),'nm0502015','USA'),
(9594,'Katharine Ross','Katharine','Ross','F',CONVERT(DATETIME,'29/01/1940',103),'nm0001684','USA'),
(9642,'Jude Law','Jude','Law','M',CONVERT(DATETIME,'29/12/1972',103),'nm0000179','England'),
(9777,'Cuba Gooding Jr.','Cuba','Gooding Jr.','M',CONVERT(DATETIME,'02/01/1968',103),'nm0000421','USA'),
(10017,'Charlton Heston','Charlton','Heston','M',CONVERT(DATETIME,'04/10/1923',103),'nm0000032','USA'),
(10127,'Jon Voight','Jon','Voight','M',CONVERT(DATETIME,'29/12/1938',103),'nm0000685','USA'),
(10132,'Colm Feore','Colm','Feore','M',CONVERT(DATETIME,'22/08/1958',103),'nm0272173','USA'),
(10205,'Sigourney Weaver','Sigourney','Weaver','F',CONVERT(DATETIME,'08/10/1949',103),'nm0000244','USA'),
(10297,'Matthew McConaughey','Matthew','McConaughey','M',CONVERT(DATETIME,'04/11/1969',103),'nm0000190','USA'),
(10655,'Leslie Phillips','Leslie','Phillips','M',CONVERT(DATETIME,'20/04/1924',103),'nm0680587','England'),
(10727,'John Hannah','John','Hannah','M',CONVERT(DATETIME,'23/04/1962',103),'nm0001314','Scotland'),
(10730,'Rowan Atkinson','Rowan','Atkinson','M',CONVERT(DATETIME,'06/01/1955',103),'nm0000100','England'),
(10743,'Ricky Jay','Ricky','Jay','M',CONVERT(DATETIME,'12/07/1948',103),'nm0419633','Unknown'),
(10859,'Ryan Reynolds','Ryan','Reynolds','M',CONVERT(DATETIME,'23/10/1976',103),'nm0005351','Canada'),
(10860,'Jessica Biel','Jessica','Biel','F',CONVERT(DATETIME,'03/03/1982',103),'nm0004754','USA'),
(10978,'Maggie Smith','Maggie','Smith','F',CONVERT(DATETIME,'28/12/1934',103),'nm0001749','England'),
(10980,'Daniel Radcliffe','Daniel','Radcliffe','M',CONVERT(DATETIME,'23/07/1989',103),'nm0705356','England'),
(10981,'Fiona Shaw','Fiona','Shaw','F',CONVERT(DATETIME,'10/07/1958',103),'nm0789716','Ireland'),
(10982,'Harry Melling','Harry','Melling','M',CONVERT(DATETIME,'13/03/1989',103),'nm0577982','England'),
(10983,'Richard Griffiths','Richard','Griffiths','M',CONVERT(DATETIME,'31/07/1947',103),'nm0341743','England'),
(10987,'Verne Troyer','Verne','Troyer','M',CONVERT(DATETIME,'01/01/1969',103),'nm0873942','USA'),
(10988,'Geraldine Somerville','Geraldine','Somerville','F',CONVERT(DATETIME,'19/05/1967',103),'nm0813893','Republic of Ireland'),
(10989,'Rupert Grint','Rupert','Grint','M',CONVERT(DATETIME,'24/08/1988',103),'nm0342488','England'),
(10990,'Emma Watson','Emma','Watson','F',CONVERT(DATETIME,'15/04/1990',103),'nm0914612','France'),
(10991,'Bonnie Wright','Bonnie','Wright','F',CONVERT(DATETIME,'17/02/1991',103),'nm0942247','England'),
(10992,'Chris Rankin','Chris','Rankin','M',CONVERT(DATETIME,'08/11/1983',103),'nm0710242','Unknown'),
(10993,'Tom Felton','Tom','Felton','M',CONVERT(DATETIME,'22/09/1987',103),'nm0271657','England'),
(11006,'James Marsden','James','Marsden','M',CONVERT(DATETIME,'18/09/1973',103),'nm0005188','USA'),
(11064,'David Strathairn','David','Strathairn','M',CONVERT(DATETIME,'26/01/1949',103),'nm0000657','USA'),
(11066,'Hal Holbrook','Hal','Holbrook','M',CONVERT(DATETIME,'17/02/1925',103),'nm0001358','USA'),
(11086,'Michael Ironside','Michael','Ironside','M',CONVERT(DATETIME,'12/02/1950',103),'nm0000461','Canada'),
(11108,'Simon Pegg','Simon','Pegg','M',CONVERT(DATETIME,'14/02/1970',103),'nm0670408','England'),
(11109,'Nick Frost','Nick','Frost','M',CONVERT(DATETIME,'28/03/1972',103),'nm0296545','England'),
(11179,'Sean Biggerstaff','Sean','Biggerstaff','M',CONVERT(DATETIME,'15/03/1983',103),'nm0081801','Scotland'),
(11180,'David Bradley','David','Bradley','M',CONVERT(DATETIME,'17/04/1942',103),'nm0103195','England'),
(11184,'Warwick Davis','Warwick','Davis','M',CONVERT(DATETIME,'03/02/1970',103),'nm0001116','England'),
(11207,'David Thewlis','David','Thewlis','M',CONVERT(DATETIME,'20/03/1963',103),'nm0000667','England'),
(11212,'Josh Herdman','Josh','Herdman','M',CONVERT(DATETIME,'09/09/1987',103),'nm0378830','Unknown'),
(11291,'Clémence Poésy','Clémence','Poésy','F',CONVERT(DATETIME,'30/11/1982',103),'nm0993242','France'),
(11355,'Jason Isaacs','Jason','Isaacs','M',CONVERT(DATETIME,'06/06/1963',103),'nm0005042','England'),
(11357,'Bruce Campbell','Bruce','Campbell','M',CONVERT(DATETIME,'22/06/1958',103),'nm0132257','USA'),
(11701,'Angelina Jolie','Angelina','Jolie','F',CONVERT(DATETIME,'04/06/1975',103),'nm0001401','USA'),
(11769,'Ted Raimi','Ted','Raimi','M',CONVERT(DATETIME,'14/12/1965',103),'nm0001646','USA'),
(11806,'Julia Sweeney','Julia','Sweeney','F',CONVERT(DATETIME,'10/10/1959',103),'nm0842140','USA'),
(11855,'Geraldine James','Geraldine','James','F',CONVERT(DATETIME,'06/07/1950',103),'nm0416524','England'),
(12041,'Julia Stiles','Julia','Stiles','F',CONVERT(DATETIME,'28/03/1981',103),'nm0005466','USA'),
(12052,'Gwyneth Paltrow','Gwyneth','Paltrow','F',CONVERT(DATETIME,'27/09/1972',103),'nm0000569','USA'),
(12073,'Mike Myers','Mike','Myers','M',CONVERT(DATETIME,'25/05/1963',103),'nm0000196','Canada'),
(12133,'Laurie Metcalf','Laurie','Metcalf','M',CONVERT(DATETIME,'16/06/1955',103),'nm0582418','USA'),
(12208,'Ozzy Osbourne','Ozzy','Osbourne','M',CONVERT(DATETIME,'03/12/1948',103),'nm0005285','England'),
(12371,'Richard Cetrone','Richard','Cetrone','M',CONVERT(DATETIME,'23/06/1978',103),'nm0149150','Unknown'),
(12898,'Tim Allen','Tim','Allen','M',CONVERT(DATETIME,'13/06/1953',103),'nm0000741','USA'),
(12900,'Wallace Shawn','Wallace','Shawn','M',CONVERT(DATETIME,'12/11/1943',103),'nm0001728','USA'),
(12901,'Erik von Detten','Erik','von Detten','M',CONVERT(DATETIME,'03/10/1982',103),'nm0902184','USA'),
(13014,'Toby Jones','Toby','Jones','M',CONVERT(DATETIME,'07/09/1967',103),'nm0429363','England'),
(13022,'Tom Berenger','Tom','Berenger','M',CONVERT(DATETIME,'31/05/1949',103),'nm0000297','USA'),
(13240,'Mark Wahlberg','Mark','Wahlberg','M',CONVERT(DATETIME,'05/06/1971',103),'nm0000242','USA'),
(13242,'Paul Giamatti','Paul','Giamatti','M',CONVERT(DATETIME,'06/06/1967',103),'nm0316079','USA'),
(13524,'Christopher Guest','Christopher','Guest','M',CONVERT(DATETIME,'05/02/1948',103),'nm0001302','USA'),
(13919,'Michael York','Michael','York','M',CONVERT(DATETIME,'27/03/1942',103),'nm0001868','England'),
(13920,'Mimi Rogers','Mimi','Rogers','F',CONVERT(DATETIME,'27/01/1956',103),'nm0000211','USA'),
(13922,'Seth Green','Seth','Green','M',CONVERT(DATETIME,'08/02/1974',103),'nm0001293','USA'),
(13924,'Mindy Sterling','Mindy','Sterling','M',CONVERT(DATETIME,'11/07/1953',103),'nm0827565','USA'),
(14064,'Norman Fell','Norman','Fell','M',CONVERT(DATETIME,'24/03/1924',103),'nm0001205','Unknown'),
(14329,'Dean Norris','Dean','Norris','M',CONVERT(DATETIME,'10/04/1963',103),'nm0606487','USA'),
(14343,'Rene Russo','Rene','Russo','F',CONVERT(DATETIME,'17/02/1954',103),'nm0000623','USA'),
(14407,'Matt LeBlanc','Matt','LeBlanc','M',CONVERT(DATETIME,'25/07/1967',103),'nm0001455','USA'),
(14833,'Harold Gould','Harold','Gould','M',CONVERT(DATETIME,'10/12/1923',103),'nm0332390','USA'),
(15277,'Jon Favreau','Jon','Favreau','M',CONVERT(DATETIME,'19/10/1966',103),'nm0269463','USA'),
(15286,'Christine Taylor','Christine','Taylor','F',CONVERT(DATETIME,'30/07/1971',103),'nm0852132','USA'),
(15318,'Keith Campbell','Keith','Campbell','M',CONVERT(DATETIME,'26/04/1962',103),'nm0132625','USA'),
(15440,'Jared Harris','Jared','Harris','M',CONVERT(DATETIME,'24/08/1961',103),'nm0364813','England'),
(15661,'Clint Howard','Clint','Howard','M',CONVERT(DATETIME,'20/04/1959',103),'nm0397212','USA'),
(15737,'Helen McCrory','Helen','McCrory','F',CONVERT(DATETIME,'17/08/1968',103),'nm0567031','England'),
(15758,'Queen Latifah','Queen','Latifah','F',CONVERT(DATETIME,'18/03/1970',103),'nm0001451','USA'),
(15831,'Frank Welker','Frank','Welker','M',CONVERT(DATETIME,'12/03/1946',103),'nm0919798','USA'),
(16119,'Charles Napier','Charles','Napier','M',CONVERT(DATETIME,'12/04/1936',103),'nm0621008','USA'),
(16165,'Jon Lovitz','Jon','Lovitz','M',CONVERT(DATETIME,'21/07/1957',103),'nm0001484','USA'),
(16828,'Chris Evans','Chris','Evans','M',CONVERT(DATETIME,'13/06/1981',103),'nm0262635','USA'),
(16935,'Geena Davis','Geena','Davis','F',CONVERT(DATETIME,'21/01/1956',103),'nm0000133','USA'),
(16940,'Jeremy Irons','Jeremy','Irons','M',CONVERT(DATETIME,'19/09/1948',103),'nm0000460','England'),
(17051,'James Franco','James','Franco','M',CONVERT(DATETIME,'19/04/1978',103),'nm0290556','USA'),
(17052,'Topher Grace','Topher','Grace','M',CONVERT(DATETIME,'12/07/1978',103),'nm0333410','USA'),
(17064,'Ben Whishaw','Ben','Whishaw','M',CONVERT(DATETIME,'14/10/1980',103),'nm0924210','England'),
(17140,'Abigail Breslin','Abigail','Breslin','F',CONVERT(DATETIME,'14/04/1996',103),'nm1113550','USA'),
(17287,'Dominic West','Dominic','West','M',CONVERT(DATETIME,'15/10/1969',103),'nm0922035','England'),
(17289,'Rodrigo Santoro','Rodrigo','Santoro','M',CONVERT(DATETIME,'22/08/1975',103),'nm0763928','Brazil'),
(17401,'Stephen Root','Stephen','Root','M',CONVERT(DATETIME,'17/11/1951',103),'nm0740535','USA'),
(17419,'Bryan Cranston','Bryan','Cranston','M',CONVERT(DATETIME,'07/03/1956',103),'nm0186505','USA'),
(17604,'Jeremy Renner','Jeremy','Renner','M',CONVERT(DATETIME,'07/01/1971',103),'nm0719637','USA'),
(17605,'Idris Elba','Idris','Elba','M',CONVERT(DATETIME,'06/09/1972',103),'nm0252961','England'),
(17832,'Carla Gugino','Carla','Gugino','F',CONVERT(DATETIME,'29/08/1971',103),'nm0001303','USA'),
(17835,'Ricky Gervais','Ricky','Gervais','M',CONVERT(DATETIME,'25/06/1961',103),'nm0315041','England'),
(18070,'Nicky Katt','Nicky','Katt','F',CONVERT(DATETIME,'11/05/1970',103),'nm0441588','USA'),
(18277,'Sandra Bullock','Sandra','Bullock','F',CONVERT(DATETIME,'26/07/1964',103),'nm0000113','USA'),
(18324,'Steve Zahn','Steve','Zahn','M',CONVERT(DATETIME,'13/11/1967',103),'nm0001872','USA'),
(18473,'James Badge Dale','James','Badge Dale','M',CONVERT(DATETIME,'01/05/1978',103),'nm0197647','USA'),
(18973,'Mila Kunis','Mila','Kunis','F',CONVERT(DATETIME,'14/08/1983',103),'nm0005109','Ukraine'),
(18998,'Rosemary Harris','Rosemary','Harris','F',CONVERT(DATETIME,'19/09/1927',103),'nm0365281','England'),
(18999,'J.K. Simmons','J.K.','Simmons','M',CONVERT(DATETIME,'09/01/1955',103),'nm0799777','USA'),
(19153,'Cliff Robertson','Cliff','Robertson','M',CONVERT(DATETIME,'09/09/1923',103),'nm0731772','USA'),
(19274,'Seth Rogen','Seth','Rogen','M',CONVERT(DATETIME,'15/04/1982',103),'nm0736622','Canada'),
(19278,'Bill Hader','Bill','Hader','M',CONVERT(DATETIME,'07/06/1978',103),'nm0352778','USA'),
(19292,'Adam Sandler','Adam','Sandler','M',CONVERT(DATETIME,'09/09/1966',103),'nm0001191','USA'),
(19326,'John Paxton','John','Paxton','M',CONVERT(DATETIME,'21/05/1911',103),'nm0668123','USA'),
(19545,'Jack Angel','Jack','Angel','M',CONVERT(DATETIME,'24/10/1930',103),'nm0029460','Unknown'),
(19923,'Hugh Bonneville','Hugh','Bonneville','M',CONVERT(DATETIME,'10/11/1963',103),'nm0095017','England'),
(20089,'Jena Malone','Jena','Malone','F',CONVERT(DATETIME,'21/11/1984',103),'nm0540441','USA'),
(20582,'Michael Papajohn','Michael','Papajohn','M',CONVERT(DATETIME,'07/11/1964',103),'nm0660244','USA'),
(20818,'Allen Covert','Allen','Covert','M',CONVERT(DATETIME,'13/10/1964',103),'nm0184445','USA'),
(20982,'Marton Csokas','Marton','Csokas','M',CONVERT(DATETIME,'30/06/1966',103),'nm0190744','New Zealand'),
(20999,'Mark Williams','Mark','Williams','M',CONVERT(DATETIME,'22/08/1959',103),'nm0931247','Unknown'),
(21007,'Jonah Hill','Jonah','Hill','M',CONVERT(DATETIME,'20/12/1983',103),'nm1706767','USA'),
(22226,'Paul Rudd','Paul','Rudd','M',CONVERT(DATETIME,'06/04/1969',103),'nm0748620','USA'),
(23532,'Jason Bateman','Jason','Bateman','M',CONVERT(DATETIME,'14/01/1969',103),'nm0000867','USA'),
(23659,'Will Ferrell','Will','Ferrell','M',CONVERT(DATETIME,'16/07/1967',103),'nm0002071','USA'),
(27105,'Ed Helms','Ed','Helms','M',CONVERT(DATETIME,'24/01/1974',103),'nm1159180','USA'),
(27578,'Ellen Page','Ellen','Page','F',CONVERT(DATETIME,'21/02/1987',103),'nm0680983','Canada'),
(27972,'Josh Hutcherson','Josh','Hutcherson','M',CONVERT(DATETIME,'12/10/1992',103),'nm1242688','USA'),
(28633,'Richard Jenkins','Richard','Jenkins','M',CONVERT(DATETIME,'04/05/1947',103),'nm0420955','USA'),
(28638,'David Koechner','David','Koechner','M',CONVERT(DATETIME,'24/08/1962',103),'nm0462712','USA'),
(28640,'Molly Shannon','Molly','Shannon','F',CONVERT(DATETIME,'16/09/1964',103),'nm0788340','USA'),
(28782,'Monica Bellucci','Monica','Bellucci','F',CONVERT(DATETIME,'30/09/1964',103),'nm0000899','Italy'),
(30614,'Ryan Gosling','Ryan','Gosling','M',CONVERT(DATETIME,'12/11/1980',103),'nm0331516','Canada'),
(36422,'Luke Wilson','Luke','Wilson','M',CONVERT(DATETIME,'21/09/1971',103),'nm0005561','USA'),
(37625,'Andrew Garfield','Andrew','Garfield','M',CONVERT(DATETIME,'20/08/1983',103),'nm1940449','USA'),
(37917,'Kristen Stewart','Kristen','Stewart','F',CONVERT(DATETIME,'09/04/1990',103),'nm0829576','USA'),
(38334,'Jennifer Coolidge','Jennifer','Coolidge','F',CONVERT(DATETIME,'28/08/1961',103),'nm0177639','USA'),
(39189,'Stephen Merchant','Stephen','Merchant','M',CONVERT(DATETIME,'24/11/1974',103),'nm0580351','England'),
(40481,'Luis Guzmán','Luis','Guzmán','M',CONVERT(DATETIME,'28/08/1956',103),'nm0350079','Puerto Rico'),
(41091,'Kristen Wiig','Kristen','Wiig','F',CONVERT(DATETIME,'22/08/1973',103),'nm1325419','USA'),
(42317,'Scott Lawrence','Scott','Lawrence','M',CONVERT(DATETIME,'27/09/1963',103),'nm0493013','USA'),
(43373,'Aaron Himelstein','Aaron','Himelstein','M',CONVERT(DATETIME,'10/10/1985',103),'nm0385391','USA'),
(43461,'Endre Hules','Endre','Hules','M',CONVERT(DATETIME,'17/03/1969',103),'nm0401352','Hungary'),
(43775,'Jane Lynch','Jane','Lynch','F',CONVERT(DATETIME,'14/07/1960',103),'nm0528331','USA'),
(44735,'Jesse Eisenberg','Jesse','Eisenberg','M',CONVERT(DATETIME,'05/10/1983',103),'nm0251986','USA'),
(47533,'Paula Malcomson','Paula','Malcomson','F',CONVERT(DATETIME,'23/04/1969',103),'nm0539155','Northern Ireland'),
(49265,'Lindsay Lohan','Lindsay','Lohan','F',CONVERT(DATETIME,'02/07/1986',103),'nm0517820','USA'),
(51072,'Kate Mara','Kate','Mara','F',CONVERT(DATETIME,'27/02/1983',103),'nm0544718','USA'),
(51329,'Bradley Cooper','Bradley','Cooper','M',CONVERT(DATETIME,'05/01/1975',103),'nm0177896','USA'),
(52603,'Alfonso Freeman','Alfonso','Freeman','M',CONVERT(DATETIME,'13/09/1959',103),'nm0293285','Unknown'),
(52699,'Danny Mann','Danny','Mann','M',CONVERT(DATETIME,'28/07/1951',103),'nm0542706','Unknown'),
(52852,'Kat Dennings','Kat','Dennings','F',CONVERT(DATETIME,'13/06/1986',103),'nm0993507','USA'),
(52865,'Garry Shandling','Garry','Shandling','M',CONVERT(DATETIME,'29/11/1949',103),'nm0788009','USA'),
(53256,'Terry Crews','Terry','Crews','M',CONVERT(DATETIME,'30/07/1968',103),'nm0187719','USA'),
(53650,'Anthony Mackie','Anthony','Mackie','M',CONVERT(DATETIME,'23/09/1979',103),'nm1107001','USA'),
(53714,'Rachel McAdams','Rachel','McAdams','F',CONVERT(DATETIME,'17/11/1978',103),'nm1046097','Canada'),
(53807,'Armie Hammer','Armie','Hammer','M',CONVERT(DATETIME,'28/08/1986',103),'nm2309517','USA'),
(54693,'Emma Stone','Emma','Stone','F',CONVERT(DATETIME,'06/11/1988',103),'nm1297015','USA'),
(55411,'David Gyasi','David','Gyasi','M',CONVERT(DATETIME,'02/01/1980',103),'nm1408543','Unknown'),
(55536,'Melissa McCarthy','Melissa','McCarthy','F',CONVERT(DATETIME,'26/08/1970',103),'nm0565250','USA'),
(55636,'Donald Sutherland','Donald','Sutherland','M',CONVERT(DATETIME,'17/07/1935',103),'nm0000661','Canada'),
(57755,'Woody Harrelson','Woody','Harrelson','M',CONVERT(DATETIME,'23/07/1961',103),'nm0000437','USA'),
(59841,'Matt Walsh','Matt','Walsh','M',CONVERT(DATETIME,'13/10/1964',103),'nm0909768','USA'),
(60348,'Dave Legeno','Dave','Legeno','M',CONVERT(DATETIME,'12/10/1963',103),'nm0499270','England'),
(60898,'Sebastian Stan','Sebastian','Stan','M',CONVERT(DATETIME,'13/08/1983',103),'nm1659221','Romania'),
(61182,'Gillian Vigman','Gillian','Vigman','F',CONVERT(DATETIME,'28/01/1972',103),'nm0897005','Unknown'),
(61969,'Phil Proctor','Phil','Proctor','M',CONVERT(DATETIME,'28/07/1940',103),'nm0698413','Unknown'),
(61981,'Michael Clarke Duncan','Michael','Clarke Duncan','M',CONVERT(DATETIME,'10/12/1957',103),'nm0003817','USA'),
(62861,'Andy Samberg','Andy','Samberg','M',CONVERT(DATETIME,'18/08/1978',103),'nm1676221','USA'),
(65827,'Keith David','Keith','David','M',CONVERT(DATETIME,'04/06/1956',103),'nm0202966','USA'),
(66743,'Matt Bomer','Matt','Bomer','M',CONVERT(DATETIME,'11/11/1977',103),'nm0093589','USA'),
(67773,'Steve Martin','Steve','Martin','M',CONVERT(DATETIME,'14/08/1945',103),'nm0000188','USA'),
(69122,'Heather Graham','Heather','Graham','F',CONVERT(DATETIME,'29/01/1970',103),'nm0001287','USA'),
(69597,'Drew Barrymore','Drew','Barrymore','F',CONVERT(DATETIME,'22/02/1975',103),'nm0000106','USA'),
(70851,'Jack Black','Jack','Black','M',CONVERT(DATETIME,'28/08/1969',103),'nm0085312','USA'),
(71070,'Amanda Seyfried','Amanda','Seyfried','F',CONVERT(DATETIME,'03/12/1985',103),'nm1086543','USA'),
(71580,'Benedict Cumberbatch','Benedict','Cumberbatch','M',CONVERT(DATETIME,'19/07/1976',103),'nm1212722','England'),
(72129,'Jennifer Lawrence','Jennifer','Lawrence','F',CONVERT(DATETIME,'15/08/1990',103),'nm2225369','USA'),
(73968,'Henry Cavill','Henry','Cavill','M',CONVERT(DATETIME,'05/05/1983',103),'nm0147147','England'),
(74568,'Chris Hemsworth','Chris','Hemsworth','M',CONVERT(DATETIME,'11/08/1983',103),'nm1165110','Australia'),
(77069,'Lenny Kravitz','Lenny','Kravitz','M',CONVERT(DATETIME,'26/05/1964',103),'nm0005107','Unknown'),
(79079,'Jamie McShane','Jamie','McShane','M',CONVERT(DATETIME,'21/04/1965',103),'nm0574535','Unknown'),
(84213,'Bill Farmer','Bill','Farmer','M',CONVERT(DATETIME,'14/11/1952',103),'nm0267724','USA'),
(84223,'Anna Kendrick','Anna','Kendrick','F',CONVERT(DATETIME,'09/08/1985',103),'nm0447695','USA'),
(84493,'Mickie McGowan','Mickie','McGowan','M',CONVERT(DATETIME,'02/01/1938',103),'nm0569680','Unknown'),
(91606,'Tom Hiddleston','Tom','Hiddleston','M',CONVERT(DATETIME,'09/02/1981',103),'nm1089991','England'),
(95469,'Shannon Wilcox','Shannon','Wilcox','F',CONVERT(DATETIME,'18/03/1954',103),'nm0928279','Unknown'),
(96066,'Liam Hemsworth','Liam','Hemsworth','M',CONVERT(DATETIME,'13/01/1990',103),'nm2955013','Australia'),
(96841,'Matthew Lewis','Matthew','Lewis','M',CONVERT(DATETIME,'27/06/1989',103),'nm0507535','England'),
(96851,'James Phelps','James','Phelps','M',CONVERT(DATETIME,'25/02/1986',103),'nm0962359','Unknown'),
(119592,'Aubrey Plaza','Aubrey','Plaza','F',CONVERT(DATETIME,'26/06/1984',103),'nm2201555','USA'),
(121953,'Stephanie Szostak','Stephanie','Szostak','F',CONVERT(DATETIME,'12/06/1975',103),'nm1210895','Unknown'),
(125025,'Joey King','Joey','King','F',CONVERT(DATETIME,'30/07/1999',103),'nm1428821','USA'),
(127048,'Nate Corddry','Nate','Corddry','M',CONVERT(DATETIME,'08/09/1977',103),'nm1682319','USA'),
(139549,'Rory Kinnear','Rory','Kinnear','M',CONVERT(DATETIME,'17/02/1978',103),'nm1239499','England'),
(140367,'Evanna Lynch','Evanna','Lynch','F',CONVERT(DATETIME,'16/08/1991',103),'nm2121541','Ireland'),
(140368,'Oliver Phelps','Oliver','Phelps','M',CONVERT(DATETIME,'25/02/1986',103),'nm0962360','Unknown'),
(156739,'Bernard White','Bernard','White','M',CONVERT(DATETIME,'08/06/1959',103),'nm0924502','Sri Lanka'),
(157626,'Jan Rabson','Jan','Rabson','F',CONVERT(DATETIME,'14/06/1954',103),'nm0705014','Unknown'),
(162924,'Rob Moran','Rob','Moran','M',CONVERT(DATETIME,'12/08/1963',103),'nm0602813','Unknown'),
(173451,'Jed Brophy','Jed','Brophy','M',CONVERT(DATETIME,'04/12/1963',103),'nm0112400','Unknown'),
(212604,'Adam DeVine','Adam','DeVine','M',CONVERT(DATETIME,'07/11/1983',103),'nm2796745','Unknown'),
(214701,'Sherry Lynn','Sherry','Lynn','F',CONVERT(DATETIME,'20/05/1952',103),'nm0528802','Unknown'),
(234921,'Arben Bajraktaraj','Arben','Bajraktaraj','M',CONVERT(DATETIME,'29/01/1983',103),'nm0048076','Unknown'),
(234922,'Devon Murray','Devon','Murray','M',CONVERT(DATETIME,'28/10/1988',103),'nm0614912','Unknown'),
(234923,'Alfie Enoch','Alfie','Enoch','M',CONVERT(DATETIME,'02/12/1988',103),'nm0257917','Unknown'),
(234924,'Jessie Cave','Jessie','Cave','F',CONVERT(DATETIME,'05/05/1987',103),'nm2728165','Unknown'),
(234925,'Shefali Chowdhury','Shefali','Chowdhury','F',CONVERT(DATETIME,'20/06/1988',103),'nm1715231','Wales'),
(234926,'Afshan Azad','Afshan','Azad','F',CONVERT(DATETIME,'12/02/1988',103),'nm1715136','England'),
(234928,'Scarlett Byrne','Scarlett','Byrne','F',CONVERT(DATETIME,'06/10/1990',103),'nm2906885','England'),
(234929,'Anna Shaffer','Anna','Shaffer','F',CONVERT(DATETIME,'15/03/1992',103),'nm2872264','Unknown'),
(234933,'Katie Leung','Katie','Leung','F',CONVERT(DATETIME,'08/08/1987',103),'nm1648520','Scotland'),
(234934,'Freddie Stroma','Freddie','Stroma','M',CONVERT(DATETIME,'08/01/1987',103),'nm2238815','England'),
(237455,'Sam Claflin','Sam','Claflin','M',CONVERT(DATETIME,'27/06/1986',103),'nm3510471','England'),
(530025,'Willow Shields','Willow','Shields','F',CONVERT(DATETIME,'01/06/2000',103),'nm3094377','USA'),
(565498,'Laura Cayouette','Laura','Cayouette','F',CONVERT(DATETIME,'11/07/1964',103),'nm0147312','USA'),
(568374,'William Melling','William','Melling','M',CONVERT(DATETIME,'30/11/1994',103),'nm1701576','Unknown'),
(956224,'Jamie Waylett','Jamie','Waylett','M',CONVERT(DATETIME,'21/07/1989',103),'nm0915488','England'),
(956719,'Tim DeZarn','Tim','DeZarn','M',CONVERT(DATETIME,'11/07/1952',103),'nm0212498','USA'),
(990136,'Judd Lormand','Judd','Lormand','M',CONVERT(DATETIME,'15/09/1973',103),'nm1885015','Unknown'),
(1018947,'Maximiliano Hernández','Maximiliano','Hernández','M',CONVERT(DATETIME,'04/04/1973',103),'nm0380073','USA'),
(1116442,'John Morris','John','Morris','M',CONVERT(DATETIME,'02/10/1984',103),'nm0606658','Unknown'),
(1182929,'Freema Agyeman','Freema','Agyeman','F',CONVERT(DATETIME,'20/03/1979',103),'nm1303956','England'),
(1278367,'Calvin Dean','Calvin','Dean','M',CONVERT(DATETIME,'04/11/1964',103),'nm1669911','Unknown'),
(1360008,'Joseph Oliveira','Joseph','Oliveira','M',CONVERT(DATETIME,'14/08/1959',103),'nm5857646','Unknown'),
(1429470,'Nick W. Nicholson','Nick','W. Nicholson','M',CONVERT(DATETIME,'07/06/1962',103),'nm4414026','Unknown'),
(1574936,'Mark Falvo','Mark','Falvo','M',CONVERT(DATETIME,'03/01/1976',103),'nm5241466','Unknown');





INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1,17832,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2,956224,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (3,5576,744);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (4,10990,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (5,3967,77866);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (6,18324,10688);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (7,1230,91314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (8,5502,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (9,70851,10710);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (10,119592,316023);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (11,1897,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (12,7882,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (13,4690,9522);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (14,85,118);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (15,1923,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (16,72129,261860);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (17,11066,10648);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (18,589,78);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (19,388,4638);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (20,2440,4638);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (21,3967,64635);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (22,10978,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (23,887,9384);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (24,529,2759);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (25,62861,76492);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (26,11207,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (27,3223,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (28,707,620);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (29,2231,1726);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (30,2975,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (31,17287,58233);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (32,3905,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (33,112,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (34,335,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (35,529,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (36,17287,1574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (37,477,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (38,537,11199);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (39,7219,550);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (40,11184,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (41,8265,114150);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (42,74568,58595);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (43,3300,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (44,884,275);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (45,6837,11356);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (46,2157,788);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (47,19923,509);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (48,8534,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (49,8655,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (50,7624,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (51,17605,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (52,5293,421);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (53,6576,91314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (54,880,489);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (55,52699,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (56,2176,5503);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (57,72129,82693);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (58,71070,10625);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (59,19326,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (60,4135,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (61,121953,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (62,18473,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (63,7219,72190);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (64,7907,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (65,532,603);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (66,9281,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (67,10727,712);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (68,84493,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (69,85,57201);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (70,12898,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (71,1245,9676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (72,1329,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (73,5081,350);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (74,3061,8952);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (75,62861,80035);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (76,140368,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (77,84493,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (78,13240,72105);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (79,4566,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (80,192,403);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (81,140,9502);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (82,12898,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (83,14833,10137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (84,1665,58595);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (85,139,24);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (86,147,24);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (87,11184,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (88,9281,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (89,13242,9928);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (90,3291,712);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (91,127048,136795);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (92,1233,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (93,9191,10549);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (94,96841,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (95,287,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (96,378,22);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (97,10727,564);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (98,1640,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (99,70851,243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (100,2227,824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (101,6368,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (102,1360008,157336);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (103,61981,1635);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (104,12073,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (105,10978,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (106,112,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (107,1896,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (108,13022,2034);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (109,19278,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (110,1461,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (111,11769,68728);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (112,1640,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (113,11108,747);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (114,7056,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (115,62861,50544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (116,55636,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (117,1903,68734);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (118,1429470,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (119,1283,118);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (120,1372,54138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (121,3293,564);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (122,16119,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (123,1813,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (124,1278367,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (125,827,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (126,5293,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (127,1813,43347);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (128,10205,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (129,60898,44214);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (130,1771,72105);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (131,13920,2157);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (132,70851,9798);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (133,10743,714);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (134,9642,58574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (135,228,49047);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (136,131,142);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (137,4690,10710);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (138,74568,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (139,18999,83686);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (140,55536,136795);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (141,17832,49521);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (142,1898,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (143,70851,1584);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (144,1327,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (145,514,7350);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (146,53256,27578);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (147,1360008,155);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (148,40481,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (149,10993,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (150,227,31052);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (151,121953,74465);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (152,8784,37724);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (153,53714,10625);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (154,11355,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (155,3895,9722);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (156,2192,605);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (157,3894,168672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (158,2368,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (159,2227,9836);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (160,3061,1895);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (161,11180,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (162,234923,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (163,234934,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (164,12052,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (165,1813,142);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (166,9048,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (167,6968,127585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (168,530,605);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (169,131,242582);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (170,7908,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (171,1954,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (172,1371,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (173,2283,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (174,3061,824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (175,114,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (176,2299,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (177,2231,393);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (178,827,651);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (179,3291,634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (180,5151,1637);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (181,119592,22538);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (182,10990,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (183,2176,1771);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (184,60348,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (185,2283,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (186,7399,9472);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (187,10982,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (188,6752,68734);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (189,6941,544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (190,8785,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (191,1331,604);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (192,15277,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (193,12900,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (194,2231,1572);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (195,3894,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (196,84493,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (197,2295,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (198,3905,9824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (199,1532,4327);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (200,20999,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (201,1932,164);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (202,11806,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (203,5658,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (204,15318,1930);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (205,37917,8966);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (206,12371,22970);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (207,11006,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (208,49265,10625);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (209,11855,58574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (210,23659,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (211,4432,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (212,534,77);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (213,13524,10776);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (214,11109,747);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (215,1532,152760);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (216,77069,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (217,19278,7446);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (218,193,37233);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (219,5151,773);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (220,1018947,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (221,110,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (222,16828,22538);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (223,1245,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (224,19292,11003);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (225,11355,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (226,3801,274);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (227,27105,2698);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (228,205,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (229,1278367,74643);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (230,52852,6957);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (231,11291,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (232,1233,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (233,85,22);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (234,5587,114);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (235,1331,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (236,4587,36657);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (237,1210,62838);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (238,74568,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (239,2387,36657);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (240,19292,76492);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (241,504,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (242,5538,58595);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (243,865,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (244,5472,634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (245,42317,54138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (246,36422,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (247,1365,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (248,19326,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (249,23659,817);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (250,234929,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (251,10655,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (252,655,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (253,17140,773);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (254,517,788);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (255,2039,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (256,10990,86834);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (257,11291,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (258,5049,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (259,18070,155);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (260,9048,629);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (261,6573,278);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (262,6752,83686);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (263,4173,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (264,6162,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (265,6384,603);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (266,139549,44147);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (267,52699,9836);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (268,1100,76163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (269,139,9899);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (270,10991,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (271,67773,12096);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (272,10983,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (273,3895,1493);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (274,1892,324668);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (275,658,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (276,234922,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (277,388,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (278,514,268);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (279,4173,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (280,1893,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (281,17419,773);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (282,14833,9277);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (283,6199,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (284,3895,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (285,5469,206647);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (286,4175,18785);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (287,79079,242582);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (288,7911,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (289,14064,299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (290,19278,54138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (291,10017,869);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (292,11109,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (293,157626,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (294,37917,16614);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (295,17832,1593);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (296,20089,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (297,140,393);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (298,4764,1574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (299,11006,36657);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (300,2227,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (301,147,10537);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (302,13922,9798);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (303,10297,157336);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (304,10860,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (305,1210,114);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (306,156739,604);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (307,1333,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (308,934,49521);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (309,1900,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (310,6752,49040);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (311,28633,7552);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (312,27105,18785);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (313,3223,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (314,16165,11287);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (315,14833,10330);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (316,5538,86834);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (317,9281,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (318,11701,9502);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (319,1903,162);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (320,10991,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (321,8655,807);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (322,2192,604);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (323,7624,293660);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (324,2975,605);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (325,1116442,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (326,10205,620);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (327,9191,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (328,47533,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (329,4495,6957);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (330,3911,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (331,1461,152760);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (332,2227,9722);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (333,10988,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (334,72129,127585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (335,28640,2698);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (336,5292,9481);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (337,18998,10549);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (338,71070,82695);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (339,1204,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (340,7090,127585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (341,3896,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (342,448,9676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (343,74568,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (344,2207,12157);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (345,11855,65754);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (346,15286,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (347,227,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (348,1204,509);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (349,1371,824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (350,1892,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (351,388,824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (352,11180,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (353,4935,629);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (354,15440,58574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (355,4492,9798);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (356,73968,49521);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (357,5469,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (358,234934,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (359,13922,9654);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (360,192,278);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (361,72129,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (362,11180,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (363,11184,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (364,1121,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (365,9281,114150);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (366,96066,76163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (367,60898,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (368,5064,350);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (369,880,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (370,84223,22538);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (371,10990,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (372,15440,2157);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (373,5577,414);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (374,21007,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (375,10859,293660);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (376,4492,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (377,140368,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (378,517,36669);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (379,3293,245);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (380,2231,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (381,1896,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (382,887,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (383,3894,534);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (384,234926,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (385,529,77);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (386,84223,316023);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (387,17051,68728);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (388,7676,1573);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (389,10989,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (390,2231,68718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (391,10992,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (392,1813,82695);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (393,1640,11631);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (394,8189,562);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (395,3141,11199);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (396,207,57201);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (397,477,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (398,13014,1771);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (399,10132,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (400,4566,562);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (401,7882,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (402,16935,1541);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (403,2535,393);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (404,19278,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (405,7624,1726);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (406,10978,6037);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (407,51072,286217);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (408,1245,1635);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (409,13922,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (410,11769,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (411,62,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (412,23659,9899);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (413,7911,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (414,119592,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (415,7907,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (416,4135,9277);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (417,15831,91314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (418,12371,23629);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (419,5502,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (420,2440,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (421,17835,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (422,1954,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (423,53714,58574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (424,11180,4638);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (425,2387,45772);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (426,1461,10316);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (427,10982,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (428,15831,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (429,69597,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (430,65827,544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (431,5576,10537);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (432,11108,4638);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (433,55411,83542);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (434,1369,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (435,6199,10776);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (436,162924,54138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (437,1331,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (438,532,77);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (439,3911,11520);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (440,69597,11003);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (441,20999,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (442,880,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (443,1896,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (444,73968,203801);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (445,1542,10330);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (446,6968,9836);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (447,8655,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (448,7624,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (449,9191,11774);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (450,6199,9836);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (451,8872,620);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (452,9462,9502);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (453,12208,824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (454,17051,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (455,69597,1824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (456,234922,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (457,28782,206647);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (458,1834,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (459,1922,1574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (460,48,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (461,534,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (462,18973,68728);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (463,139,680);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (464,530,604);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (465,53807,37799);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (466,3905,275);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (467,51072,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (468,61182,45243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (469,206,8467);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (470,62,1572);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (471,10990,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (472,8265,7552);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (473,4135,642);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (474,6837,4808);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (475,234933,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (476,7447,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (477,1331,1858);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (478,206,8952);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (479,3926,37724);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (480,51329,18785);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (481,28633,4944);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (482,53807,57201);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (483,53650,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (484,7624,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (485,7166,11520);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (486,52865,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (487,17604,56292);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (488,8872,10776);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (489,1018947,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (490,17401,9472);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (491,3801,268);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (492,8447,8467);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (493,139549,37724);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (494,7167,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (495,193,475);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (496,19278,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (497,956719,22970);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (498,19153,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (499,9048,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (500,380,168672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (501,36422,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (502,51329,45243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (503,9464,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (504,1954,597);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (505,10987,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (506,589,11520);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (507,64,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (508,7167,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (509,7399,1593);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (510,62,76163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (511,8655,80035);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (512,234926,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (513,1269,287);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (514,1231,5503);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (515,52699,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (516,20982,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (517,61969,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (518,5723,824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (519,10132,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (520,3967,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (521,7624,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (522,1897,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (523,3895,10141);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (524,1892,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (525,504,243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (526,12133,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (527,10989,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (528,7090,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (529,9208,818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (530,565498,68718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (531,16165,9899);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (532,55536,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (533,44735,16614);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (534,1271,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (535,4937,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (536,1369,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (537,8655,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (538,7672,620);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (539,4566,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (540,140367,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (541,57755,50544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (542,884,2022);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (543,18999,4944);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (544,10987,818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (545,535,77);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (546,13014,58595);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (547,19326,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (548,707,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (549,19292,2022);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (550,61981,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (551,5469,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (552,2283,7980);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (553,10993,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (554,17835,355008);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (555,1327,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (556,10980,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (557,504,744);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (558,28633,22970);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (559,3151,11356);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (560,51329,9522);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (561,31,83542);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (562,234923,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (563,60898,286217);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (564,20818,1824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (565,10127,1858);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (566,4038,7980);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (567,11086,534);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (568,16828,1771);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (569,64,155);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (570,7904,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (571,140367,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (572,19545,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (573,1330,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (574,13919,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (575,1245,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (576,7672,1573);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (577,62,1573);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (578,9464,49521);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (579,10987,817);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (580,14407,4327);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (581,60348,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (582,5658,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (583,1925,324668);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (584,2231,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (585,7672,562);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (586,1271,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (587,4756,271718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (588,7624,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (589,4139,744);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (590,4937,9384);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (591,1269,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (592,4139,651);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (593,1643,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (594,43373,818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (595,2975,604);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (596,13014,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (597,9642,10528);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (598,8930,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (599,14407,2157);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (600,11066,790);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (601,96841,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (602,1897,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (603,65,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (604,9281,6957);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (605,15440,203801);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (606,53256,11665);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (607,234924,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (608,1771,153);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (609,12898,11199);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (610,5469,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (611,4495,9722);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (612,13240,7980);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (613,2283,91314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (614,10860,34544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (615,2157,489);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (616,6162,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (617,1329,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (618,67773,11584);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (619,23659,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (620,96851,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (621,44735,19908);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (622,5587,9472);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (623,1813,241259);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (624,10988,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (625,10980,271718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (626,378,714);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (627,568374,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (628,3051,226486);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (629,60898,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (630,13919,818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (631,9642,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (632,4587,62838);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (633,11855,10528);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (634,61981,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (635,1372,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (636,8784,65754);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (637,1665,58574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (638,1327,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (639,7166,881);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (640,1896,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (641,16828,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (642,7447,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (643,976,9654);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (644,4483,11774);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (645,4175,45243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (646,52852,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (647,1643,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (648,112,421);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (649,207,56292);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (650,10860,62838);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (651,9642,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (652,11212,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (653,3967,9778);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (654,534,807);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (655,388,634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (656,884,680);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (657,3051,773);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (658,18070,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (659,13920,10537);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (660,5293,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (661,2219,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (662,865,1858);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (663,2954,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (664,2176,607);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (665,20582,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (666,11179,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (667,18277,1637);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (668,1371,7131);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (669,61969,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (670,8349,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (671,5469,424);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (672,12900,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (673,4175,544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (674,60898,1771);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (675,1116442,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (676,3061,9928);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (677,234926,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (678,2227,414);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (679,10989,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (680,9273,49521);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (681,17051,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (682,8349,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (683,11291,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (684,47533,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (685,3896,424);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (686,1210,9880);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (687,15277,1726);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (688,887,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (689,1429470,1726);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (690,7,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (691,13242,10316);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (692,12052,818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (693,707,1621);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (694,10,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (695,67773,10776);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (696,8691,19995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (697,8873,620);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (698,1204,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (699,20089,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (700,20582,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (701,976,12096);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (702,8874,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (703,51329,168672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (704,537,1541);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (705,12208,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (706,10981,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (707,5538,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (708,11109,58595);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (709,10127,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (710,214701,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (711,2141,68718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (712,23532,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (713,1294,118);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (714,234934,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (715,477,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (716,1643,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (717,8349,1930);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (718,10743,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (719,23532,9384);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (720,140368,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (721,2299,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (722,37625,1930);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (723,206,7552);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (724,568374,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (725,62,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (726,2387,72105);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (727,84223,114150);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (728,17140,62838);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (729,12371,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (730,7,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (731,7447,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (732,3051,245);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (733,4937,80035);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (734,234933,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (735,1283,550);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (736,28640,76492);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (737,9137,634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (738,17419,64635);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (739,2535,24);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (740,234925,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (741,62,562);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (742,8691,54138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (743,5292,8963);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (744,1813,350);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (745,3223,7446);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (746,1331,605);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (747,2536,68718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (748,192,7350);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (749,3300,245);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (750,5149,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (751,35,1930);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (752,21007,80035);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (753,10730,712);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (754,1230,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (755,9777,881);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (756,17604,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (757,19,226486);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (758,4175,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (759,7056,508);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (760,12052,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (761,13922,817);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (762,6368,634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (763,707,1824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (764,10297,152532);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (765,9208,817);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (766,2536,68734);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (767,17287,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (768,5658,421);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (769,1230,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (770,658,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (771,10991,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (772,1532,137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (773,9048,1726);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (774,17605,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (775,10989,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (776,1892,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (777,12073,817);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (778,55636,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (779,36422,4327);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (780,16165,11003);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (781,17289,8952);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (782,55536,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (783,6941,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (784,6193,597);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (785,1920,2022);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (786,96841,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (787,10132,1574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (788,96066,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (789,13242,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (790,4764,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (791,51072,142);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (792,287,807);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (793,2505,6037);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (794,1461,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (795,5064,11774);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (796,5049,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (797,113,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (798,17140,4599);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (799,1923,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (800,20089,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (801,237455,58595);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (802,10980,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (803,7624,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (804,13919,817);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (805,95469,9880);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (806,49265,10330);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (807,17140,19908);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (808,1283,57201);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (809,11184,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (810,3899,91314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (811,8,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (812,2440,64635);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (813,234921,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (814,18473,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (815,13524,881);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (816,55536,4327);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (817,62,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (818,335,137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (819,7219,568);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (820,10988,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (821,1892,286217);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (822,7399,7446);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (823,43461,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (824,3905,11199);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (825,5081,45772);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (826,1064,4327);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (827,193,9798);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (828,60348,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (829,10730,9486);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (830,18277,49047);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (831,1920,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (832,10978,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (833,65827,83542);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (834,537,137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (835,565498,9798);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (836,23659,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (837,5658,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (838,287,1541);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (839,1330,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (840,15661,568);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (841,934,290250);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (842,23659,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (843,9462,604);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (844,2039,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (845,3234,243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (846,7907,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (847,4495,2698);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (848,1204,114);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (849,1245,153);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (850,65,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (851,500,881);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (852,11212,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (853,37625,37799);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (854,884,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (855,16828,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (856,207,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (857,96841,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (858,3911,50646);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (859,234924,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (860,1834,634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (861,11180,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (862,11064,37233);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (863,3293,49040);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (864,16828,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (865,2037,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (866,48,286217);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (867,1896,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (868,18998,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (869,19545,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (870,1900,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (871,1116442,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (872,4566,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (873,2440,747);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (874,64,2157);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (875,7907,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (876,827,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (877,234925,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (878,3899,27205);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (879,77069,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (880,5502,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (881,18998,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (882,1283,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (883,6162,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (884,71580,54138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (885,1233,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (886,27972,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (887,234933,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (888,1329,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (889,5658,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (890,162924,8467);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (891,20089,141);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (892,378,8818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (893,1100,27578);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (894,2296,2501);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (895,12900,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (896,524,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (897,1372,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (898,8293,27205);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (899,1461,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (900,55536,226486);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (901,8874,620);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (902,655,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (903,4566,241259);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (904,11066,37233);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (905,585,78);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (906,4587,127585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (907,4937,9472);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (908,12901,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (909,41091,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (910,11701,9481);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (911,43775,6957);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (912,65827,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (913,125025,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (914,7090,91314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (915,6384,604);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (916,28638,6957);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (917,3895,27205);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (918,64,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (919,4430,314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (920,17604,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (921,1532,10688);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (922,57755,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (923,14343,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (924,9281,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (925,1903,773);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (926,234924,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (927,10017,10549);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (928,53650,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (929,96851,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (930,2482,77866);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (931,2157,10549);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (932,109,9836);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (933,10730,58233);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (934,61981,869);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (935,31,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (936,10983,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (937,18473,72190);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (938,79079,68734);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (939,2440,44147);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (940,23532,7326);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (941,8447,286217);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (942,526,27205);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (943,173451,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (944,193,8963);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (945,10859,16614);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (946,4173,274);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (947,1574936,745);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (948,1925,44214);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (949,16119,11300);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (950,12371,49521);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (951,1230,2698);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (952,10991,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (953,11064,49040);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (954,19923,152760);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (955,1231,50646);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (956,139,393);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (957,3223,58574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (958,4937,9522);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (959,214701,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (960,10981,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (961,13240,91314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (962,12052,1726);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (963,8944,1621);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (964,585,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (965,19545,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (966,52852,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (967,18070,1584);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (968,287,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (969,11180,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (970,16940,83686);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (971,1892,2501);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (972,11806,680);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (973,85,62213);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (974,84223,8966);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (975,1269,12560);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (976,388,83542);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (977,14329,37233);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (978,70851,254);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (979,287,550);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (980,1233,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (981,7060,747);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (982,43373,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (983,2037,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (984,114,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (985,1371,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (986,7,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (987,10127,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (988,65827,787);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (989,7026,1930);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (990,504,287);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (991,39189,4638);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (992,5472,508);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (993,1892,152760);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (994,11355,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (995,13240,9654);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (996,18998,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (997,1903,11665);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (998,530,77);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (999,10127,9798);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1000,1532,153);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1001,13240,77866);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1002,5469,37724);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1003,568374,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1004,658,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1005,1532,421);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1006,3141,50646);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1007,10980,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1008,173451,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1009,27578,27205);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1010,16935,10137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1011,454,286217);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1012,524,44214);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1013,4566,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1014,10993,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1015,8873,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1016,157626,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1017,16940,1572);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1018,52865,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1019,589,11584);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1020,1920,162);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1021,7624,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1022,77069,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1023,819,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1024,9281,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1025,234921,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1026,5292,2034);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1027,11064,11287);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1028,1283,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1029,6368,65754);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1030,10982,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1031,1923,7131);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1032,14329,861);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1033,53256,76163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1034,192,310);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1035,48,1635);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1036,8930,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1037,2219,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1038,13920,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1039,54693,19908);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1040,205,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1041,125025,68728);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1042,35,788);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1043,96851,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1044,530,603);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1045,77069,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1046,990136,114150);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1047,12052,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1048,10,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1049,4690,680);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1050,84493,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1051,16940,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1052,11184,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1053,15277,212778);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1054,234928,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1055,10981,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1056,6162,1726);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1057,3896,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1058,43373,243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1059,287,787);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1060,12208,45772);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1061,5309,206647);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1062,19274,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1063,15661,1552);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1064,9278,7326);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1065,3796,415);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1066,17604,49040);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1067,85,162);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1068,7908,1621);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1069,6193,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1070,12073,818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1071,28638,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1072,1429470,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1073,707,403);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1074,37917,58595);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1075,234925,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1076,11180,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1077,8874,1493);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1078,55411,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1079,53650,70);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1080,976,45772);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1081,48,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1082,10989,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1083,1283,869);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1084,1245,74465);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1085,4756,9899);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1086,10980,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1087,3141,10316);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1088,1894,9798);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1089,2231,1895);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1090,13240,869);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1091,1926,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1092,10990,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1093,10991,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1094,6199,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1095,1923,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1096,71580,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1097,10017,871);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1098,7399,9384);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1099,10,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1100,19274,9502);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1101,70851,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1102,134,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1103,114,22);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1104,28782,605);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1105,2283,350);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1106,13242,869);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1107,9777,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1108,13924,818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1109,2440,508);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1110,18277,136795);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1111,18999,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1112,140368,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1113,234923,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1114,21007,2698);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1115,2039,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1116,4587,9928);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1117,886,57201);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1118,956719,74643);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1119,114,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1120,887,9522);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1121,31,11287);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1122,84213,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1123,31,568);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1124,1923,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1125,524,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1126,2954,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1127,5658,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1128,112,4638);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1129,535,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1130,30614,10316);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1131,69122,18785);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1132,156739,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1133,3798,414);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1134,69597,414);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1135,335,49521);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1136,10,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1137,3234,4599);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1138,27972,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1139,113,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1140,3895,45772);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1141,3051,236);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1142,1926,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1143,1245,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1144,147,36669);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1145,514,881);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1146,109,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1147,12133,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1148,59841,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1149,9278,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1150,11180,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1151,1328,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1152,10990,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1153,5577,1633);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1154,2231,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1155,23532,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1156,1331,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1157,3798,268);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1158,8265,2698);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1159,504,2067);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1160,112,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1161,11355,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1162,7060,4638);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1163,10990,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1164,51329,34544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1165,11207,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1166,530025,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1167,17401,316023);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1168,1283,82695);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1169,8944,790);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1170,5149,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1171,17835,1593);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1172,990136,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1173,9464,604);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1174,1532,10776);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1175,71580,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1176,1771,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1177,17289,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1178,3141,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1179,13240,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1180,206,11774);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1181,69597,4327);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1182,2176,414);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1183,1331,2759);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1184,934,82695);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1185,3223,212778);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1186,147,1541);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1187,3895,157336);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1188,5469,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1189,10993,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1190,3223,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1191,707,226486);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1192,3895,10536);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1193,40481,9481);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1194,2368,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1195,4764,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1196,15286,11003);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1197,1640,489);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1198,3051,745);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1199,10860,64635);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1200,13524,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1201,6368,1930);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1202,7399,9824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1203,7676,562);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1204,10978,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1205,8691,22);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1206,1327,127585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1207,39189,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1208,10132,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1209,7882,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1210,55411,157336);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1211,65,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1212,7904,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1213,3291,203801);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1214,1771,77866);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1215,8534,226486);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1216,12041,10688);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1217,388,9928);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1218,31,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1219,886,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1220,1574936,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1221,1327,36657);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1222,1542,544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1223,27972,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1224,7060,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1225,8,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1226,96851,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1227,2231,680);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1228,2219,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1229,3234,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1230,2176,324668);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1231,8691,83686);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1232,13014,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1233,2482,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1234,6384,1637);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1235,4935,10264);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1236,2283,1771);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1237,2157,9836);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1238,7026,509);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1239,2283,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1240,10983,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1241,7399,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1242,61182,6957);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1243,10980,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1244,6949,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1245,5293,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1246,448,70);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1247,125025,50646);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1248,8191,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1249,3967,7131);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1250,2295,27578);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1251,1532,19908);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1252,9137,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1253,55636,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1254,8189,11287);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1255,15737,37724);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1256,1283,241259);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1257,287,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1258,7906,10537);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1259,3967,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1260,113,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1261,887,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1262,530025,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1263,3151,11520);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1264,956719,550);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1265,1892,489);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1266,17401,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1267,7399,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1268,11086,744);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1269,2053,568);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1270,1922,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1271,7167,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1272,4581,7446);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1273,22226,6957);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1274,1283,534);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1275,2954,10688);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1276,1932,804);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1277,1328,1824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1278,10993,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1279,1269,49521);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1280,8293,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1281,10859,72105);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1282,3895,155);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1283,12041,2501);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1284,380,62838);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1285,2231,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1286,526,77866);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1287,8265,74465);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1288,41091,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1289,18324,152532);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1290,956224,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1291,6162,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1292,8784,206647);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1293,10989,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1294,12901,9880);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1295,18999,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1296,7399,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1297,8930,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1298,1896,2067);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1299,44735,37799);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1300,2975,49521);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1301,21007,68718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1302,2387,127585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1303,3293,10710);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1304,17832,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1305,500,37233);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1306,234921,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1307,10990,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1308,10017,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1309,976,27578);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1310,51329,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1311,882,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1312,4589,1493);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1313,11355,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1314,1903,10364);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1315,1294,74643);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1316,96851,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1317,1210,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1318,41091,286217);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1319,5577,415);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1320,13240,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1321,62,680);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1322,500,744);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1323,20982,86834);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1324,1813,9880);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1325,5723,212778);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1326,18999,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1327,15661,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1328,565498,393);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1329,54693,50646);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1330,3896,508);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1331,11184,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1332,234933,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1333,4038,1541);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1334,7447,509);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1335,11357,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1336,10989,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1337,4483,212778);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1338,8447,11300);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1339,7908,1895);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1340,1923,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1341,11108,56292);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1342,9208,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1343,62,1571);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1344,162924,544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1345,13022,27205);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1346,477,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1347,1896,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1348,9191,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1349,1893,157336);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1350,8873,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1351,1461,4944);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1352,42317,19995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1353,18473,57201);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1354,1936,164);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1355,504,278);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1356,14343,257211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1357,880,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1358,526,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1359,1533,12157);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1360,380,82693);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1361,4173,86834);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1362,96841,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1363,1283,10264);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1364,10743,9824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1365,20582,49040);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1366,1283,62213);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1367,1532,620);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1368,15277,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1369,17604,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1370,192,70);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1371,61981,9502);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1372,20999,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1373,2039,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1374,96841,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1375,10991,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1376,4589,314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1377,27578,7326);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1378,9191,241259);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1379,61969,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1380,70851,9502);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1381,234929,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1382,10988,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1383,349,23629);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1384,10992,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1385,4495,310);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1386,3796,414);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1387,12041,82693);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1388,84213,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1389,234926,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1390,11184,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1391,30614,50646);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1392,2295,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1393,2192,314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1394,14064,37247);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1395,15440,2022);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1396,91606,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1397,234934,114150);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1398,534,1573);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1399,3636,9277);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1400,4495,11665);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1401,1461,49047);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1402,74568,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1403,10980,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1404,9138,634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1405,17052,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1406,1926,9824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1407,2141,9824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1408,8349,10364);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1409,5049,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1410,53714,9522);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1411,1533,137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1412,8447,1637);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1413,884,1635);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1414,4587,83542);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1415,7624,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1416,1230,74643);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1417,6193,68718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1418,6368,424);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1419,10205,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1420,72129,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1421,535,157336);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1422,4038,83542);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1423,18999,77866);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1424,1231,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1425,7795,11520);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1426,976,76163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1427,16935,31052);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1428,134,8866);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1429,2037,155);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1430,1895,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1431,62,27578);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1432,38334,11774);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1433,69122,2157);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1434,11086,861);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1435,21007,6957);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1436,5064,11631);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1437,2296,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1438,1643,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1439,113,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1440,11806,10137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1441,28782,604);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1442,9642,11774);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1443,79079,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1444,3798,415);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1445,60348,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1446,1333,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1447,530025,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1448,4566,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1449,1121,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1450,3926,49040);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1451,12041,324668);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1452,28638,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1453,15286,9472);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1454,6968,36657);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1455,18973,50544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1456,3636,903);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1457,1331,83542);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1458,91606,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1459,9137,1574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1460,22226,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1461,7907,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1462,16165,76492);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1463,140367,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1464,4038,287);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1465,3291,509);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1466,5293,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1467,9138,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1468,6837,11520);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1469,59841,18785);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1470,7907,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1471,140,24);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1472,7060,44147);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1473,1245,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1474,55636,9654);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1475,18973,72105);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1476,3061,80278);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1477,10991,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1478,96841,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1479,4495,773);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1480,1898,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1481,655,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1482,134,68718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1483,121953,350);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1484,11355,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1485,2505,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1486,19292,1824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1487,39189,45772);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1488,1333,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1489,112,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1490,13924,817);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1491,3234,1584);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1492,13242,45243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1493,1894,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1494,13922,818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1495,3300,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1496,11108,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1497,3926,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1498,10978,45772);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1499,51329,83686);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1500,1429470,57201);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1501,9191,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1502,1898,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1503,8189,568);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1504,9777,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1505,20982,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1506,11180,1771);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1507,3223,10528);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1508,10655,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1509,819,9654);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1510,9273,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1511,454,70);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1512,3291,508);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1513,234925,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1514,109,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1515,38334,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1516,8944,10330);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1517,4483,37247);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1518,11769,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1519,10978,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1520,8191,568);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1521,52865,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1522,192,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1523,4492,310);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1524,17604,168672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1525,11207,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1526,517,714);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1527,1365,36669);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1528,5309,36669);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1529,1813,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1530,11179,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1531,23532,9472);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1532,96066,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1533,1278367,37799);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1534,3894,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1535,11357,68728);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1536,59841,72105);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1537,517,11631);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1538,10127,10364);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1539,589,393);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1540,17051,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1541,1283,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1542,8873,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1543,234928,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1544,1542,137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1545,1333,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1546,287,4944);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1547,4724,568);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1548,31,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1549,2536,24);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1550,7166,629);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1551,1233,10316);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1552,67773,10141);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1553,23659,9384);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1554,11207,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1555,1204,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1556,14329,773);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1557,214701,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1558,96066,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1559,349,274);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1560,147,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1561,4566,508);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1562,4937,787);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1563,65827,290250);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1564,131,141);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1565,7056,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1566,20582,242582);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1567,2141,278);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1568,192,2698);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1569,134,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1570,73968,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1571,7447,7552);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1572,8293,261860);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1573,205,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1574,3300,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1575,7908,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1576,1369,597);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1577,14064,10364);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1578,5309,10549);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1579,6752,1571);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1580,95469,4599);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1581,1100,861);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1582,6576,278);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1583,10993,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1584,52603,278);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1585,214701,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1586,4483,9502);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1587,54693,1930);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1588,15758,1574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1589,52603,807);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1590,3234,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1591,20982,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1592,64,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1593,2037,27205);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1594,4038,36685);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1595,9281,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1596,113,1895);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1597,139549,206647);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1598,3141,271718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1599,9594,37247);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1600,884,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1601,95469,807);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1602,17064,83542);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1603,5309,714);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1604,12900,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1605,28640,9778);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1606,3125,8818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1607,234922,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1608,707,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1609,15758,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1610,7624,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1611,44735,209112);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1612,9191,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1613,4430,861);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1614,20999,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1615,8872,1552);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1616,18973,44214);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1617,206,310);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1618,3151,10549);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1619,1893,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1620,28633,544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1621,2207,290250);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1622,9464,605);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1623,7882,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1624,113,62213);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1625,10993,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1626,990136,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1627,6193,27205);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1628,127048,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1629,109,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1630,85,241259);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1631,17832,62838);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1632,388,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1633,43775,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1634,10992,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1635,6949,4944);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1636,532,5503);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1637,1892,157336);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1638,84213,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1639,2053,242582);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1640,1245,212778);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1641,4566,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1642,4430,261860);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1643,20818,2022);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1644,228,568);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1645,11357,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1646,15737,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1647,16828,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1648,4495,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1649,7399,544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1650,69597,141);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1651,112,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1652,1834,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1653,477,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1654,17064,37724);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1655,2368,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1656,15737,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1657,7906,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1658,5587,43347);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1659,1064,10537);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1660,10727,83686);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1661,1923,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1662,887,1593);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1663,61182,18785);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1664,13924,816);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1665,4589,355008);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1666,37625,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1667,524,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1668,43461,807);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1669,8534,1633);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1670,11006,127585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1671,8,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1672,18324,10137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1673,7624,1930);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1674,70851,7446);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1675,72129,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1676,1271,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1677,38334,9928);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1678,69122,4995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1679,79079,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1680,8191,1571);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1681,6573,1573);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1682,5293,559);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1683,585,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1684,9138,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1685,1896,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1686,2296,12096);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1687,380,257211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1688,865,9824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1689,2975,603);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1690,18999,7326);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1691,10988,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1692,1665,10528);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1693,156739,605);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1694,3141,3981);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1695,65,10264);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1696,40481,11774);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1697,1064,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1698,52603,7350);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1699,1574936,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1700,19923,714);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1701,19274,1819);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1702,349,49040);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1703,10989,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1704,51329,82693);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1705,131,43347);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1706,4139,72105);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1707,10983,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1708,12901,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1709,537,10330);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1710,7399,80035);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1711,17289,508);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1712,7904,10549);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1713,10988,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1714,11357,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1715,1898,310);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1716,41091,16614);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1717,20999,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1718,477,11631);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1719,1121,629);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1720,139,8866);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1721,1233,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1722,15831,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1723,6968,82695);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1724,9594,141);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1725,5149,62211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1726,1640,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1727,27578,127585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1728,11212,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1729,3911,275);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1730,147,393);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1731,4566,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1732,110,8963);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1733,227,2157);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1734,884,11003);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1735,54693,50544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1736,140,1574);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1737,1897,1858);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1738,4581,1593);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1739,64,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1740,11179,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1741,28638,11665);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1742,113,118);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1743,234928,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1744,1327,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1745,7624,100402);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1746,4756,9377);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1747,3300,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1748,55636,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1749,18324,8963);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1750,14407,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1751,1923,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1752,1925,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1753,192,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1754,22226,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1755,23659,9722);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1756,48,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1757,41091,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1758,10730,508);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1759,2157,1593);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1760,4495,50646);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1761,1231,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1762,524,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1763,13022,12560);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1764,19153,558);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1765,5309,37724);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1766,19153,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1767,4581,4638);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1768,212604,114150);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1769,6941,4327);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1770,67773,1552);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1771,234926,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1772,140,4327);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1773,110,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1774,4587,314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1775,47533,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1776,192,807);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1777,5151,141);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1778,15286,9398);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1779,2299,9676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1780,110,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1781,956224,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1782,6576,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1783,42317,37799);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1784,4566,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1785,887,421);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1786,1893,489);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1787,15318,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1788,11701,787);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1789,1365,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1790,1328,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1791,10205,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1792,17052,157336);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1793,77069,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1794,19278,271718);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1795,140367,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1796,7624,271110);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1797,3636,642);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1798,1640,65754);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1799,448,62838);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1800,57755,19908);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1801,9462,605);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1802,20818,11003);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1803,10655,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1804,477,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1805,7795,10364);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1806,1771,19995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1807,1893,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1808,4724,50646);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1809,4937,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1810,19274,6957);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1811,2535,415);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1812,109,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1813,14343,242582);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1814,3125,36669);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1815,109,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1816,1328,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1817,537,77);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1818,8930,36669);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1819,10978,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1820,57755,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1821,8534,597);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1822,15831,863);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1823,4038,226486);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1824,4175,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1825,1932,4808);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1826,5587,9824);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1827,4432,314);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1828,71070,11631);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1829,13014,70160);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1830,3801,11300);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1831,192,155);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1832,62,187);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1833,234922,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1834,234933,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1835,589,24);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1836,49265,11132);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1837,12898,10193);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1838,19,7326);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1839,10983,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1840,64,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1841,500,7446);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1842,47533,10688);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1843,19278,16614);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1844,1922,243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1845,14343,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1846,2536,393);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1847,454,168672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1848,10989,44147);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1849,4432,10141);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1850,1920,44214);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1851,7060,508);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1852,1283,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1853,1897,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1854,19545,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1855,10980,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1856,18277,1493);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1857,212604,316023);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1858,1331,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1859,886,155);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1860,477,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1861,5081,44147);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1862,882,120);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1863,227,12560);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1864,9278,152532);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1865,1813,257211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1866,10980,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1867,819,49040);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1868,3899,272);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1869,11769,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1870,9278,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1871,4038,329833);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1872,91606,76338);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1873,7026,241259);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1874,173451,254);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1875,7624,1771);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1876,8785,109445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1877,3894,155);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1878,62,745);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1879,234922,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1880,477,45772);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1881,60348,58595);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1882,13014,241259);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1883,7676,620);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1884,8191,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1885,880,68734);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1886,11212,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1887,514,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1888,28633,50544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1889,1893,10688);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1890,10993,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1891,1813,157336);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1892,3223,10138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1893,212604,257211);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1894,349,2034);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1895,20582,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1896,2505,74643);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1897,1892,74465);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1898,10988,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1899,10978,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1900,3796,268);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1901,17419,68734);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1902,5538,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1903,234923,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1904,7060,49051);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1905,524,1895);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1906,1936,10364);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1907,2954,10316);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1908,27105,45243);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1909,1892,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1910,1532,43074);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1911,5723,1573);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1912,10991,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1913,2157,9928);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1914,53714,10528);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1915,157626,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1916,157626,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1917,11212,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1918,139,415);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1919,19,127380);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1920,882,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1921,17064,206647);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1922,23659,9522);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1923,5472,11631);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1924,6193,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1925,127048,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1926,1925,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1927,2482,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1928,3223,1726);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1929,1813,11665);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1930,4724,881);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1931,7056,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1932,16119,274);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1933,12133,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1934,1532,11665);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1935,12052,807);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1936,74568,22970);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1937,956719,557);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1938,10205,19995);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1939,886,95);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1940,234923,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1941,17605,10195);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1942,9273,168672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1943,3125,11287);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1944,1331,603);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1945,1574936,82693);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1946,1360008,1422);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1947,1330,122);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1948,2207,1633);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1949,1230,68734);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1950,9594,642);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1951,15758,9481);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1952,6968,7131);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1953,1936,539);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1954,11108,54138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1955,4587,36669);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1956,1100,415);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1957,7166,355008);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1958,8785,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1959,3293,68728);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1960,16935,11287);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1961,827,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1962,11109,4638);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1963,3895,818);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1964,3293,7980);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1965,9278,23082);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1966,1018947,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1967,55636,651);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1968,6384,1552);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1969,140,9471);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1970,1895,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1971,9048,24428);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1972,19274,141);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1973,500,56292);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1974,1900,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1975,234929,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1976,69122,817);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1977,4935,27205);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1978,19278,1819);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1979,568374,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1980,54693,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1981,1331,9836);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1982,3291,83542);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1983,7795,37247);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1984,96841,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1985,882,121);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1986,884,585);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1987,17052,32856);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1988,15318,607);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1989,887,1819);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1990,884,76492);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1991,1331,1771);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1992,20089,23629);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1993,64,12445);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1994,10297,7446);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1995,6384,605);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1996,1894,163);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1997,1895,298);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1998,2037,2289);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (1999,57755,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2000,1461,415);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2001,7911,862);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2002,1294,8699);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2003,2053,597);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2004,3895,49026);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2005,53807,203801);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2006,3896,34544);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2007,237455,101299);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2008,1230,152760);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2009,140368,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2010,30614,290250);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2011,934,86834);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2012,74568,54138);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2013,65,2567);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2014,7026,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2015,1294,9472);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2016,335,676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2017,112,152760);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2018,19274,39513);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2019,5151,74643);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2020,96851,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2021,11207,673);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2022,237455,131634);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2023,15737,767);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2024,6573,68721);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2025,1923,671);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2026,35,102382);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2027,7906,10137);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2028,65827,1858);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2029,5576,414);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2030,5658,674);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2031,3291,245);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2032,10205,22970);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2033,14329,2698);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2034,11212,675);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2035,287,72190);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2036,13014,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2037,43775,5503);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2038,7624,36657);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2039,228,37233);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2040,10981,9676);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2041,819,550);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2042,1923,672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2043,1333,254);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2044,43461,568);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2045,1894,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2046,9191,12444);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2047,72129,168672);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2048,17832,23629);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2049,3061,1635);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2050,206,414);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2051,1271,161);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2052,2231,1771);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2053,7399,10710);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2054,1533,712);
INSERT INTO CASTING9468 (Castid, ActorNo,MovieNo) values (2055,6949,9486);



SELECT 'COLOURTYPE9468' as "TABLE NAME", COUNT(*) AS "NUMBER OF ROWS" FROM COLOURTYPE9468
UNION
SELECT 'RATING9468' , COUNT(*)  FROM RATING9468
UNION
SELECT 'MOVIE9468' , COUNT(*)  FROM MOVIE9468
UNION
SELECT 'ACTOR9468' , COUNT(*)  FROM ACTOR9468
UNION
SELECT 'CASTING9468' , COUNT(*) AS "ROWS IN CASTING TABLE" FROM CASTING9468
ORDER BY 1;

-- 1
SELECT COUNT(*)
FROM MOVIE9468

-- 2
SELECT COUNT(RATINGCODE)
FROM MOVIE9468 M

-- 3
SELECT M.RELYEAR 'Release Year', COUNT(*) 'Num Movies'
FROM MOVIE9468 M
GROUP BY M.RELYEAR

-- 4
SELECT M.RELYEAR 'Release Year', COUNT(*) 'Num Movies'
FROM MOVIE9468 M
WHERE M.RELYEAR BETWEEN 2000 AND 2009
GROUP BY M.RELYEAR

-- 5
SELECT M.RELYEAR 'Release Year', M.RATINGCODE 'Rating Code', MAX(RUNTIME) 'Length of Longest Movie'
FROM MOVIE9468 M
GROUP BY M.RELYEAR, M.RATINGCODE
ORDER BY RELYEAR, RATINGCODE ASC

-- 6
SELECT A.FULLNAME 'Actor', M.RATINGCODE 'Rating Code', COUNT(M.MOVIENO) 'Num Movies'
FROM MOVIE9468 M
INNER JOIN CASTING9468 C
ON M.MOVIENO = C.MOVIENO
INNER JOIN ACTOR9468 A
ON A.ACTORNO = C.ACTORNO
GROUP BY M.RATINGCODE, A.FULLNAME
ORDER BY A.FULLNAME ASC

-- 7
SELECT A.FULLNAME 'Actor', M.RATINGCODE 'Rating Code', COUNT(M.MOVIENO) 'Num Movies'
FROM MOVIE9468 M
INNER JOIN CASTING9468 C
ON M.MOVIENO = C.MOVIENO
INNER JOIN ACTOR9468 A
ON A.ACTORNO = C.ACTORNO
WHERE M.RELYEAR BETWEEN 1990 AND 2010
GROUP BY M.RATINGCODE, A.FULLNAME
ORDER BY A.FULLNAME ASC

-- 8
SELECT A.FULLNAME 'Actor', M.RATINGCODE 'Rating Code', COUNT(M.MOVIENO) 'Num Movies'
FROM MOVIE9468 M
INNER JOIN CASTING9468 C
ON M.MOVIENO = C.MOVIENO
INNER JOIN ACTOR9468 A
ON A.ACTORNO = C.ACTORNO
WHERE (M.RELYEAR BETWEEN 1990 AND 2010)
GROUP BY M.RATINGCODE, A.FULLNAME
HAVING COUNT(M.MOVIENO) >= 3
ORDER BY A.FULLNAME ASC
