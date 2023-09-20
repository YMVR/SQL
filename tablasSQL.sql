
create table Categoria (
Id_categoria primary key not null,
nombre text
);
 drop table Cliente;  


create table Sucursal (
Id_sucursal primary key not null,
nombre text,
direccion text
);

create table Cliente (
Id_cliente primary key not null,
nombre text,
Telefono text
);

create table Orden (
Id_orden primary key not null,
Id_cliente text, 
Id_sucursal text, 
Fecha date,
Total integer,
constraint fk_cliente foreign key (Id_cliente) references Cliente (Id_cliente),
constraint fk_sucursal foreign key (Id_sucursal) references Sucursal (Id_sucursal)
);

create table producto (
Id_producto primary key not null,
nombre text,
marca text,
Id_categoria text,
precio_unitario integer,
constraint fk_categoria foreign key (Id_categoria) references Categoria (Id_categoria)
);

create table Item (
Id_item primary key not null,
Id_orden text,
Id_producto text,
monto_venta integer,
cantidad integer,
constraint fk_orden foreign key (Id_orden) references Orden (Id_orden)
constraint fk_producto foreign key (Id_producto) references producto (Id_producto)
);

create table Stock (
Id_stock serial primary key,
cantidad integer,
Id_sucursal int no null,
Id_producto int no null,
UNIQUE (Id_sucursal, Id_producto)
);

