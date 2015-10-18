CREATE TABLE IF NOT EXISTS News_sources (
	sname VARCHAR(64) PRIMARY KEY,
	srep FLOAT DEFAULT 0.0,
	saffil FLOAT  -- -1 leans left, +1 leans right, 0 is centrist/neutral
);

CREATE TABLE IF NOT EXISTS Politicians (
	pname VARCHAR(64) PRIMARY KEY,
	prep FLOAT DEFAULT 0.0,
	paffil FLOAT
);

-- the tuple (pname, tname, source) is a unique identifier for a row
CREATE TABLE IF NOT EXISTS Topics (
	tname VARCHAR(128) ,
	pname VARCHAR(64) REFERENCES Politicians.pname,
	sname VARCHAR(128) REFERENCES News_sources.sname,
	trep FLOAT DEFAULT 0.0,  -- specific to a politician
	srep FLOAT DEFAULT 0.0,
	ssent FLOAT DEFAULT 0.0,
	PRIMARY KEY (tname, pname, sname)
);

-- the tuple (pname, dname) is a unique identifier for a row
CREATE TABLE IF NOT EXISTS Speeches (
	pname REFERENCES Politicians.pname,
	dname VARCHAR(128),
	dtopic VARCHAR(128),
	ddate DATE,
	drep FLOAT DEFAULT 0.0,
	PRIMARY KEY (pname, dname)
);

