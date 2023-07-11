--Create Tables
CREATE Table League
    (League_ID      NUMBER(4)   NOT NULL,
     League_Name    CHAR(25)    NOT NULL,
    CONSTRAINT League_ID_PK PRIMARY KEY (League_ID));

CREATE Table Conference
    (Conference_ID      NUMBER(4)   NOT NULL,
     Conference_Name    CHAR(25)    NOT NULL,
     Conference_Type    CHAR(25)
            CHECK (Conference_Type IN ('Eastern','Western')),
     League_ID          NUMBER(4)   NOT NULL,
    CONSTRAINT Conference_ID_PK PRIMARY KEY (Conference_ID),
    CONSTRAINT League_ID_FK FOREIGN KEY (League_ID) REFERENCES League(League_ID));
    
CREATE Table Division
    (Division_ID      NUMBER(4)   NOT NULL,
     Division_Name    CHAR(25)    NOT NULL,
     Conference_ID    NUMBER(4)   NOT NULL,
     League_ID        NUMBER(4)   NOT NULL,
    CONSTRAINT Division_ID_PK PRIMARY KEY (Division_ID),
    CONSTRAINT Conference_ID_FK FOREIGN KEY (Conference_ID) REFERENCES Conference(Conference_ID),
    CONSTRAINT League_ID_FK1 FOREIGN KEY (League_ID) REFERENCES League(League_ID));

CREATE Table Teams
    (Team_ID          CHAR(25)    NOT NULL,
     Team_Name        CHAR(25)    NOT NULL,
     Team_City        CHAR(25)    NOT NULL,
     Division_ID      NUMBER(4)   NOT NULL,
     Conference_ID    NUMBER(4)   NOT NULL,
     League_ID        NUMBER(4)   NOT NULL,
    CONSTRAINT Team_ID_PK PRIMARY KEY (Team_ID),
    CONSTRAINT Division_ID_FK FOREIGN KEY (Division_ID) REFERENCES Division(Division_ID),
    CONSTRAINT Conference_ID_FK1 FOREIGN KEY (Conference_ID) REFERENCES Conference(Conference_ID),
    CONSTRAINT League_ID_FK2 FOREIGN KEY (League_ID) REFERENCES League(League_ID));

CREATE Table Player
    (Player_ID        VARCHAR(10)   NOT NULL,
     Player_LastName  CHAR(25)      NOT NULL,
     Player_FirstName CHAR(25)      NOT NULL,
     Player_Number    NUMBER(4)     NOT NULL,
     Avg_Ppg          DECIMAL(4,1)  NOT NULL,
     Avg_Apg          DECIMAL(4,1)  NOT NULL,
     Avg_Rpg          DECIMAL(4,1)  NOT NULL,
     Avg_Mpg          DECIMAL(4,1)  NOT NULL,
     Avg_Spg          DECIMAL(4,1)  NOT NULL,
     Avg_Bpg          DECIMAL(4,1)  NOT NULL,
     Avg_Fpg          DECIMAL(4,1)  NOT NULL,
     Avg_TOpg         DECIMAL(4,1)  NOT NULL,
     Team_ID          CHAR(25)      NOT NULL,
     Division_ID      NUMBER(4)     NOT NULL,
     Conference_ID    NUMBER(4)     NOT NULL,
     League_ID        NUMBER(4)     NOT NULL,
    CONSTRAINT Player_ID_PK PRIMARY KEY (Player_ID),
    CONSTRAINT Team_ID_FK FOREIGN KEY (Team_ID) REFERENCES Teams(Team_ID), 
    CONSTRAINT Division_ID_FK1 FOREIGN KEY (Division_ID) REFERENCES Division(Division_ID),
    CONSTRAINT Conference_ID_FK2 FOREIGN KEY (Conference_ID) REFERENCES Conference(Conference_ID),
    CONSTRAINT League_ID_FK3 FOREIGN KEY (League_ID) REFERENCES League(League_ID));
 
    
--INSERT Statements
    
--Insert Data into League Table
INSERT INTO League VALUES  (1, 'NBA');

--Insert Data into Conference Table
INSERT INTO Conference VALUES (1, 'East Conference', 'Eastern', 1);
INSERT INTO Conference VALUES (2, 'West Conference', 'Western', 1);

