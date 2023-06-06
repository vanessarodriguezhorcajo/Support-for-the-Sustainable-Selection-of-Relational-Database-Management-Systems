create database exp1;

CREATE TABLE Mar(
CodMR int NOT NULL,
Nombre varchar(20),
PRIMARY KEY (CodMR)
);

CREATE TABLE Rio(
CodR int NOT NULL,
Nombre varchar(20),
CodMR int,
PRIMARY KEY (CodR),
FOREIGN KEY (CodMR) REFERENCES Mar(CodMR)
);

CREATE TABLE Provincia(
CodP int NOT NULL,
Nombre varchar(20),
NumHabitantes int,
PRIMARY KEY (CodP)
);

CREATE TABLE PasaPor(
CodR int,
CodP int,
PRIMARY KEY (CodR, CodP),
FOREIGN KEY (CodR) REFERENCES Rio(CodR),
FOREIGN KEY (CodP) REFERENCES Provincia(CodP)
);