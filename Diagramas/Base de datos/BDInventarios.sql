create database parcial1;
use parcial1;

create table if not exists inventario(
	codigo_inventario varchar(5),
    descripcion_inventario varchar(50),
    existencia_inventario varchar(20),
    precio_inventario varchar(10),
    estado_inventario varchar(1)
);
alter table inventario add constraint pk_inventario primary key (codigo_inventario);

create table if not exists proveedor(
	codigo_proveedor varchar(5),
    nombre_proveedor varchar(60),
    direccion_proveedors varchar(60),
    telefono_proveedors varchar(50),
    nit_proveedors varchar(10),
    estado_proveedor varchar(1)
);
alter table proveedor add constraint pk_proveedor primary key (codigo_proveedor);

create table if not exists compras(
	codigo_compra varchar(5),
    fk_codigoproveedor_compra varchar(5),
    fecha_compra varchar(10)
);
alter table compras add constraint pk_compras primary key (codigo_compra);

create table if not exists detallecompra(
	codigo_detallecompra varchar(5),
    fk_codigocompra_detallecompra varchar(5),
    fk_codigoinventario_detallecompra varchar(5),
	tipopago_compra	varchar(20),
    cantidad_detallecompra varchar(20)
);
alter table detallecompra add constraint pk_detallecompra primary key (codigo_detallecompra);

create table if not exists vendedores(
	codigo_vendedor varchar(5),
    nombre_vendedor	varchar(60),
    direccion_vendedor varchar(60),
    nit_vendedor int(20),
    estatus_vendedor varchar(1)
);
alter table vendedores add constraint pk_vendedores primary key (codigo_vendedor);

create table if not exists factura(
	codigo_factura varchar(5),
    fecha_emision_factura varchar(10),
    fk_codigovendedor_factura varchar(10),
    fecha_vencimiento_factura varchar(10),
    nombre_factura varchar(50),
    apellido_factura varchar(50),
    telefono_factura varchar(10),
    total_factura varchar(10),
    tipo_factura varchar(20), 
    tiempopago_factura varchar(50)
);
alter table factura add constraint pk_factura primary key (codigo_factura);

create table if not exists detallefactura(
	codigo_detallefactura varchar(5),
    fk_codigofactura_detallefactura	varchar(5),
    fk_codigoinventario_detallefactura varchar(5)
);
alter table detallefactura add constraint pk_detallefactura primary key (codigo_detallefactura);

alter table compras add constraint fk_comp_prov foreign key(fk_codigoproveedor_compra) references proveedor(codigo_proveedor);
alter table detallecompra add constraint fk_fk_deta_comp foreign key(fk_codigocompra_detallecompra) references compras(codigo_compra);
alter table detallecompra add constraint fk_pro_detc foreign key(fk_codigoinventario_detallecompra) references inventario(codigo_inventario);

alter table detallefactura add constraint fk_detall_fact foreign key(fk_codigofactura_detallefactura) references factura(codigo_factura);
alter table detallefactura add constraint fk_detall_inve foreign key(fk_codigoinventario_detallefactura) references inventario(codigo_inventario);
alter table factura add constraint fk_fac_vend foreign key (fk_codigovendedor_factura) references vendedores(codigo_vendedor);