create database exp1;

CREATE TABLE Direccion(
ID int NOT NULL,
CodigoPostal int,
Provincia varchar(50),
Municipio varchar(50),
Calle varchar(250),
Puerta int,
PRIMARY KEY (ID)
);

CREATE TABLE PerfilUsuario(
ID int NOT NULL,
PrimerEmail varchar(50),
SegundoEmail varchar(50),
Alias varchar(20),
Foto varchar(350),
PRIMARY KEY (ID)
);

CREATE TABLE UsuarioTitular(
DNI char(9) NOT NULL,
Nombre varchar(25),
Apellido varchar(25),
Sexo char(1),
Telefono int,
Edad int,
Direccion int,
PerfilUsuario int,
PRIMARY KEY (DNI),
FOREIGN KEY (Direccion) REFERENCES Direccion(ID),
FOREIGN KEY (PerfilUsuario) REFERENCES PerfilUsuario(ID)
);

