create database exp1;

CREATE TABLE Sala(
ID int NOT NULL,
Nombre varchar(20),
PRIMARY KEY (ID)
);

CREATE TABLE Especialidad(
ID int NOT NULL,
Nombre varchar(20),
PRIMARY KEY (ID)
);

CREATE TABLE Medico(
NumeroColegiado int NOT NULL,
DNI char(9),
Nombre varchar(10),
PrimerApellido varchar(10),
SegundoApellido varchar(10),
Especialidad int,
Sala int,
PRIMARY KEY (NumeroColegiado),
FOREIGN KEY (Especialidad) REFERENCES Especialidad(ID),
FOREIGN KEY (Sala) REFERENCES Sala(ID)
);

CREATE TABLE Enfermero(
NumeroColegiado int NOT NULL,
DNI char(9),
Nombre varchar(10),
PrimerApellido varchar(10),
SegundoApellido varchar(10),
Sala int,
PRIMARY KEY (NumeroColegiado),
FOREIGN KEY (Sala) REFERENCES Sala(ID)
);

CREATE TABLE Paciente(
NumeroAdmision int NOT NULL,
DNI char(9),
Nombre varchar(10),
PrimerApellido varchar(10),
Medico int,
Enfermero int,
Sala int,
PRIMARY KEY (NumeroAdmision),
FOREIGN KEY (Medico) REFERENCES Medico(NumeroColegiado),
FOREIGN KEY (Sala) REFERENCES Sala(ID),
FOREIGN KEY (Enfermero) REFERENCES Enfermero(NumeroColegiado)
);

CREATE TABLE Cita(
ID int NOT NULL,
Fecha DATE,
Hora TIME,
Hospital varchar(20),
Paciente int,
PRIMARY KEY (ID),
FOREIGN KEY (Paciente) REFERENCES Paciente(NumeroAdmision)
);



