CREATE TABLE Persona (
DNI SERIAL,
Nombre varchar(10),
PrimerApellido varchar(10),
SegundoApellido varchar(10),
PRIMARY KEY (DNI)
);

CREATE TABLE Carnet(
Numero SERIAL,
Foto varchar(250),
FechaValidez varchar(30),
DNI INT,
PRIMARY KEY (Numero),
FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

CREATE TABLE Permiso(
Vehiculo varchar(2) NOT NULL,
PRIMARY KEY (Vehiculo)
);

CREATE TABLE CentroOficial(
ID int NOT NULL ,
PRIMARY KEY (ID)
);

CREATE TABLE ExamenPractico(
ID SERIAL,
DNI INT,
Calificacion varchar(7),
CentroOficial int,
PRIMARY KEY (ID),
FOREIGN KEY (DNI) REFERENCES Persona(DNI),
FOREIGN KEY (CentroOficial) REFERENCES CentroOficial(ID)
);

CREATE TABLE ExamenTeorico(
ID SERIAL,
CentroOficial int,
PRIMARY KEY (ID),
FOREIGN KEY (CentroOficial) REFERENCES CentroOficial(ID)
);

CREATE TABLE Contiene(
ID SERIAL,
Numero INT,
Vehiculo varchar(2),
PRIMARY KEY (ID),
FOREIGN KEY (Numero) REFERENCES Carnet(Numero),
FOREIGN KEY (Vehiculo) REFERENCES Permiso(Vehiculo)
);

CREATE TABLE HaceTeorico(
ID SERIAL,
DNI INT,
IDExamen int,
Fecha varchar(40),
NumFallos int,
PRIMARY KEY (ID),
FOREIGN KEY (DNI) REFERENCES Persona(DNI),
FOREIGN KEY (IDExamen) REFERENCES ExamenTeorico(ID)
);