--Insert Data into Division Table
INSERT INTO Division VALUES (1,'Atlantic',1,1);
INSERT INTO Division VALUES (2,'Central',1,1);
INSERT INTO Division VALUES (3,'Southeast',1,1);
INSERT INTO Division VALUES (4,'Pacific',2,1);
INSERT INTO Division VALUES (5,'Southwest',2,1);
INSERT INTO Division VALUES (6,'Northwest',2,1);

--Insert Data into Teams Table
INSERT INTO Teams VALUES ('BoCe','Celtics','Boston',1,1,1);
INSERT INTO Teams VALUES ('BrNe','Nets','Brooklyn',1,1,1);
INSERT INTO Teams VALUES ('NyKn','Knicks','New York',1,1,1);
INSERT INTO Teams VALUES ('PhSi','Sixers','Philadelphia',1,1,1);
INSERT INTO Teams VALUES ('ToRa','Raptors','Toronto',1,1,1);
INSERT INTO Teams VALUES ('MiBu','Bucks','Milwaukee',2,1,1);
INSERT INTO Teams VALUES ('InPa','Pacers','Indiana',2,1,1);
INSERT INTO Teams VALUES ('ChBu','Bulls','Chicago',2,1,1);
INSERT INTO Teams VALUES ('DePi','Pistons','Detroit',2,1,1);
INSERT INTO Teams VALUES ('ClCa','Cavaliers','Cleveland',2,1,1);
INSERT INTO Teams VALUES ('MiHe','Heat','Miami',3,1,1);
INSERT INTO Teams VALUES ('OrMa','Magic','Orlando',3,1,1);
INSERT INTO Teams VALUES ('ChHo','Hornets','Charlotte',3,1,1);
INSERT INTO Teams VALUES ('WaWi','Wizards','Washington',3,1,1);
INSERT INTO Teams VALUES ('AtHa','Hawks','Atlanta',3,1,1);
INSERT INTO Teams VALUES ('LaLa','Lakers','Los Angeles',4,2,1);
INSERT INTO Teams VALUES ('LaCl','Clippers','Los Angeles',4,2,1);
INSERT INTO Teams VALUES ('PhSu','Suns','Phoenix',4,2,1);
INSERT INTO Teams VALUES ('SaKi','Kings','Sacramento',4,2,1);
INSERT INTO Teams VALUES ('GsWa','Warriors','Golden State',4,2,1);
INSERT INTO Teams VALUES ('HoRo','Rockets','Houston',5,2,1);
INSERT INTO Teams VALUES ('DaMa','Maverics','Dallas',5,2,1);
INSERT INTO Teams VALUES ('MeGr','Grizzlies','Memphis',5,2,1);
INSERT INTO Teams VALUES ('SaSp','Spurs','San Antonio',5,2,1);
INSERT INTO Teams VALUES ('NoPe','Pelicans','New Orleans',5,2,1);
INSERT INTO Teams VALUES ('DeNu','Nuggets','Denver',6,2,1);
INSERT INTO Teams VALUES ('OkTh','Thunder','Oklahoma City',6,2,1);
INSERT INTO Teams VALUES ('UtJa','Jazz','Utah',6,2,1);
INSERT INTO Teams VALUES ('PoTr','Trailblazers','Portland',6,2,1);
INSERT INTO Teams VALUES ('MiTi','Timberwolves','Minnesota',6,2,1);

