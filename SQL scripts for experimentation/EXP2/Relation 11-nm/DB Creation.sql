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

CREATE TABLE Menu(
Nombre varchar(10) NOT NULL,
PRIMARY KEY (Nombre)
);

CREATE TABLE Plato(
Nombre varchar(10) NOT NULL,
TipoCocina varchar(10),
PRIMARY KEY (Nombre)
);

CREATE TABLE Ingrediente(
Nombre varchar(10) NOT NULL,
PRIMARY KEY (Nombre)
);

CREATE TABLE Acude(
DNI char(9),
Restaurante varchar(20),
Fecha DATE,
PRIMARY KEY (DNI,Restaurante,Fecha),
FOREIGN KEY (DNI) REFERENCES Cliente (DNI),
FOREIGN KEY (Restaurante) REFERENCES Restaurante (ID)
);

CREATE TABLE Puntua(
DNI char(9),
Menu varchar(10),
Valoracion int,
PRIMARY KEY (DNI,Menu,Valoracion),
FOREIGN KEY (DNI) REFERENCES Cliente (DNI),
FOREIGN KEY (Menu) REFERENCES Menu (Nombre)
);

CREATE TABLE Ofrece(
Restaurante varchar(20),
Menu varchar(10),
PRIMARY KEY (Restaurante,Menu),
FOREIGN KEY (Restaurante) REFERENCES Restaurante (ID),
FOREIGN KEY (Menu) REFERENCES Menu (Nombre)
);

CREATE TABLE Incluye(
Plato varchar(10),
Menu varchar(10),
Orden int,
PRIMARY KEY (Plato,Menu,Orden),
FOREIGN KEY (Plato) REFERENCES Plato (Nombre),
FOREIGN KEY (Menu) REFERENCES Menu (Nombre)
);

CREATE TABLE CompuestoDe(
Plato varchar(10),
Ingrediente varchar(10),
Cantidad float,
PRIMARY KEY (Plato,Ingrediente, Cantidad),
FOREIGN KEY (Plato) REFERENCES Plato (Nombre),
FOREIGN KEY (Ingrediente) REFERENCES Ingrediente (Nombre)
);