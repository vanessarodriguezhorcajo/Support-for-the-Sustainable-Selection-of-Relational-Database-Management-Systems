CREATE TABLE Persona (
DNI INT NOT NULL auto_increment,
Nombre varchar(10),
PrimerApellido varchar(10),
SegundoApellido varchar(10),
PRIMARY KEY (DNI)
);

CREATE TABLE Carnet(
Numero INT NOT NULL auto_increment,
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
ID int NOT NULL auto_increment,
DNI INT,
Calificacion varchar(7),
CentroOficial int,
PRIMARY KEY (ID),
FOREIGN KEY (DNI) REFERENCES Persona(DNI),
FOREIGN KEY (CentroOficial) REFERENCES CentroOficial(ID)
);

CREATE TABLE ExamenTeorico(
ID int NOT NULL auto_increment,
CentroOficial int,
PRIMARY KEY (ID),
FOREIGN KEY (CentroOficial) REFERENCES CentroOficial(ID)
);

CREATE TABLE Contiene(
ID INT NOT NULL auto_increment,
Numero INT,
Vehiculo varchar(2),
PRIMARY KEY (ID),
FOREIGN KEY (Numero) REFERENCES Carnet(Numero),
FOREIGN KEY (Vehiculo) REFERENCES Permiso(Vehiculo)
);

CREATE TABLE HaceTeorico(
ID INT NOT NULL auto_increment,
DNI INT,
IDExamen int,
Fecha varchar(40),
NumFallos int,
PRIMARY KEY (ID),
FOREIGN KEY (DNI) REFERENCES Persona(DNI),
FOREIGN KEY (IDExamen) REFERENCES ExamenTeorico(ID)
);