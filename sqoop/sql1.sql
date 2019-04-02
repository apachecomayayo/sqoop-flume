create database miTienda;

create table if not exists miTienda.compras (
	id_compra INT AUTO_INCREMENT,
	id_producto INT NOT NULL,
	desc_producto VARCHAR(255) NOT NULL,
	color VARCHAR(255) NOT NULL,
	precio INT NOT NULL,
	hora TIMESTAMP DEFAULT NOW()
);

insert into miTienda.compras (id_producto, desc_producto, color, precio) values (1, "CAMISA CUADROS", "ROJO", 20);
insert into miTienda.compras (id_producto, desc_producto, color, precio) values (2, "CAMISA CUADROS", "AZUL", 20);
insert into miTienda.compras (id_producto, desc_producto, color, precio) values (3, "CAMISETA BASICA", "AZUL", 10);
insert into miTienda.compras (id_producto, desc_producto, color, precio) values (4, "CAMISETA BASICA", "VERDE", 10);
insert into miTienda.compras (id_producto, desc_producto, color, precio) values (3, "CAMISETA BASICA", "AZUL", 10);
insert into miTienda.compras (id_producto, desc_producto, color, precio) values (5, "CAMISA LISA", "AZUL", 25);
insert into miTienda.compras (id_producto, desc_producto, color, precio) values (6, "VAQUEROS", "AZUL", 30);
insert into miTienda.compras (id_producto, desc_producto, color, precio) values (6, "VAQUEROS", "AZUL", 30);
insert into miTienda.compras (id_producto, desc_producto, color, precio) values (7, "PANTALONES", "AZUL", 35);
insert into miTienda.compras (id_producto, desc_producto, color, precio) values (2, "CAMISA CUADROS", "AZUL", 20);
