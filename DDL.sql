DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE sucursal(
	idsucursal VARCHAR(10),
	nombre VARCHAR(50),
	fechaapertura date,
	horaapertura time,
	horacierre time,
	estado  VARCHAR(50),
	ciudad  VARCHAR(50),
	colonia  VARCHAR(50),
	calle  VARCHAR(50),
	numero INT,
	codigopostal INT
	
);

-- Restricciones sucursal

ALTER TABLE sucursal ALTER COLUMN idsucursal SET NOT NULL;
ALTER TABLE sucursal ADD CONSTRAINT idsucursalD1 CHECK (idsucursal SIMILAR TO 'S-[0-9]*');
ALTER TABLE sucursal ADD CONSTRAINT nombreD1 CHECK(nombre <> '');
ALTER TABLE sucursal ALTER COLUMN fechaapertura SET NOT NULL;
ALTER TABLE sucursal ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE sucursal ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE sucursal ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE sucursal ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal between 1 and 99999);
ALTER TABLE sucursal ADD CONSTRAiNT numeroD1 CHECK(numero between 10000 and 99999);

ALTER TABLE sucursal ADD CONSTRAINT idsucursalD2 UNIQUE(idsucursal);
ALTER TABLE sucursal ADD CONSTRAINT sucursal_pkey PRIMARY KEY (idsucursal);

CREATE TABLE telefonosucursal(
	idsucursal CHAR(18),
	telefono CHAR(10) 
);

--Restricciones telefono
--Dominio
ALTER TABLE telefonosucursal ALTER COLUMN idsucursal SET NOT NULL;
ALTER TABLE telefonosucursal ADD CONSTRAINT tidsucursalD1 CHECK (idsucursal SIMILAR TO 'S-[0-9]*');
ALTER TABLE telefonosucursal ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]*');

--Entidad
ALTER TABLE telefonosucursal ADD CONSTRAINT telefonosucursal_pkey PRIMARY KEY (idsucursal,telefono);

--Referencial
ALTER TABLE telefonosucursal ADD CONSTRAINT telefonosucursal_fkey FOREIGN KEY (idsucursal)
REFERENCES sucursal (idsucursal);

-----------------------------------------------------------------------------------------


CREATE TABLE cliente(
	curpcliente CHAR(18),
	nombrecliente VARCHAR(50),
	paternocliente VARCHAR(50),
	maternocliente VARCHAR(50),
	fechanacimiento date,
	estado  VARCHAR(50),
	ciudad  VARCHAR(50),
	colonia  VARCHAR(50),
	calle  VARCHAR(50),
	numero INT,
	codigopostal INT
	
);

-- Restricciones cliente

ALTER TABLE cliente ALTER COLUMN curpcliente SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT curpclienteD1 CHECK(CHAR_LENGTH(curpcliente)=18);
ALTER TABLE cliente ADD CONSTRAINT nombreclienteD1 CHECK(nombrecliente <> '');
ALTER TABLE cliente ADD CONSTRAINT paternoclienteD1 CHECK(paternocliente <>'');
ALTER TABLE cliente ADD CONSTRAINT maternoclienteD1 CHECK(maternocliente <>'');
ALTER TABLE cliente ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE cliente ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE cliente ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE cliente ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal between 1 and 99999);
ALTER TABLE cliente ADD CONSTRAiNT numeroD1 CHECK(numero between 10000 and 99999);

ALTER TABLE cliente ADD CONSTRAINT curpclienteD2 UNIQUE(curpcliente);
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey PRIMARY KEY (curpcliente);

CREATE TABLE telefonocliente(
	curpcliente CHAR(18),
	telefono CHAR(10) 
);

--Restricciones telefono
--Dominio
ALTER TABLE telefonocliente ALTER COLUMN curpcliente SET NOT NULL;
ALTER TABLE telefonocliente ADD CONSTRAINT tcurpclienteD1 CHECK(CHAR_LENGTH(curpcliente)=18);
ALTER TABLE telefonocliente ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]*');

--Entidad
ALTER TABLE telefonocliente ADD CONSTRAINT telefonocliente_pkey PRIMARY KEY (curpcliente,telefono);

