create database exp1;

CREATE TABLE PerfilUsuario(
ID int NOT NULL,
PrimerEmail varchar(50),
SegundoEmail varchar(50),
Alias varchar(20), 
Foto varchar(250),
PRIMARY KEY (ID)
);

CREATE TABLE Cliente(
DNI char(9) NOT NULL,
Nombre varchar(10),
PrimerApellido varchar(10),
Telefono char(9),
IDCuentaUsuario int,
PRIMARY KEY (DNI),
FOREIGN KEY (IDCuentaUsuario) REFERENCES PerfilUsuario(ID)
);

CREATE TABLE Restaurante(
ID varchar(20) NOT NULL,
Email varchar(50),
Telefono char(9),
Direccion varchar(30),
PRIMARY KEY (ID)
);

CREATE TABLE Acude(
DNI char(9),
Restaurante varchar(20),
Fecha DATE,
PRIMARY KEY (DNI,Restaurante,Fecha),
FOREIGN KEY (DNI) REFERENCES Cliente (DNI),
FOREIGN KEY (Restaurante) REFERENCES Restaurante (ID)
);