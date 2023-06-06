create database exp1;

CREATE TABLE Departamento(
Numero int NOT NULL,
Nombre varchar(30),
Fecha_de_creacion date,
PRIMARY KEY (Numero)
);

CREATE TABLE Empleado(
NSS int NOT NULL,
Nombre varchar(30),
Apellido varchar(30),
FechaNac date,
Salario float,
Direccion varchar(250),
Sexo char,
Departamento int,
PRIMARY KEY (NSS),
FOREIGN KEY (Departamento) REFERENCES Departamento(Numero)
);

CREATE TABLE Proyecto(
Numero int NOT NULL,
Nombre varchar(70),
Localización varchar(20),
Departamento int,
PRIMARY KEY (Numero),
FOREIGN KEY (Departamento) REFERENCES Departamento(Numero)
);