--Insert Data into Player Tables
--Celtics
INSERT INTO Player VALUES ('JATA0','Tatum','Jayson',0,23.4,3.0,7.0,34.3,1.4,0.9,2.1,2.3,'BoCe',1,1,1);
INSERT INTO Player VALUES ('KEWA8','Walker','Kemba',8,20.4,4.8,3.9,31.1,0.9,0.5,1.6,2.1,'BoCe',1,1,1);
INSERT INTO Player VALUES ('JABR7','Brown','Jaylen',7,20.3,2.1,6.4,33.9,1.1,0.4,2.9,2.2,'BoCe',1,1,1);
--Nets
INSERT INTO Player VALUES ('JAAL31','Allen','Jarett',31,11.1,1.6,9.6,26.5,0.6,1.3,2.3,1.1,'BrNe',1,1,1);
INSERT INTO Player VALUES ('CALE22','LeVert','Caris',22,18.7,4.4,4.2,29.6,0.2,1.2,1.8,2.6,'BrNe',1,1,1);
INSERT INTO Player VALUES ('SPDI26','Dinwiddie','Spencer',26,20.6,6.8,3.5,31.2,0.6,0.3,2.8,2.7,'BrNe',1,1,1);
--Knicks
INSERT INTO Player VALUES ('RJBA9','Barrett','RJ',9,14.3,2.6,5.0,30.4,1.0,0.3,2.2,2.2,'NyKn',1,1,1);
INSERT INTO Player VALUES ('JURA30','Randle','Julius',30,19.5,3.1,9.7,32.5,0.8,0.3,2.8,3.0,'NyKn',1,1,1);
INSERT INTO Player VALUES ('MIRO23','Robinson','Mitchell',23,9.7,0.6,7.0,23.1,0.9,2.0,3.2,0.6,'NyKn',1,1,1);
--Sixers
INSERT INTO Player VALUES ('BESI25','Simmons','Ben',25,16.4,8.0,7.8,35.4,2.1,0.6,3.3,3.5,'PhSi',1,1,1);
INSERT INTO Player VALUES ('JOEM21','Embiid','Joel',21,23.0,3.0,11.6,29.5,0.9,1.3,3.4,3.1,'PhSi',1,1,1);
INSERT INTO Player VALUES ('TOHA12','Harris','Tobias',12,19.6,3.2,6.9,34.3,0.7,0.6,2.3,1.4,'PhSi',1,1,1);
--Raptors
INSERT INTO Player VALUES ('KYLO7','Lowry','Kyle',7,19.4,7.5,5.0,36.2,1.4,0.4,3.3,3.1,'ToRa',1,1,1);
INSERT INTO Player VALUES ('FRVA23','VanVleet','Fred',23,17.6,6.6,3.8,35.7,1.9,0.3,2.4,2.2,'ToRa',1,1,1);
INSERT INTO Player VALUES ('PASI43','Siakam','Pascal',43,22.9,3.5,7.3,35.2,1.0,0.9,2.8,2.5,'ToRa',1,1,1);
--Bulls
INSERT INTO Player VALUES ('COWH0','White','Coby',0,13.2,2.7,3.5,25.8,0.8,0.1,1.8,1.7,'ChBu',2,1,1);
INSERT INTO Player VALUES ('ZALA8','Lavine','Zach',8,25.5,4.2,4.8,34.8,1.5,0.5,2.2,3.4,'ChBu',2,1,1);
INSERT INTO Player VALUES ('LAMA24','Markkanen','Lauri',24,14.7,1.5,6.3,29.8,0.8,0.5,1.9,1.6,'ChBu',2,1,1);
--Bucks
INSERT INTO Player VALUES ('ERBL6','Bledsoe','Eric',6,14.9,5.4,4.6,27.0,0.9,0.4,2.1,2.4,'MiBu',2,1,1);
INSERT INTO Player VALUES ('KHMI22','Middleton','Khris',22,20.9,4.3,6.2,29.9,0.9,0.1,2.3,2.2,'MiBu',2,1,1);
INSERT INTO Player VALUES ('GIAN34','Antetokounmpo','Giannis',34,29.5,5.6,13.6,30.4,1.0,1.0,3.1,3.7,'MiBu',2,1,1);
--Pacers
INSERT INTO Player VALUES ('VIOL4','Oladipo','Victor',4,14.5,2.9,3.9,27.8,0.9,0.2,1.9,2.5,'InPa',2,1,1);
INSERT INTO Player VALUES ('TJWA1','Warren','TJ',1,19.8,1.5,4.2,32.9,1.2,0.5,2.8,1.3,'InPa',2,1,1);
INSERT INTO Player VALUES ('MYTU33','Turner','Miles',33,12.1,1.2,6.6,29.5,0.7,2.1,2.7,1.4,'InPa',2,1,1);
--Pistons
INSERT INTO Player VALUES ('DERO25','Rose','Derrick',25,18.1,5.6,2.4,26.0,0.8,0.3,1.0,2.5,'DePi',2,1,1);
INSERT INTO Player VALUES ('LUKE5','Kennard','Luke',5,15.8,4.1,3.5,32.9,0.4,0.2,2.3,1.5,'DePi',2,1,1);
INSERT INTO Player VALUES ('BLGR23','Griffin','Blake',23,15.5,3.3,4.7,28.4,0.4,0.4,1.5,2.2,'DePi',2,1,1);
--Cavaliers
INSERT INTO Player VALUES ('COSE2','Sexton','Collin',2,20.8,3.0,3.1,33.0,1.0,0.1,2.2,2.4,'ClCa',2,1,1);
INSERT INTO Player VALUES ('KELO0','Love','Kevin',0,17.6,3.2,9.8,31.8,0.6,0.3,1.6,2.5,'ClCa',2,1,1);
INSERT INTO Player VALUES ('ANDR3','Drummond','Andre',3,17.7,2.7,15.2,33.0,1.9,1.6,3.5,3.6,'ClCa',2,1,1);
--Hawks
INSERT INTO Player VALUES ('TRYO11','Young','Trae',11,29.6,9.3,4.3,35.3,1.1,0.1,1.7,4.8,'AtHa',3,1,1);
INSERT INTO Player VALUES ('KEHU3','Huerter','Kevin',3,12.2,3.8,4.1,31.4,0.9,0.5,2.5,1.6,'AtHa',3,1,1);
INSERT INTO Player VALUES ('JOCO20','Collins','John',20,21.6,1.5,10.1,33.2,0.8,1.6,3.4,1.8,'AtHa',3,1,1);
--Hornets
INSERT INTO Player VALUES ('DEGR4','Graham','Devonte',4,18.2,7.5,3.4,35.1,1.0,0.2,1.8,2.9,'ChHo',3,1,1);
INSERT INTO Player VALUES ('MIBR0','Bridges','Miles',0,13.0,1.8,5.6,30.7,0.6,0.7,2.0,1.5,'ChHo',3,1,1);
INSERT INTO Player VALUES ('PJWA25','Washington','PJ',25,12.2,2.1,5.4,30.3,0.9,0.8,2.7,1.6,'ChHo',3,1,1);
--Heat
INSERT INTO Player VALUES ('GODR7','Dragic','Goran',7,16.2,5.1,3.2,28.2,0.7,0.2,2.1,2.4,'MiHe',3,1,1);
INSERT INTO Player VALUES ('JIBU22','Butler','Jimmy',22,19.9,6.0,6.7,33.8,1.8,0.6,1.4,2.2,'MiHe',3,1,1);
INSERT INTO Player VALUES ('BAAD13','Adebayo','Bam',13,15.9,5.1,10.2,33.6,1.1,1.3,2.5,2.8,'MiHe',3,1,1);
--Magic
INSERT INTO Player VALUES ('MAFU20','Fultz','Markelle',20,12.1,5.1,3.3,27.7,1.3,0.2,2.0,2.0,'OrMa',3,1,1);
INSERT INTO Player VALUES ('AAGO00','Gordon','Aaron',00,14.4,3.7,7.7,32.5,0.8,0.6,2.0,1.6,'OrMa',3,1,1);
INSERT INTO Player VALUES ('NIVU9','Vucevic','Nikola',9,19.6,3.6,10.9,32.2,0.9,0.8,2.2,1.4,'OrMa',3,1,1);
--Wizards
INSERT INTO Player VALUES ('BRBE3','Beal','Bradley',3,30.5,6.1,4.2,36.0,1.2,0.4,2.2,3.4,'WaWi',3,1,1);
INSERT INTO Player VALUES ('RUHA8','Hachimura','Rui',8,13.5,1.8,6.1,30.1,0.8,0.2,2.2,1.1,'WaWi',3,1,1);
INSERT INTO Player VALUES ('THBR13','Bryant','Thomas',13,13.2,1.8,7.2,24.9,0.5,1.1,2.2,1.2,'WaWi',3,1,1);
--Warriors
INSERT INTO Player VALUES ('ANWI22','Wiggins','Andrew',22,21.8,3.7,5.1,34.4,0.8,1.0,2.4,3.4,'GsWa',4,2,1);
INSERT INTO Player VALUES ('DRGR23','Green','Draymond',23,8.0,6.2,6.2,28.4,1.4,0.8,2.6,2.3,'GsWa',4,2,1);
INSERT INTO Player VALUES ('ERPA7','Paschall','Eric',7,14.0,2.1,4.6,27.6,0.5,0.2,2.1,1.6,'GsWa',4,2,1);
--Clippers
INSERT INTO Player VALUES ('PAGE13','George','Paul',13,21.5,3.9,5.7,29.6,1.4,0.4,2.4,2.6,'LaCl',4,2,1);
INSERT INTO Player VALUES ('KALE2','Leonard','Kawhi',2,27.1,4.9,7.1,32.4,1.8,0.6,2.0,2.6,'LaCl',4,2,1);
INSERT INTO Player VALUES ('MOHA5','Harrell','Montrezl',5,18.6,1.7,7.1,27.8,0.6,1.1,2.3,1.7,'LaCl',4,2,1);
--Lakers
INSERT INTO Player VALUES ('LEJA23','James','LeBron',23,25.3,10.2,7.8,34.6,1.2,0.5,1.8,3.9,'LaLa',4,2,1);
INSERT INTO Player VALUES ('KECP1','Caldwell-Pope','Kentavious',1,9.3,1.6,2.1,25.5,0.8,0.2,1.9,0.9,'LaLa',4,2,1);
INSERT INTO Player VALUES ('ANDA3','Davis','Anthony',3,26.1,3.2,9.3,34.4,1.5,2.3,2.5,2.5,'LaLa',4,2,1);
--Suns
INSERT INTO Player VALUES ('DEBO1','Booker','Devin',1,26.6,6.5,4.2,35.9,0.7,0.3,3.0,3.8,'PhSu',4,2,1);
INSERT INTO Player VALUES ('KEOU3','Oubre Jr.','Kelly',3,18.7,1.5,6.4,34.5,1.3,0.7,3.4,1.5,'PhSu',4,2,1);
INSERT INTO Player VALUES ('DEAY22','Ayton','Deandre',22,18.2,1.9,11.5,32.5,0.7,1.5,3.1,2.1,'PhSu',4,2,1);
--Kings
INSERT INTO Player VALUES ('DEFO5','Fox','DeAaron',5,21.1,6.8,3.8,32.0,1.5,0.5,2.8,3.1,'SaKi',4,2,1);
INSERT INTO Player VALUES ('BOBA8','Bogdanovic','Bogdan',8,15.1,3.4,3.4,29.0,1.0,0.2,2.2,1.7,'SaKi',4,2,1);
INSERT INTO Player VALUES ('HABA40','Barnes','Harrison',40,14.5,2.2,4.9,34.5,0.6,0.2,1.3,1.2,'SaKi',4,2,1);
--Mavericks
INSERT INTO Player VALUES ('LUDO77','Doncic','Luka',77,28.8,8.8,9.4,33.6,1.0,0.2,2.5,4.3,'DaMa',5,2,1);
INSERT INTO Player VALUES ('TIHA11','Hardaway Jr.','Tim',11,15.8,1.9,3.3,29.5,0.6,0.1,1.8,1.0,'DaMa',5,2,1);
INSERT INTO Player VALUES ('KRPO6','Porzingis','Kristaps',6,20.4,1.8,9.5,31.8,0.7,2.0,3.2,1.6,'DaMa',5,2,1);
--Rockets
INSERT INTO Player VALUES ('RUWE0','Westbrook','Russell',0,27.2,7.0,7.9,35.9,1.6,0.4,3.5,3.4,'HoRo',5,2,1);
INSERT INTO Player VALUES ('JAHA13','Harden','James',13,34.3,7.5,6.6,36.5,1.8,0.9,3.3,4.5,'HoRo',5,2,1);
INSERT INTO Player VALUES ('PJTU17','Tucker','P.J.',17,6.9,1.6,6.6,34.3,1.1,0.5,3.2,1.0,'HoRo',5,2,1);
--Grizzlies
INSERT INTO Player VALUES ('JAMO12','Morant','Ja',12,17.8,7.3,3.9,31.0,0.9,0.3,1.6,3.3,'MeGr',5,2,1);
INSERT INTO Player VALUES ('DIBR24','Brooks','Dylan',24,16.2,2.1,3.3,28.9,0.9,0.4,3.8,1.7,'MeGr',5,2,1);
INSERT INTO Player VALUES ('JAJA13','Jackson Jr.','Jaren',13,17.4,1.4,4.6,28.5,0.7,1.6,4.1,1.7,'MeGr',5,2,1);
--Pelicans
INSERT INTO Player VALUES ('LOBA2','Ball','Lonzo',2,11.8,7.0,6.1,32.1,1.4,0.6,2.0,3.1,'NoPe',5,2,1);
INSERT INTO Player VALUES ('BRIN14','Ingram','Brandon',14,23.8,4.2,6.1,33.9,1.0,0.6,2.9,3.0,'NoPe',5,2,1);
INSERT INTO Player VALUES ('ZIWI1','Williamson','Zion',1,22.5,2.1,6.3,27.8,0.7,0.4,1.8,2.5,'NoPe',5,2,1);
--Spurs
INSERT INTO Player VALUES ('DEMU5','Murray','Dejounte',5,10.9,4.1,5.8,25.6,1.7,0.3,2.2,1.9,'SaSp',5,2,1);
INSERT INTO Player VALUES ('DEDE10','DeRozan','DeMar',10,22.1,5.6,5.5,34.1,1.0,0.3,2.6,2.4,'SaSp',5,2,1);
INSERT INTO Player VALUES ('LAAL12','Aldridge','LaMarcus',12,18.9,2.4,7.4,33.1,0.7,1.6,2.4,1.4,'SaSp',5,2,1);
--Nuggets
INSERT INTO Player VALUES ('JAMU27','Murray','Jamal',27,18.5,4.8,4.0,32.3,1.1,0.3,1.7,2.2,'DeNu',6,2,1);
INSERT INTO Player VALUES ('GAHA14','Harris','Gary',14,10.4,2.1,2.9,31.8,1.4,0.3,2.1,1.1,'DeNu',6,2,1);
INSERT INTO Player VALUES ('NIJO15','Jokic','Nikola',15,19.9,7.0,9.7,32.0,1.2,0.6,3.0,3.1,'DeNu',6,2,1);
--Timberwolves
INSERT INTO Player VALUES ('DARU0','Russell','DAngelo',0,23.1,6.3,3.9,32.3,1.1,0.3,1.9,3.3,'MiTi',6,2,1);
INSERT INTO Player VALUES ('JOOK20','Okogie','Josh',20,8.6,1.6,4.3,25.0,1.1,0.4,2.2,1.4,'MiTi',6,2,1);
INSERT INTO Player VALUES ('KATO32','Towns','Karl-Anthony',32,26.5,4.4,10.8,33.9,0.9,1.2,3.3,3.1,'MiTi',6,2,1);
--Thunder
INSERT INTO Player VALUES ('CHPA3','Paul','Chris',3,17.6,6.7,5.0,31.5,1.6,0.2,2.3,2.3,'OkTh',6,2,1);
INSERT INTO Player VALUES ('SHGI2','Gilgeous-Alexander','Shai',2,19.0,3.3,5.9,34.7,1.1,0.7,1.7,1.9,'OkTh',6,2,1);
INSERT INTO Player VALUES ('STAD12','Adams','Steven',12,10.9,2.3,9.3,26.7,0.8,1.1,1.9,1.5,'OkTh',6,2,1);
--Trailblazers
INSERT INTO Player VALUES ('DALI0','Lillard','Damian',0,30.0,8.0,4.3,37.5,1.1,0.3,1.7,2.9,'PoTr',6,2,1);
INSERT INTO Player VALUES ('CJMC3','McCollum','CJ',3,22.2,4.4,4.2,36.5,0.8,0.6,2.6,1.8,'PoTr',6,2,1);
INSERT INTO Player VALUES ('JUNU27','Nurkic','Jusuf',27,17.6,4.0,10.3,31.6,1.4,2.0,4.9,2.4,'PoTr',6,2,1);
--Jazz
INSERT INTO Player VALUES ('MICO10','Conley','Mike',10,14.4,4.4,3.2,29.0,0.8,0.1,2.2,2.0,'UtJa',6,2,1);
INSERT INTO Player VALUES ('DOMI45','Mitchell','Donovan',45,24.0,4.3,4.4,34.3,1.0,0.2,2.5,2.7,'UtJa',6,2,1);
INSERT INTO Player VALUES ('RUGO27','Gobert','Rudy',27,15.1,1.5,13.5,34.3,0.8,2.0,3.2,1.9,'UtJa',6,2,1);


