create database exp1;

CREATE TABLE Empleado(
NSS int NOT NULL,
Nombre varchar(30),
Apellido varchar(30),
FechaNac date,
Direccion varchar(250),
Sexo char,
PRIMARY KEY (NSS)
);

CREATE TABLE Proyecto(
Numero int NOT NULL,
Nombre varchar(70),
Localización varchar(20),
PRIMARY KEY (Numero)
);

CREATE TABLE Tarea(
ID int NOT NULL,
Nombre varchar(25),
Descripcion varchar(250),
PRIMARY KEY (ID)
);

CREATE TABLE Colabora(
NSS int NOT NULL,
NumeroProyecto int NOT NULL,
PRIMARY KEY (NSS,NumeroProyecto),
FOREIGN KEY (NSS) REFERENCES Empleado(NSS),
FOREIGN KEY (NumeroProyecto) REFERENCES Proyecto(Numero)
);

CREATE TABLE Tiene(
IDTarea int NOT NULL,
NumeroProyecto int NOT NULL,
PRIMARY KEY (IDTarea,NumeroProyecto),
FOREIGN KEY (IDTarea) REFERENCES Tarea(ID),
FOREIGN KEY (NumeroProyecto) REFERENCES Proyecto(Numero)
);

