CREATE TABLE Mar(
CodMR int NOT NULL auto_increment,
Nombre varchar(20),
PRIMARY KEY (CodMR)
);

CREATE TABLE Rio(
CodR int NOT NULL auto_increment,
Nombre varchar(20),
CodMR int,
PRIMARY KEY (CodR),
FOREIGN KEY (CodMR) REFERENCES Mar(CodMR)
);

CREATE TABLE Capital(
CodC int NOT NULL auto_increment,
Nombre varchar(20),
NumHabitantes int,
PRIMARY KEY (CodC)
);

CREATE TABLE Provincia(
CodP int NOT NULL auto_increment,
Nombre varchar(20),
NumHabitantes int,
Capital int,
PRIMARY KEY (CodP),
FOREIGN KEY (Capital) REFERENCES Capital (CodC)
);

CREATE TABLE PasaPor(
ID int not null auto_increment,
CodR int,
CodP int,
PRIMARY KEY (ID),
FOREIGN KEY (CodR) REFERENCES Rio(CodR),
FOREIGN KEY (CodP) REFERENCES Provincia(CodP)
);