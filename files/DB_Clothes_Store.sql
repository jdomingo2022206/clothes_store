Drop database if exists DB_TiendaRopa;
Create DataBase DB_TiendaRopa;
Use DB_TiendaRopa;

Create table Usuario(
	idUsuario int not null auto_increment,
    nombreUsuario varchar(100) not null,
    apellidoUsuario varchar(100) not null,
    usuario varchar(50) not null,
    clave varchar(50) not null,
    primary key PK_idUsuario (idUsuario)
);

Create table Login(
	idLogin int not null auto_increment,
    usuarioLogin varchar(50) not null,
    claveLogin varchar(50) not null,
    primary key PK_idLogin (idLogin)
);

Create table Proveedor(
	idProveedor int not null auto_increment,
    nombreProveedor varchar(100) not null,
    direccion varchar(150) not null,
    telefono varchar(10) not null,
    primary key PK_idProveedor (idProveedor)
);

Create table Categoria(
	idCategoria int not null auto_increment,
	nombreCategoria varchar (100) not null,
    descripcion varchar(150) not null,
    fechaCreacion varchar(150) not null,
    primary key PK_idCategoria (idCategoria)
);

Create table Cliente(
	idCliente int not null auto_increment,
    nombreCliente varchar(100) not null,
    apellidoCliente varchar(100) not null,
    direccion varchar(150) not null,
    telefono varchar(10) not null,
    primary key PK_idCliente (idCliente)
);

Create table Establecimiento(
	idEstablecimiento int not null auto_increment,
    nombreEstablecimiento varchar(100) not null,
    direccion varchar(150) not null,
    telefono varchar(10) not null,
    primary key PK_idEstablecimiento (idEstablecimiento)
);

Create table Producto(
	idProducto int not null auto_increment,
    nombreProducto varchar(100) not null,
    descripcion varchar(150) not null,
    precio decimal(6,2) not null,
    imagen varchar(255),
    idProveedor int not null,
    idCategoria int not null,
    primary key PK_idProducto (idProducto),
    constraint FK_Producto_Proveedor foreign key (idProveedor)
		references Proveedor(idProveedor) on delete cascade,
	constraint FK_Producto_Categoria foreign key (idCategoria)
		references Categoria(idCategoria) on delete cascade
);

Create table Compra(
	idCompra int not null auto_increment,
    idProveedor int not null,
    fecha varchar(150) not null,
    total decimal(10,2) not null,
    primary key PK_idCompra (idCompra),
    constraint FK_Compra_Proveedor foreign key (idProveedor)
		references Proveedor (idProveedor) on delete cascade
);

Create table DetalleCompra(
	idDetalleCompra int not null auto_increment,
    idCompra int not null,
    idProveedor int not null,
    idProducto int not null,
    cantidad int not null,
    primary key PK_idDetalleCompra (idDetalleCompra),
    constraint FK_DetalleCompra_Compra foreign key (idCompra)
		references Compra (idCompra) on delete cascade,
	constraint FK_DetalleCompra_Proveedor foreign key (idProveedor)
		references Proveedor (idProveedor) on delete cascade,
	constraint FK_DetalleCompra_Producto foreign key (idProducto)
		references Producto (idProducto)on delete cascade
);

Create table Venta(
	idVenta int not null auto_increment,
	idCliente int not null,
    fecha varchar(150) not null,
    total decimal(10,2) not null,
	idProducto int not null,
    cantidad int not null,
    primary key PK_idVenta (idVenta),
    constraint FK_Venta_Cliente foreign key (idCliente)
		references Cliente (idCliente) on delete cascade,
    constraint FK_Venta_Producto foreign key (idProducto)
		references Producto (idProducto) on delete cascade
);

Create table PedidoCliente(
	idPedidoCliente int not null auto_increment,
    idCliente int not null,
    idProducto int not null,
    cantidad int not null,
    fecha varchar(150) not null,
    total decimal(10,2) not null,
    primary key PK_idPedidoCliente (idPedidoCliente),
    constraint FK_PedidoCliente_Cliente foreign key (idCliente)
		references Cliente (idCliente) on delete cascade,
    constraint FK_PedidoCliente_Producto foreign key (idProducto)
		references Producto (idProducto)on delete cascade    
);

