CREATE TABLE Sailors (
	sid char(5),
	sname char(10),
	rating INTEGER,
	age REAL,
	PRIMARY KEY (sid)
);

CREATE TABLE Boats (
	bid char(5),
	bname char(10),
	color char(10),
	PRIMARY KEY (bid)
);

CREATE TABLE Reserves (
	sid char(5),
	bid char(5),
	day char(10),
	PRIMARY KEY (sid, bid),
	FOREIGN KEY (sid) REFERENCES Sailors (sid) ON DELETE CASCADE,
	FOREIGN KEY (bid) REFERENCES Boats (bid)   ON DELETE CASCADE
);

INSERT INTO Sailors
VALUES 
('22',	'Dustin',	7,	45),
('29',	'Brutus',	1,	33),
('31',	'Lubber',	8,	55.5),
('32',	'Andy',		8,	25.5),
('58',	'Rusty',	10,	35),
('64',	'Horatio',	7,	35),
('71',	'Zorba',	10,	16),
('74',	'Horatio',	9,	35),
('85',	'Art',		3,	25.5),
('95',	'Bob',		3,	63.5);

INSERT INTO Boats
VALUES
('101',	'Interlake',	'blue'),
('102',	'Interlake',	'red'),
('103',	'Clipper',		'green'),
('104',	'Marine',		'red');

INSERT INTO Reserves
VALUES
('22',	'101',	'10/10/98'),
('22',	'102',	'10/10/98'),
('22',	'103',	'10/8/98'),
('22',	'104',	'10/7/98'),
('31',	'102',	'11/10/98'),
('31',	'103',	'11/6/98'),
('31',	'104',	'11/12/98'),
('64',	'101',	'9/5/98'),
('64',	'102',	'9/8/98'),
('74',	'103',	'9/8/98');