--Referencial
ALTER TABLE telefonocliente ADD CONSTRAINT telefonocliente_fkey FOREIGN KEY (curpcliente)
REFERENCES cliente (curpcliente);

CREATE TABLE correocliente(
	curpcliente CHAR(18),
	correo VARCHAR(50) 
);


--Dominio
ALTER TABLE correocliente ALTER COLUMN curpcliente SET NOT NULL;
ALTER TABLE correocliente ADD CONSTRAINT ccurpclienteD1 CHECK(CHAR_LENGTH(curpcliente)=18);
ALTER TABLE correocliente ADD CONSTRAINT correoclienteD1 CHECK(correo <> '');

--Entidad
ALTER TABLE correocliente ADD CONSTRAINT correocliente_pkey PRIMARY KEY (curpcliente,correo);

--Referencial
ALTER TABLE correocliente ADD CONSTRAINT correocliente_fkey FOREIGN KEY (curpcliente)
REFERENCES cliente (curpcliente);


-----------------------------------------------------------------------------------------

CREATE TABLE cajero(
	curpcajero CHAR(18),
	idsucursal VARCHAR(10),
	nombrecajero VARCHAR(50),
	paternocajero VARCHAR(50),
	maternocajero VARCHAR(50),
	fechanacimiento date,
	estado  VARCHAR(50),
	ciudad  VARCHAR(50),
	colonia  VARCHAR(50),
	calle  VARCHAR(50),
	numero INT,
	codigopostal INT
	
);

-- Restricciones cajero

ALTER TABLE cajero ALTER COLUMN curpcajero SET NOT NULL;
ALTER TABLE cajero ADD CONSTRAINT curpcajeroD1 CHECK(CHAR_LENGTH(curpcajero)=18);
ALTER TABLE cajero ADD CONSTRAINT nombrecajeroD1 CHECK(nombrecajero <> '');
ALTER TABLE cajero ADD CONSTRAINT paternocajeroD1 CHECK(paternocajero <>'');
ALTER TABLE cajero ADD CONSTRAINT maternocajeroD1 CHECK(maternocajero <>'');
ALTER TABLE cajero ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE cajero ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE cajero ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE cajero ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE cajero ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal between 1 and 99999);
ALTER TABLE cajero ADD CONSTRAiNT numeroD1 CHECK(numero between 10000 and 99999);

--Entidad
ALTER TABLE cajero ADD CONSTRAINT curpcajeroD2 UNIQUE(curpcajero);
ALTER TABLE cajero ADD CONSTRAINT cajero_pkey PRIMARY KEY (curpcajero);

--Referencial
ALTER TABLE cajero ADD CONSTRAINT cajero_fkey FOREIGN KEY (idsucursal)
REFERENCES sucursal (idsucursal);

CREATE TABLE telefonocajero(
	curpcajero CHAR(18),
	telefono CHAR(10) 
);

--Restricciones telefono
--Dominio
ALTER TABLE telefonocajero ALTER COLUMN curpcajero SET NOT NULL;
ALTER TABLE telefonocajero ADD CONSTRAINT tcurpcajeroD1 CHECK(CHAR_LENGTH(curpcajero)=18);
ALTER TABLE telefonocajero ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]*');

--Entidad
ALTER TABLE telefonocajero ADD CONSTRAINT telefonocajero_pkey PRIMARY KEY (curpcajero,telefono);

--Referencial
ALTER TABLE telefonocajero ADD CONSTRAINT telefonocajero_fkey FOREIGN KEY (curpcajero)
REFERENCES cajero (curpcajero);

CREATE TABLE correocajero(
	curpcajero CHAR(18),
	correo VARCHAR(50) 
);

--Restricciones correo
--Dominio
ALTER TABLE correocajero ALTER COLUMN curpcajero SET NOT NULL;
ALTER TABLE correocajero ADD CONSTRAINT ccurpcajeroD1 CHECK(CHAR_LENGTH(curpcajero)=18);
ALTER TABLE correocajero ADD CONSTRAINT correocajeroD1 CHECK(correo <> '');

--Entidad
ALTER TABLE correocajero ADD CONSTRAINT correocajero_pkey PRIMARY KEY (curpcajero,correo);

--Referencial
ALTER TABLE correocajero ADD CONSTRAINT correocajero_fkey FOREIGN KEY (curpcajero)
REFERENCES cajero (curpcajero);


