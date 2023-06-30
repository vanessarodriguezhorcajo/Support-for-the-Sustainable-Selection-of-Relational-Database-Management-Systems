create database exp1;

CREATE TABLE Mar(
CodMR int NOT NULL,
Nombre varchar(20),
PRIMARY KEY (CodMR)
);

CREATE TABLE Satelite(
CodS int NOT NULL,
Nombre varchar(20),
Tipo varchar(20),
PRIMARY KEY (CodS)
);

CREATE TABLE Rio(
CodR int NOT NULL,
Nombre varchar(20),
CodMR int,
CodS int,
PRIMARY KEY (CodR),
FOREIGN KEY (CodMR) REFERENCES Mar(CodMR),
FOREIGN KEY (CodS) REFERENCES Satelite(CodS)
);

CREATE TABLE Provincia(
CodP int NOT NULL,
Nombre varchar(20),
NumHabitantes int,
PRIMARY KEY (CodP)
);

CREATE TABLE SistemaMont(
CodS int NOT NULL,
Nombre varchar(20),
Altura float,
Longitud float,
PRIMARY KEY (CodS)
);

CREATE TABLE Monte(
CodM int NOT NULL,
Nombre varchar(20),
Altura float,
CodS int,
SistemaMont int,
PRIMARY KEY (CodM),
FOREIGN KEY (CodS) REFERENCES Satelite(CodS),
FOREIGN KEY (SistemaMont) REFERENCES SistemaMont(CodS)
);

CREATE TABLE PasaPor(
CodR int,
CodP int,
PRIMARY KEY (CodR, CodP),
FOREIGN KEY (CodR) REFERENCES Rio(CodR),
FOREIGN KEY (CodP) REFERENCES Provincia(CodP)
);

CREATE TABLE Esta(
CodM int,
CodP int,
PRIMARY KEY (CodM, CodP),
FOREIGN KEY (CodM) REFERENCES Monte(CodM),
FOREIGN KEY (CodP) REFERENCES Provincia(CodP)
);