Create table PedidoProveedor(
	idPedidoProveedor int not null auto_increment,
    idProveedor int not null,
    idProducto int not null,
    cantidad int not null,
    fecha varchar(150) not null,
    total decimal(10,2) not null,
    primary key PK_idPedidoProveedor (idPedidoProveedor),
    constraint FK_PedidoProveedor_Proveedor foreign key (idProveedor)
		references Proveedor (idProveedor) on delete cascade,
    constraint FK_PedidoProveedor_Producto foreign key (idProducto)
		references Producto (idProducto) on delete cascade   
);

Create table Inventario(
	idInventario int not null auto_increment,
    nombreInventario varchar(100) not null,
    idEstablecimiento int not null,
    idProducto int not null,
    stock int not null,
    primary key PK_idInventario (idInventario),
    constraint FK_Inventario_Establecimiento foreign key (idEstablecimiento)
		references Establecimiento (idEstablecimiento) on delete cascade,
	constraint FK_Inventario_Producto foreign key (idProducto)
		references Producto (idProducto) on delete cascade
);

-- TUPLAS DE LA ENTIDAD USUARIO --

describe Usuario;

insert into Usuario (nombreUsuario, apellidoUsuario, usuario, clave) values('Yojhan', 'Garcia', 'ygarcia', '12345');
insert into Usuario (nombreUsuario, apellidoUsuario, usuario, clave) values('Gary', 'Galindo', 'ggalindo', '54321');
insert into Usuario (nombreUsuario, apellidoUsuario, usuario, clave) values('Juan', 'Galicia', 'jgalicia', '11111');
insert into Usuario (nombreUsuario, apellidoUsuario, usuario, clave) values('Cecar', 'Escriba', 'cescriba', '22222');
insert into Usuario (nombreUsuario, apellidoUsuario, usuario, clave) values('Gerson', 'Chuquiej', 'gchuquiej', '33333');
insert into Usuario (nombreUsuario, apellidoUsuario, usuario, clave) values('Jonathan', 'Domingo', 'jdomiengo', '44444');

select * from usuario;

-- TUPLAS DE LA ENTIDAD PROVEEDOR --

describe Proveedor;

insert into Proveedor (nombreProveedor, direccion, telefono) values('Sara', 'Ciudad De Guatemala','12345678');
insert into Proveedor (nombreProveedor, direccion, telefono) values('Pull and Bear', 'Zona 11, Ciudad De Guatemala','11223344');
insert into Proveedor (nombreProveedor, direccion, telefono) values('Calvin Klein', '3ra Calle Poniente, Antigua Guatemala','12123232');
insert into Proveedor (nombreProveedor, direccion, telefono) values('Bershka', 'San Lucas Sacatepéquez','45456363');
insert into Proveedor (nombreProveedor, direccion, telefono) values('Forever 21', 'Zona 9, Ciudad De Guatemala','11112222');

select * from Proveedor;

-- TUPLAS DE LA ENTIDAD CATEGORÍA --

describe Categoria;

insert into Categoria (nombreCategoria, descripcion, fechaCreacion) values('Ropa de Caballero', 'Ropa de todo tipo de caballero',now());
insert into Categoria (nombreCategoria, descripcion, fechaCreacion) values('Ropa de Dama', 'Ropa de todo tipo de dama', '2023-08-20');
insert into Categoria (nombreCategoria, descripcion, fechaCreacion) values('Ropa de niño', 'Ropa de todo tipo de niño', '2022-10-29');
insert into Categoria (nombreCategoria, descripcion, fechaCreacion) values('Sport', 'Ropa deportiva para todo tipo de persona', '2020-11-30');
insert into Categoria (nombreCategoria, descripcion, fechaCreacion) values('Ropa Casual', 'Ropa casual de todo tipo','2022-11-25');

select * from Categoria;

-- TUPLAS DE LA ENTIDAD CLIENTE --

describe Cliente;

insert into Cliente (nombreCliente, apellidoCliente, direccion, telefono) values('Josue', 'Ambrocio', 'Ciudad San Cristobal', '14253614');
insert into Cliente (nombreCliente, apellidoCliente, direccion, telefono) values('Jose', 'Ceferino', 'Carretera Al Salvador, Guatemala', '10102020');
insert into Cliente (nombreCliente, apellidoCliente, direccion, telefono) values('Diego', 'Arreola', 'Zona 1, Ciudad De Guatemala', '20203030');
insert into Cliente (nombreCliente, apellidoCliente, direccion, telefono) values('Jose', 'Chanquin', 'Zona 18, Ciudad de Guatemala', '15152525');
insert into Cliente (nombreCliente, apellidoCliente, direccion, telefono) values('Edwar', 'Chamale', 'Zona 7, Ciudad de Guatemala', '14253614');

