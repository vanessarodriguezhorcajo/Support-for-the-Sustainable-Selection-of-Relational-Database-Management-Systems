CREATE TABLE Direccion(
ID int NOT NULL IDENTITY,
CodigoPostal int,
Provincia varchar(50),
Municipio varchar(50),
Calle varchar(250),
Puerta int,
PRIMARY KEY (ID)
);

CREATE TABLE PerfilUsuario(
ID int NOT NULL IDENTITY,
PrimerEmail varchar(50),
SegundoEmail varchar(50),
Alias varchar(20),
Foto varchar(350),
PRIMARY KEY (ID)
);

CREATE TABLE Usuario(
DNI INT NOT NULL IDENTITY,
Nombre varchar(25),
Apellido varchar(25),
Edad int,
Direccion int,
PerfilUsuario int,
PRIMARY KEY (DNI),
FOREIGN KEY (Direccion) REFERENCES Direccion(ID),
FOREIGN KEY (PerfilUsuario) REFERENCES PerfilUsuario(ID)
);

CREATE TABLE Tarjeta(
Numero int NOT NULL IDENTITY,
FechaValidez DATE,
UsuarioTitular INT,
PRIMARY KEY (Numero),
FOREIGN KEY (UsuarioTitular) REFERENCES Usuario (DNI)
);

CREATE TABLE Telefono(
ID int NOT NULL IDENTITY,
Telefono int,
Tipo varchar(7),
Usuario INT,
PRIMARY KEY (ID),
FOREIGN KEY (Usuario) REFERENCES Usuario (DNI)
);

CREATE TABLE Comentario(
ID int NOT NULL IDENTITY,
Texto varchar (250),
Usuario INT,
PRIMARY KEY (ID),
FOREIGN KEY (Usuario) REFERENCES Usuario (DNI)
);

CREATE TABLE CompañiaReparto(
ID int NOT NULL IDENTITY,
Nombre varchar(20),
Direccion varchar(150),
PRIMARY KEY (ID)
);

CREATE TABLE Repartidor(
DNI INT NOT NULL IDENTITY,
Nombre varchar(25),
Apellido varchar(25),
CompañiaReparto int,
PRIMARY KEY (DNI),
FOREIGN KEY (CompañiaReparto) REFERENCES CompañiaReparto(ID)
);

CREATE TABLE Ruta(
ID int NOT NULL IDENTITY,
LugarInicio varchar(150),
LugarFin varchar(150),
PRIMARY KEY (ID)
);

CREATE TABLE Recorre(
ID INT NOT NULL IDENTITY,
Repartidor INT,
Ruta int,
Fecha DATE,
PRIMARY KEY (ID),
FOREIGN KEY (Repartidor) REFERENCES Repartidor(DNI),
FOREIGN KEY (Ruta) REFERENCES Ruta(ID)
);

CREATE TABLE Pedido(
ID int NOT NULL IDENTITY,
ImporteTotal float,
Usuario INT,
Fecha DATE,
Repartidor INT,
PRIMARY KEY (ID),
FOREIGN KEY (Usuario) REFERENCES Usuario (DNI),
FOREIGN KEY (Repartidor) REFERENCES Repartidor (DNI)
);

CREATE TABLE DetallePedido(
ID int NOT NULL IDENTITY,
Importe float,
CantidadProductos int,
CosteTransporte float,
IDPedido int,
PRIMARY KEY (ID),
FOREIGN KEY (IDPedido) REFERENCES Pedido (ID)
);

CREATE TABLE Factura(
ID int NOT NULL IDENTITY,
ImporteTotal float,
FechaPedido DATE,
IDPedido int,
PRIMARY KEY (ID),
FOREIGN KEY (IDPedido) REFERENCES Pedido (ID)
);

CREATE TABLE DetalleFactura(
ID int NOT NULL IDENTITY,
Importe float,
CantidadProductos int,
CostesTransporte float,
IDFactura int,
PRIMARY KEY (ID),
FOREIGN KEY (IDFactura) REFERENCES Factura (ID)
);

CREATE TABLE Categoria(
ID int NOT NULL IDENTITY,
Nombre varchar(30),
Descripcion varchar (250),
PRIMARY KEY (ID)
);

CREATE TABLE Producto(
ID int NOT NULL IDENTITY,
Nombre varchar(30),
Descripcion varchar(250),
PrecioUnitario float,
Categoria int,
PRIMARY KEY (ID),
FOREIGN KEY (Categoria) REFERENCES Categoria(ID)
);

CREATE TABLE Proveedor(
ID int NOT NULL IDENTITY,
Nombre varchar(30),
PRIMARY KEY (ID)
);

CREATE TABLE Localizacion(
ID int NOT NULL IDENTITY,
Coordenadas varchar (80),
Provincia varchar(30),
PRIMARY KEY (ID)
);

CREATE TABLE Almacen(
ID int NOT NULL IDENTITY,
Nombre varchar(30),
Proveedor int,
Localizacion int,
PRIMARY KEY(ID),
FOREIGN KEY (Proveedor) REFERENCES Proveedor(ID),
FOREIGN KEY (Localizacion) REFERENCES Localizacion(ID)
);

CREATE TABLE Provee(
ID INT NOT NULL IDENTITY,
Producto int ,
Proveedor int,
PRIMARY KEY (ID),
FOREIGN KEY (Producto) REFERENCES Producto(ID),
FOREIGN KEY (Proveedor) REFERENCES Proveedor(ID)
);

CREATE TABLE Departamento(
Numero int NOT NULL IDENTITY,
Nombre varchar(30),
FechaCreacion DATE,
PRIMARY KEY(Numero)
);

CREATE TABLE Empleado(
NSS INT NOT NULL IDENTITY,
Nombre varchar(25),
Apellido varchar(25),
Almacen int,
Departamento int,
PRIMARY KEY (NSS),
FOREIGN KEY (Almacen) REFERENCES Almacen(ID),
FOREIGN KEY (Departamento) REFERENCES Departamento(Numero)
);

CREATE TABLE Rol(
ID int NOT NULL IDENTITY,
Nombre varchar(30),
Descripcion varchar(250),
Salario float,
PRIMARY KEY(ID)
);

CREATE TABLE TieneRol(
ID INT NOT NULL IDENTITY,
Empleado INT,
Rol int,
PRIMARY KEY (ID),
FOREIGN KEY (Empleado) REFERENCES Empleado(NSS),
FOREIGN KEY (Rol) REFERENCES Rol(ID)
);