--SELECT Statements

--Shows all players with 10+ ppg and 10+ rpg
SELECT Player.Avg_Ppg, Player.Avg_Rpg, Player.Player_FirstName, Player.Player_LastName, Player.Team_ID
FROM Player
WHERE Avg_Ppg > 10.0 
    AND Avg_Rpg > 10.0;

--Shows all players with 3+ fpg and 3+ topg
SELECT Player.Avg_Fpg, Player.Avg_TOpg, Player.Player_FirstName, Player.Player_LastName, Player.Team_ID
FROM Player
WHERE Avg_Fpg > 3.0 
    AND Avg_TOpg > 3.0;

--Join that shows all players in the Atlantic division with 15+ ppg and orders them from worst ppg to best
SELECT Player.Avg_Ppg, Player.Player_FirstName, Player.Player_LastName, Player.Team_Id, Player.Division_ID, Division.Division_Id, 
       Division.Division_Name
FROM Player, Division
WHERE Player.Division_ID = Division.Division_ID
    AND Avg_Ppg > 15
    AND Division_Name = 'Atlantic'
ORDER BY Avg_Ppg;

--Join that shows the ppg, apg, and rpg for all players in the Eastern Conference and orders them by their Team ID
SELECT Player.Avg_Ppg, Player.Avg_Apg, Player.Avg_Rpg, Player.Player_FirstName, Player.Player_LastName, Player.Team_Id, Player.Conference_ID, 
       Conference.Conference_Id, Conference.Conference_Type 