-----------------------------------------------------------------------------------------


CREATE TABLE encargado(
	curpencargado CHAR(18),
	nombreencargado VARCHAR(50),
	paternoencargado VARCHAR(50),
	maternoencargado VARCHAR(50),
	fechanacimiento date,
	estado  VARCHAR(50),
	ciudad  VARCHAR(50),
	colonia  VARCHAR(50),
	calle  VARCHAR(50),
	numero INT,
	codigopostal INT
	
);

-- Restricciones encargado

ALTER TABLE encargado ALTER COLUMN curpencargado SET NOT NULL;
ALTER TABLE encargado ADD CONSTRAINT curpencargadoD1 CHECK(CHAR_LENGTH(curpencargado)=18);
ALTER TABLE encargado ADD CONSTRAINT nombreencargadoD1 CHECK(nombreencargado <> '');
ALTER TABLE encargado ADD CONSTRAINT paternoencargadoD1 CHECK(paternoencargado <>'');
ALTER TABLE encargado ADD CONSTRAINT maternoencargadoD1 CHECK(maternoencargado <>'');
ALTER TABLE encargado ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE encargado ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE encargado ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE encargado ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE encargado ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal between 1 and 99999);
ALTER TABLE encargado ADD CONSTRAiNT numeroD1 CHECK(numero between 10000 and 99999);

--Entidad
ALTER TABLE encargado ADD CONSTRAINT curpencargadoD2 UNIQUE(curpencargado);
ALTER TABLE encargado ADD CONSTRAINT encargado_pkey PRIMARY KEY (curpencargado);

--Referencial
ALTER TABLE encargado ADD CONSTRAINT encargado_fkey FOREIGN KEY (idsucursal)
REFERENCES sucursal (idsucursal);

CREATE TABLE telefonoencargado(
	curpencargado CHAR(18),
	telefono CHAR(10) 
);

--Restricciones telefono
--Dominio
ALTER TABLE telefonoencargado ALTER COLUMN curpencargado SET NOT NULL;
ALTER TABLE telefonoencargado ADD CONSTRAINT tcurpencargadoD1 CHECK(CHAR_LENGTH(curpencargado)=18);
ALTER TABLE telefonoencargado ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]*');

--Entidad
ALTER TABLE telefonoencargado ADD CONSTRAINT telefonoencargado_pkey PRIMARY KEY (curpencargado,telefono);

--Referencial
ALTER TABLE telefonoencargado ADD CONSTRAINT telefonoencargado_fkey FOREIGN KEY (curpencargado)
REFERENCES encargado (curpencargado);

CREATE TABLE correoencargado(
	curpencargado CHAR(18),
	correo VARCHAR(50) 
);

--Restricciones correo
--Dominio
ALTER TABLE correoencargado ALTER COLUMN curpencargado SET NOT NULL;
ALTER TABLE correoencargado ADD CONSTRAINT ccurpencargadoD1 CHECK(CHAR_LENGTH(curpencargado)=18);
ALTER TABLE correoencargado ADD CONSTRAINT correoencargadoD1 CHECK(correo <> '');

--Entidad
ALTER TABLE correoencargado ADD CONSTRAINT correoencargado_pkey PRIMARY KEY (curpencargado,correo);

--Referencial
ALTER TABLE correoencargado ADD CONSTRAINT correoencargado_fkey FOREIGN KEY (curpencargado)
REFERENCES encargado (curpencargado);


-----------------------------------------------------------------------------------------


CREATE TABLE gerente(
	curpgerente CHAR(18),
	nombregerente VARCHAR(50),
	paternogerente VARCHAR(50),
	maternogerente VARCHAR(50),
	fechanacimiento date,
	estado  VARCHAR(50),
	ciudad  VARCHAR(50),
	colonia  VARCHAR(50),
	calle  VARCHAR(50),
	numero INT,
	codigopostal INT
	
);

-- Restricciones gerente

