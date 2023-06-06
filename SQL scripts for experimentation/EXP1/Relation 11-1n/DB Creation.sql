create database exp1;

CREATE TABLE CuentaUsuario(
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
SegundoApellido varchar(10),
Telefono char(9),
IDCuentaUsuario int, 
PRIMARY KEY (DNI),
FOREIGN KEY (IDCuentaUsuario) REFERENCES CuentaUsuario (ID)
);

CREATE TABLE Paquete(
ID int NOT NULL,
Peso float,
Dimensiones varchar(20),
Fragil int,
DNIRemitente char(9),
PRIMARY KEY (ID),
FOREIGN KEY (DNIRemitente) REFERENCES Cliente(DNI)
);