FROM Player, Conference
WHERE Player.Conference_ID = Conference.Conference_ID
    AND Conference_Type = 'Eastern'
ORDER BY Team_ID;

--Join that shows the fpg and topg for all players in the NBA and groups them by team
SELECT Player.Avg_Mpg, Player.Avg_Fpg, Player.Avg_TOpg, Player.Player_FirstName, Player.Player_LastName, Player.Team_ID, League.League_ID,
       League.League_Name
FROM Player, League
WHERE Player.League_ID = League.League_ID
GROUP BY Team_ID
ORDER BY Avg_Fpg;

--Join that takes all the players from a team and orders them lowest jersey number to highest
SELECT Player.Player_Number, Player.Player_LastName, Player.Player_FirstName, Player.Player_ID, Player.Team_ID, Teams.Team_ID,
       Teams.Team_Name
FROM Player, Teams
WHERE Player.Team_ID = Teams.Team_ID
    AND Team_Name = 'Celtics'
ORDER BY Player_Number;

--Join that shows the leaders in spg and bpg in the Western Conference
SELECT Player.Avg_Spg, Player.Avg_Bpg, Player.Player_FirstName, Player.Player_LastName, Player.Team_Id, Player.Conference_ID, 
       Conference.Conference_Id, Conference.Conference_Type 
FROM Player, Conference
WHERE Player.Conference_ID = Conference.Conference_ID
    AND Conference_Type = 'Western'
ORDER BY Avg_Spg;

--Join that shows all the mpg averages for all players in the league in order by team
SELECT Player.Avg_Mpg, Player.Player_FirstName, Player.Player_LastName, Player.Team_Id, Player.League_ID, League.League_Id
FROM Player, League
WHERE Player.League_ID = League.League_ID
ORDER BY Team_ID;


--UPDATE Statements
UPDATE Player SET
Team_ID = 'PhSu' WHERE
Player_ID = 'CHPA3'; 

UPDATE Player SET
Avg_Ppg = 10.3 WHERE
Player_ID = 'GAHA14'; 