ALTER TABLE gerente ALTER COLUMN curpgerente SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT curpgerenteD1 CHECK(CHAR_LENGTH(curpgerente)=18);
ALTER TABLE gerente ADD CONSTRAINT nombregerenteD1 CHECK(nombregerente <> '');
ALTER TABLE gerente ADD CONSTRAINT paternogerenteD1 CHECK(paternogerente<>'');
ALTER TABLE gerente ADD CONSTRAINT maternogerenteD1 CHECK(maternogerente <>'');
ALTER TABLE gerente ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE gerente ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE gerente ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE gerente ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal between 1 and 99999);
ALTER TABLE gerente ADD CONSTRAiNT numeroD1 CHECK(numero between 10000 and 99999);

--Entidad
ALTER TABLE gerente ADD CONSTRAINT curpgerenteD2 UNIQUE(curpgerente);
ALTER TABLE gerente ADD CONSTRAINT gerente_pkey PRIMARY KEY (curpgerente);

--Referencial
ALTER TABLE gerente ADD CONSTRAINT gerente_fkey FOREIGN KEY (idsucursal)
REFERENCES sucursal (idsucursal);

CREATE TABLE telefonogerente(
	curpgerente CHAR(18),
	telefono CHAR(10) 
);

--Restricciones telefono
--Dominio
ALTER TABLE telefonogerente ALTER COLUMN curpgerente SET NOT NULL;
ALTER TABLE telefonogerente ADD CONSTRAINT tcurpegerenteD1 CHECK(CHAR_LENGTH(curpgerente)=18);
ALTER TABLE telefonogerente ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]*');

--Entidad
ALTER TABLE telefonogerente ADD CONSTRAINT telefonogerente_pkey PRIMARY KEY (curpgerente,telefono);

--Referencial
ALTER TABLE telefonogerente ADD CONSTRAINT telefonogerente_fkey FOREIGN KEY (curpgerente)
REFERENCES gerente (curpgerente);

CREATE TABLE correogerente(
	curpgerente CHAR(18),
	correo VARCHAR(50) 
);

--Restricciones correo
--Dominio
ALTER TABLE correogerente ALTER COLUMN curpgerente SET NOT NULL;
ALTER TABLE correogerente ADD CONSTRAINT ccurpgerenteD1 CHECK(CHAR_LENGTH(curpgerente)=18);
ALTER TABLE correogerente ADD CONSTRAINT correogerenteD1 CHECK(correo <> '');

--Entidad
ALTER TABLE correogerente ADD CONSTRAINT correogerente_pkey PRIMARY KEY (curpgerente,correo);

--Referencial
ALTER TABLE correogerente ADD CONSTRAINT correogerente_fkey FOREIGN KEY (curpgerente)
REFERENCES gerente (curpgerente);

----------------------------------------------------------------------------------------------------------

CREATE TABLE venta(
	idventa CHAR(10),
	fechaventa date,
	ticket  CHAR(10),
	formapago  CHAR(10)
);

-- Restricciones venta

ALTER TABLE venta ALTER COLUMN idventa SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT idventa1 CHECK(CHAR_LENGTH(idventa)=10);
ALTER TABLE venta ALTER COLUMN fechaventa SET NOT NULL;
ALTER TABLE venta ALTER COLUMN ticket SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT ticket1 CHECK(CHAR_LENGTH(ticket)=10);
ALTER TABLE venta ADD CONSTRAINT formapago1 CHECK(formapago <>'');

--Entidad
ALTER TABLE venta ADD CONSTRAINT idventa2 UNIQUE(idventa);
ALTER TABLE venta ADD CONSTRAINT venta_pkey PRIMARY KEY (idventa);

--Referencial
ALTER TABLE venta ADD CONSTRAINT venta_fkey FOREIGN KEY (idsucursal)
REFERENCES sucursal (idsucursal);

ALTER TABLE venta ADD CONSTRAINT venta_fkey FOREIGN KEY (curpcliente)
REFERENCES sucursal (curpcliente);

ALTER TABLE venta ADD CONSTRAINT venta_fkey FOREIGN KEY (curpcajero)
REFERENCES sucursal (curpcajero);

-------------------------------------------------------------------------------------------------------

CREATE TABLE electronica(
	idproductoe CHAR(10),
	nombre VARCHAR(50),
	marca VARCHAR(50),
	precio CHAR(10),
	cantidad INT,
	descripcion VARCHAR(50),
	categoria VARCHAR(50),
	consumowatts INT
);

--Restricciones de electronica