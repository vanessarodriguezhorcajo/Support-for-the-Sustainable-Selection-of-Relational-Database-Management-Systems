create database exp1;

CREATE TABLE Persona (
DNI char(9) NOT NULL,
Nombre varchar(10),
PrimerApellido varchar(10),
SegundoApellido varchar(10),
PRIMARY KEY (DNI)
);

CREATE TABLE Carnet(
Numero char(9) NOT NULL,
Foto varchar(250),
FechaValidez DATE,
DNI char(9),
PRIMARY KEY (Numero),
FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

CREATE TABLE Permiso(
Vehiculo varchar(2) NOT NULL,
PRIMARY KEY (Vehiculo)
);

CREATE TABLE CentroOficial(
ID int NOT NULL,
PRIMARY KEY (ID)
);

CREATE TABLE ExamenPractico(
ID int NOT NULL,
DNI char(9),
Calificacion varchar(7),
CentroOficial int,
PRIMARY KEY (ID),
FOREIGN KEY (DNI) REFERENCES Persona(DNI),
FOREIGN KEY (CentroOficial) REFERENCES CentroOficial(ID)
);

CREATE TABLE ExamenTeorico(
ID int NOT NULL,
CentroOficial int,
PRIMARY KEY (ID),
FOREIGN KEY (CentroOficial) REFERENCES CentroOficial(ID)
);

CREATE TABLE Contiene(
Numero char(9),
Vehiculo varchar(2),
PRIMARY KEY (Numero, Vehiculo),
FOREIGN KEY (Numero) REFERENCES Carnet(Numero),
FOREIGN KEY (Vehiculo) REFERENCES Permiso(Vehiculo)
);

CREATE TABLE HaceTeorico(
DNI char(9),
IDExamen int,
Fecha DATE,
NumFallos int,
PRIMARY KEY (DNI,IDExamen),
FOREIGN KEY (DNI) REFERENCES Persona(DNI),
FOREIGN KEY (IDExamen) REFERENCES ExamenTeorico(ID)
);