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
    fechaCreacion date not null,
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
    idProveedor int not null,
    idCategoria int not null,
    primary key PK_idProducto (idProducto),
    constraint FK_Producto_Proveedor foreign key (idProveedor)
		references Proveedor(idProveedor),
	constraint FK_Producto_Categoria foreign key (idCategoria)
		references Categoria(idCategoria)
);

Create table Compra(
	idCompra int not null auto_increment,
    idProveedor int not null,
    fecha date not null,
    total decimal(10,2) not null,
    primary key PK_idCompra (idCompra),
    constraint FK_Compra_Proveedor foreign key (idProveedor)
		references Proveedor (idProveedor)
);

Create table DetalleCompra(
	idDetalleCompra int not null auto_increment,
    idCompra int not null,
    idProveedor int not null,
    idProducto int not null,
    cantidad int not null,
    primary key PK_idDetalleCompra (idDetalleCompra),
    constraint FK_DetalleCompra_Compra foreign key (idCompra)
		references Compra (idCompra),
	constraint FK_DetalleCompra_Proveedor foreign key (idProveedor)
		references Proveedor (idProveedor),
	constraint FK_DetalleCompra_Producto foreign key (idProducto)
		references Producto (idProducto)
);

Create table Venta(
	idVenta int not null auto_increment,
	idCliente int not null,
    fecha date not null,
    total decimal(10,2) not null,
    primary key PK_idVenta (idVenta),
    constraint FK_Venta_Cliente foreign key (idCliente)
		references Cliente (idCliente)
);

Create table DetalleVenta(
	idDetalleVenta int not null auto_increment,
	idVenta int not null,
	idCliente int not null,
    idProducto int not null,
    cantidad int not null,
    primary key PK_idDetalleVenta (idDetalleVenta),
    constraint FK_DetalleVenta_Venta foreign key (idVenta)
		references Venta (idVenta),
	constraint FK_DetalleVenta_Cliente foreign key (idCliente)
		references Cliente (idCliente),
    constraint FK_DetalleVenta_Producto foreign key (idProducto)
		references Producto (idProducto)
);

Create table PedidoCliente(
	idPedidoCliente int not null auto_increment,
    idCliente int not null,
    idProducto int not null,
    cantidad int not null,
    fecha date not null,
    total decimal(10,2) not null,
    primary key PK_idPedidoCliente (idPedidoCliente),
    constraint FK_PedidoCliente_Cliente foreign key (idCliente)
		references Cliente (idCliente),
    constraint FK_PedidoCliente_Producto foreign key (idProducto)
		references Producto (idProducto)    
);

Create table PedidoProveedor(
	idPedidoProveedor int not null auto_increment,
    idProveedor int not null,
    idProducto int not null,
    cantidad int not null,
    fecha date not null,
    total decimal(10,2) not null,
    primary key PK_idPedidoProveedor (idPedidoProveedor),
    constraint FK_PedidoProveedor_Proveedor foreign key (idProveedor)
		references Proveedor (idProveedor),
    constraint FK_PedidoProveedor_Producto foreign key (idProducto)
		references Producto (idProducto)    
);

Create table Inventario(
	idInventario int not null auto_increment,
    nombreInventario varchar(100) not null,
    idEstablecimiento int not null,
    idProducto int not null,
    stock int not null,
    primary key PK_idInventario (idInventario),
    constraint FK_Inventario_Establecimiento foreign key (idEstablecimiento)
		references Establecimiento (idEstablecimiento),
	constraint FK_Inventario_Producto foreign key (idProducto)
		references Producto (idProducto)
);