select * from Cliente;

-- TUPLAS DE LA ENTIDAD ESTABLECIMIENTO --
INSERT INTO Establecimiento (nombreEstablecimiento, direccion, telefono) VALUES
('Restaurante La Cocina del Chef', 'Calle Principal #123', '1234567890'),
('Hotel Sol y Playa', 'Avenida Costera #45', '9876543210'),
('Tienda de Ropa Moda Elegante', 'Plaza Central #56', '5551212121'),
('Farmacia Salud y Bienestar', 'Calle de la Salud #789', '7773334444'),
('Gimnasio Activo Fit', 'Avenida Deportiva #12', '9998887777');



describe Establecimiento;


-- TUPLAS DE LA ENTIDAD PRODUCTO --

	INSERT INTO Producto (nombreProducto, descripcion, precio,imagen, idProveedor, idCategoria)
		VALUES
		('Camiseta de algodón', 'Camiseta de algodón de alta calidad', 19.99, 'img/asd.jpg', 1, 1),
		('Camiseta de algodón', 'Camiseta de algodón de alta calidad', 19.99, 'img/ClothesStore1.png', 1, 1);
		/*('Jeans ajustados', 'Jeans ajustados para hombre', 39.99, 2, 2),
		('Vestido de noche', 'Elegante vestido de noche para mujer', 59.99, 3, 2),
		('Zapatos deportivos', 'Zapatos deportivos para correr', 49.99, 4, 4),
		('Bolsa de cuero', 'Bolsa de cuero genuino', 79.99, 5, 5);*/

	select * from Producto;
-- TUPLAS DE LA ENTIDAD COMPRA --
	INSERT INTO Compra (idProveedor, fecha, total)
		VALUES
		(1, '2023-08-01', 300.00),
		(2, '2023-08-02', 250.00),
		(3, '2023-08-03', 180.00),
		(4, '2023-08-04', 220.00),
		(5, '2023-08-05', 400.00);
        
	select * from Compra;
        
-- TUPLAS DE LA ENTIDAD DETALLE COMPRA --
	INSERT INTO DetalleCompra (idCompra, idProveedor, idProducto, cantidad)
		VALUES
		(1, 1, 1, 10),
		(2, 2, 1, 5),
		(3, 3, 1, 4),
		(4, 4, 1, 7),
		(5, 5, 1, 12);
 
 
-- TUPLAS DE LA ENTIDAD VENTA --
	INSERT INTO Venta (idCliente, fecha, total ,idProducto ,cantidad)
		VALUES
		(1, '2023-08-01', 350.00, 1, 5),
		(2, '2023-08-02', 280.00, 1, 10),
		(3, '2023-08-03', 210.00, 1, 15),
		(4, '2023-08-04', 150.00, 1, 9),
		(4, '2023-08-05', 420.00, 1, 10);

-- TUPLAS DE LA ENTIDAD PEDIDO CLIENTE --
	INSERT INTO PedidoCliente (idCliente, idProducto, cantidad, fecha, total)
		VALUES
		(1, 1, 2, '2023-08-10', 39.98),
		(2, 1, 3, '2023-08-11', 89.97),
		(3, 1, 1, '2023-08-12', 19.99),
		(4, 1, 5, '2023-08-13', 149.95),
		(5, 1, 4, '2023-08-14', 199.96);
        
-- TUPLAS DE LA ENTIDAD PEDIDO PROVEEDOR --
	INSERT INTO PedidoProveedor (idProveedor, idProducto, cantidad, fecha, total)
		VALUES
		(1, 1, 100, '2023-08-10', 1999.00),
		(2, 1, 50, '2023-08-11', 1499.50),
		(3, 1, 75, '2023-08-12', 2999.25),
		(4, 1, 200, '2023-08-13', 4999.00),
		(5, 1, 150, '2023-08-14', 7499.50);
        
	select * from PedidoProveedor;
	select * from PedidoCliente;
        
-- TABLA DE LA ENTIDAD INVENTARIO --
	INSERT INTO Inventario (nombreInventario, idEstablecimiento, idProducto, stock)
		VALUES
		('Inventario1', 1, 1, 50),
		('Inventario2', 2, 2, 75),
		('Inventario3', 3, 1, 30),
		('Inventario4', 4, 2, 100),
		('Inventario5', 5, 1, 60);