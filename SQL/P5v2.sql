
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
	codigopostal CHAR(5)
	
);

-- Restricciones sucursal

ALTER TABLE sucursal ALTER COLUMN idsucursal SET NOT NULL;
ALTER TABLE sucursal ADD CONSTRAINT idsucursalD1 CHECK (idsucursal SIMILAR TO 'S-[0-9]*');
ALTER TABLE sucursal ADD CONSTRAINT nombreD1 CHECK(nombre <> '');
ALTER TABLE sucursal ALTER COLUMN fechaapertura SET NOT NULL;
ALTER TABLE sucursal ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE sucursal ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE sucursal ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE sucursal ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal SIMILAR TO '[0-9]{5}');
ALTER TABLE sucursal ADD CONSTRAiNT numeroD1 CHECK(numero between 0 and 99999);
--Entidad 
ALTER TABLE sucursal ADD CONSTRAINT idsucursalD2 UNIQUE(idsucursal);
ALTER TABLE sucursal ADD CONSTRAINT sucursal_pkey PRIMARY KEY (idsucursal);

CREATE TABLE telefonosucursal(
	idsucursal VARCHAR(10),
	telefono CHAR(10) 
);

--Restricciones telefono
--Dominio
ALTER TABLE telefonosucursal ALTER COLUMN idsucursal SET NOT NULL;
ALTER TABLE telefonosucursal ADD CONSTRAINT tidsucursalD1 CHECK (idsucursal SIMILAR TO 'S-[0-9]*');
ALTER TABLE telefonosucursal ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]{10}');

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
	codigopostal CHAR(5)
	
);

-- Restricciones cliente

ALTER TABLE cliente ALTER COLUMN curpcliente SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT curpclienteD1 CHECK(CHAR_LENGTH(curpcliente)=18);
ALTER TABLE cliente ADD CONSTRAINT curpclienteD2 CHECK(curpcliente SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');
ALTER TABLE cliente ADD CONSTRAINT nombreclienteD1 CHECK(nombrecliente <> '');
ALTER TABLE cliente ADD CONSTRAINT paternoclienteD1 CHECK(paternocliente <>'');
ALTER TABLE cliente ADD CONSTRAINT maternoclienteD1 CHECK(maternocliente <>'');
ALTER TABLE cliente ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE cliente ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE cliente ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE cliente ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal SIMILAR TO '[0-9]{5}');
ALTER TABLE cliente ADD CONSTRAiNT numeroD1 CHECK(numero between 0 and 99999);

ALTER TABLE cliente ADD CONSTRAINT curpclienteD3 UNIQUE(curpcliente);
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey PRIMARY KEY (curpcliente);

CREATE TABLE telefonocliente(
	curpcliente CHAR(18),
	telefono CHAR(10) 
);

--Restricciones telefono
--Dominio
ALTER TABLE telefonocliente ALTER COLUMN curpcliente SET NOT NULL;
ALTER TABLE telefonocliente ADD CONSTRAINT tcurpclienteD1 CHECK(CHAR_LENGTH(curpcliente)=18);
ALTER TABLE telefonocliente ADD CONSTRAINT tcurpclienteD2 CHECK(curpcliente SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');
ALTER TABLE telefonocliente ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]{10}');

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
ALTER TABLE correocliente ADD CONSTRAINT ccurpclienteD2 CHECK(curpcliente SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');

ALTER TABLE correocliente ADD CONSTRAINT correoclienteD1 CHECK(correo LIKE '_%@_%._%');

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
	codigopostal CHAR(5)
	
);

-- Restricciones cajero

ALTER TABLE cajero ALTER COLUMN curpcajero SET NOT NULL;
ALTER TABLE cajero ADD CONSTRAINT curpcajeroD1 CHECK(CHAR_LENGTH(curpcajero)=18);
ALTER TABLE cajero ADD CONSTRAINT curpcajeroD2 CHECK(curpcajero SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');

ALTER TABLE cajero ADD CONSTRAINT nombrecajeroD1 CHECK(nombrecajero <> '');
ALTER TABLE cajero ADD CONSTRAINT paternocajeroD1 CHECK(paternocajero <>'');
ALTER TABLE cajero ADD CONSTRAINT maternocajeroD1 CHECK(maternocajero <>'');
ALTER TABLE cajero ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE cajero ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE cajero ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE cajero ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE cajero ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal SIMILAR TO '[0-9]{5}');
ALTER TABLE cajero ADD CONSTRAiNT numeroD1 CHECK(numero between 0 and 99999);

--Entidad
ALTER TABLE cajero ADD CONSTRAINT curpcajeroD3 UNIQUE(curpcajero);
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
ALTER TABLE telefonocajero ADD CONSTRAINT tcurpcajeroD2 CHECK(curpcajero SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');

ALTER TABLE telefonocajero ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]{10}');

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
ALTER TABLE correocajero ADD CONSTRAINT ccurpcajeroD2 CHECK(curpcajero SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');
ALTER TABLE correocajero ADD CONSTRAINT correocajeroD1 CHECK(correo LIKE '_%@_%._%');

--Entidad
ALTER TABLE correocajero ADD CONSTRAINT correocajero_pkey PRIMARY KEY (curpcajero,correo);

--Referencial
ALTER TABLE correocajero ADD CONSTRAINT correocajero_fkey FOREIGN KEY (curpcajero)
REFERENCES cajero (curpcajero);


-----------------------------------------------------------------------------------------

CREATE TABLE encargado(
	curpencargado CHAR(18),
	idsucursal VARCHAR(10),
	nombreencargado VARCHAR(50),
	paternoencargado VARCHAR(50),
	maternoencargado VARCHAR(50),
	fechanacimiento date,
	estado  VARCHAR(50),
	ciudad  VARCHAR(50),
	colonia  VARCHAR(50),
	calle  VARCHAR(50),
	numero INT,
	codigopostal CHAR(5)
	
);

-- Restricciones encargado

ALTER TABLE encargado ALTER COLUMN curpencargado SET NOT NULL;
ALTER TABLE encargado ADD CONSTRAINT curpencargadoD1 CHECK(CHAR_LENGTH(curpencargado)=18);
ALTER TABLE encargado ADD CONSTRAINT curpencargadoD2 CHECK(curpencargado SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');
ALTER TABLE encargado ADD CONSTRAINT nombreencargadoD1 CHECK(nombreencargado <> '');
ALTER TABLE encargado ADD CONSTRAINT paternoencargadoD1 CHECK(paternoencargado <>'');
ALTER TABLE encargado ADD CONSTRAINT maternoencargadoD1 CHECK(maternoencargado <>'');
ALTER TABLE encargado ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE encargado ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE encargado ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE encargado ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE encargado ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal SIMILAR TO '[0-9]{5}');
ALTER TABLE encargado ADD CONSTRAiNT numeroD1 CHECK(numero between 0 and 99999);

--Entidad
ALTER TABLE encargado ADD CONSTRAINT curpencargadoD3 UNIQUE(curpencargado);
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
ALTER TABLE telefonoencargado ADD CONSTRAINT tcurpencargadoD2 CHECK(curpencargado SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');
ALTER TABLE telefonoencargado ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]{10}');

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
ALTER TABLE correoencargado ADD CONSTRAINT ccurpencargadoD2 CHECK(curpencargado SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');
ALTER TABLE correoencargado ADD CONSTRAINT correoencargadoD1 CHECK(correo LIKE '_%@_%._%');

--Entidad
ALTER TABLE correoencargado ADD CONSTRAINT correoencargado_pkey PRIMARY KEY (curpencargado,correo);

--Referencial
ALTER TABLE correoencargado ADD CONSTRAINT correoencargado_fkey FOREIGN KEY (curpencargado)
REFERENCES encargado (curpencargado);


-----------------------------------------------------------------------------------------


CREATE TABLE gerente(
	curpgerente CHAR(18),
	idsucursal VARCHAR(10),
	nombregerente VARCHAR(50),
	paternogerente VARCHAR(50),
	maternogerente VARCHAR(50),
	fechanacimiento date,
	estado  VARCHAR(50),
	ciudad  VARCHAR(50),
	colonia  VARCHAR(50),
	calle  VARCHAR(50),
	numero INT,
	codigopostal CHAR(5)
	
);

-- Restricciones gerente

ALTER TABLE gerente ALTER COLUMN curpgerente SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT curpgerenteD1 CHECK(CHAR_LENGTH(curpgerente)=18);
ALTER TABLE gerente ADD CONSTRAINT curpgerenteD2 CHECK(curpgerente SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');
ALTER TABLE gerente ADD CONSTRAINT nombregerenteD1 CHECK(nombregerente <> '');
ALTER TABLE gerente ADD CONSTRAINT paternogerenteD1 CHECK(paternogerente<>'');
ALTER TABLE gerente ADD CONSTRAINT maternogerenteD1 CHECK(maternogerente <>'');
ALTER TABLE gerente ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE gerente ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE gerente ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE gerente ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal SIMILAR TO '[0-9]{5}');
ALTER TABLE gerente ADD CONSTRAiNT numeroD1 CHECK(numero between 0 and 99999);

--Entidad
ALTER TABLE gerente ADD CONSTRAINT curpgerenteD3 UNIQUE(curpgerente);
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
ALTER TABLE telefonogerente ADD CONSTRAINT tcurpgerenteD2 CHECK(curpgerente SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');
ALTER TABLE telefonogerente ADD CONSTRAINT telefonoD1 CHECK (telefono SIMILAR TO '[0-9]{10}');

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
ALTER TABLE correogerente ADD CONSTRAINT ccurpgerenteD2 CHECK(curpgerente SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');

ALTER TABLE correogerente ADD CONSTRAINT correogerenteD1 CHECK(correo LIKE '_%@_%._%');

--Entidad
ALTER TABLE correogerente ADD CONSTRAINT correogerente_pkey PRIMARY KEY (curpgerente,correo);

--Referencial
ALTER TABLE correogerente ADD CONSTRAINT correogerente_fkey FOREIGN KEY (curpgerente)
REFERENCES gerente (curpgerente);

----------------------------------------------------------------------------------------------------------

CREATE TABLE venta(
	idventa CHAR(10),
	idsucursal VARCHAR(10),
	curpcliente CHAR(18),
	curpcajero CHAR(18),
	fechaventa date,
	ticket  CHAR(10),
	formapago  CHAR(10)
);

-- Restricciones venta

ALTER TABLE venta ALTER COLUMN idventa SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT idventa1 CHECK(idventa SIMILAR TO 'V-[0-9]*');
ALTER TABLE venta ALTER COLUMN idsucursal SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT idsucursalD1 CHECK (idsucursal SIMILAR TO 'S-[0-9]*');
ALTER TABLE venta ALTER COLUMN curpcliente SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT curpclienteD1 CHECK(CHAR_LENGTH(curpcliente)=18);
ALTER TABLE venta ADD CONSTRAINT curpclienteD2 CHECK(curpcliente SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');
ALTER TABLE venta ALTER COLUMN curpcajero SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT curpcajeroD1 CHECK(CHAR_LENGTH(curpcajero)=18);
ALTER TABLE venta ADD CONSTRAINT curpcajeroD2 CHECK(curpcajero SIMILAR TO '[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9]{2}');

ALTER TABLE venta ALTER COLUMN fechaventa SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT fechaventa1 CHECK(EXTRACT (years FROM age(CURRENT_DATE,fechaventa))>=23);
ALTER TABLE venta ALTER COLUMN ticket SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT ticket1 CHECK(CHAR_LENGTH(ticket)=10);
ALTER TABLE venta ADD CONSTRAINT formapago1 CHECK(formapago <>'');

--Entidad
ALTER TABLE venta ADD CONSTRAINT idventa2 UNIQUE(idventa);
ALTER TABLE venta ADD CONSTRAINT venta_pkey PRIMARY KEY (idventa);

--Referencial
ALTER TABLE venta ADD CONSTRAINT venta_fkey1 FOREIGN KEY (idsucursal)
REFERENCES sucursal (idsucursal);

ALTER TABLE venta ADD CONSTRAINT venta_fkey2 FOREIGN KEY (curpcliente)
REFERENCES cliente (curpcliente);

ALTER TABLE venta ADD CONSTRAINT venta_fkey3 FOREIGN KEY (curpcajero)
REFERENCES cajero (curpcajero);

-------------------------------------------------------------------------------------------------------

CREATE TABLE electronica(
	idproductoe CHAR(10),
	nombre VARCHAR(50),
	marca VARCHAR(50),
	precio INT,
	cantidad INT,
	descripcion VARCHAR(50),
	categoria VARCHAR(50),
	consumowatts INT
);

--Restricciones de electronica

ALTER TABLE electronica ALTER COLUMN idproductoe SET NOT NULL;
ALTER TABLE electronica ADD CONSTRAINT idproductoe1 CHECK(idproductoe SIMILAR TO 'E-[0-9]*');
ALTER TABLE electronica ADD CONSTRAINT nombreE1 CHECK(nombre <> '');
ALTER TABLE electronica ADD CONSTRAINT marcaE1 CHECK(marca<>'');
ALTER TABLE electronica ADD CONSTRAiNT precioE1 CHECK(precio between 0 and 99999);
ALTER TABLE electronica ADD CONSTRAiNT cantidadE1 CHECK(cantidad between 1 and 99999);
ALTER TABLE electronica ADD CONSTRAINT descripcionE1 CHECK(descripcion <>'');
ALTER TABLE electronica ADD CONSTRAINT categoriaE1 CHECK(categoria <>'');
ALTER TABLE electronica ADD CONSTRAiNT consumowatts1 CHECK(consumowatts between 0 and 99999);

--Entidad

ALTER TABLE electronica ADD CONSTRAINT idproductoe2 UNIQUE(idproductoe);
ALTER TABLE electronica ADD CONSTRAINT electronica_pkey PRIMARY KEY (idproductoe);



CREATE TABLE perecedero(
	idproductop CHAR(10),
	nombre VARCHAR(50),
	marca VARCHAR(50),
	precio INT,
	cantidad INT,
	descripcion VARCHAR(50),
	presentacion VARCHAR(50),
	fechapreparado date,
	fechacadcorta date,
	tiporefrigeracion VARCHAR(50)
);

--Restricciones de perecedero

ALTER TABLE perecedero ALTER COLUMN idproductop SET NOT NULL;
ALTER TABLE perecedero ADD CONSTRAINT idproductop1 CHECK(idproductop SIMILAR TO 'P-[0-9]*');
ALTER TABLE perecedero ADD CONSTRAINT nombreP1 CHECK(nombre <> '');
ALTER TABLE perecedero ADD CONSTRAINT marcaP1 CHECK(marca<>'');
ALTER TABLE perecedero ADD CONSTRAiNT precioP1 CHECK(precio between 0 and 99999);
ALTER TABLE perecedero ADD CONSTRAiNT cantidadP1 CHECK(cantidad between 1 and 99999);
ALTER TABLE perecedero ADD CONSTRAINT descripcionP1 CHECK(descripcion <>'');
ALTER TABLE perecedero ADD CONSTRAINT presentacionP1 CHECK(presentacion<>'');
ALTER TABLE perecedero ALTER COLUMN fechapreparado SET NOT NULL;
ALTER TABLE perecedero ALTER COLUMN fechacadcorta SET NOT NULL;
ALTER TABLE perecedero ADD CONSTRAINT tiporefrigeracionP1 CHECK(tiporefrigeracion<>'');


--Entidad

ALTER TABLE perecedero ADD CONSTRAINT idproductop2 UNIQUE(idproductop);
ALTER TABLE perecedero ADD CONSTRAINT perecedero_pkey PRIMARY KEY (idproductop);


------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE noperecedero(
	idproductonp CHAR(10),
	nombre VARCHAR(50),
	marca VARCHAR(50),
	precio INT,
	cantidad INT,
	descripcion VARCHAR(50),
	presentacion VARCHAR(50),
	fechapreparado date,
	fechacadlarga date,
	condicionalmacenamiento VARCHAR(50)
);

--Restricciones de noperecedero

ALTER TABLE noperecedero ALTER COLUMN idproductonp SET NOT NULL;
ALTER TABLE noperecedero ADD CONSTRAINT idproductonp1 CHECK(idproductonp SIMILAR TO 'NP-[0-9]*');
ALTER TABLE noperecedero ADD CONSTRAINT nombreNP1 CHECK(nombre <> '');
ALTER TABLE noperecedero ADD CONSTRAINT marcaNP1 CHECK(marca<>'');
ALTER TABLE noperecedero ADD CONSTRAiNT precioNP1 CHECK(precio between 0 and 99999);
ALTER TABLE noperecedero ADD CONSTRAiNT cantidadNP1 CHECK(cantidad between 1 and 99999);
ALTER TABLE noperecedero ADD CONSTRAINT descripcionNP1 CHECK(descripcion <>'');
ALTER TABLE noperecedero ADD CONSTRAINT presentacionNP1 CHECK(presentacion<>'');
ALTER TABLE noperecedero ALTER COLUMN fechapreparado SET NOT NULL;
ALTER TABLE noperecedero ALTER COLUMN fechacadlarga SET NOT NULL;
ALTER TABLE noperecedero ADD CONSTRAINT condicionalmacenamientoNP1 CHECK(condicionalmacenamiento<>'');


--Entidad

ALTER TABLE noperecedero ADD CONSTRAINT idproductonp2 UNIQUE(idproductonp);
ALTER TABLE noperecedero ADD CONSTRAINT noperecedero_pkey PRIMARY KEY (idproductonp);



------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE poseerp(
	idsucursal VARCHAR(10),
    idproductop CHAR(10),
    cantidadestock INT 
);

-- Restricciones poseerp
ALTER TABLE poseerp ALTER COLUMN idsucursal SET NOT NULL;
ALTER TABLE poseerp ADD CONSTRAINT idsucursalD1 CHECK (idsucursal SIMILAR TO 'S-[0-9]*');
ALTER TABLE poseerp ALTER COLUMN idproductop SET NOT NULL;
ALTER TABLE poseerp ADD CONSTRAINT idproductop1 CHECK(idproductop SIMILAR TO 'P-[0-9]*');
ALTER TABLE poseerp ADD CONSTRAINT cantidadestock1 CHECK(cantidadestock BETWEEN 1 AND 99999);

-- Entidad
ALTER TABLE poseerp ADD CONSTRAINT poseerp_pkey PRIMARY KEY (idsucursal,idproductop);

-- Referencial
ALTER TABLE poseerp ADD CONSTRAINT poseerp_fkey1 FOREIGN KEY (idsucursal)
REFERENCES sucursal (idsucursal);

ALTER TABLE poseerp ADD CONSTRAINT poseerp_fkey2 FOREIGN KEY (idproductop) 
REFERENCES perecedero (idproductop);

CREATE TABLE poseernp(
	idsucursal VARCHAR(10),
    idproductonp CHAR(10),
    cantidadestock INT 
);

-- Restricciones poseernp
ALTER TABLE poseernp ALTER COLUMN idsucursal SET NOT NULL;
ALTER TABLE poseernp ADD CONSTRAINT idsucursalD1 CHECK (idsucursal SIMILAR TO 'S-[0-9]*');
ALTER TABLE poseernp ALTER COLUMN idproductonp SET NOT NULL;
ALTER TABLE poseernp ADD CONSTRAINT idproductonp1 CHECK(idproductonp SIMILAR TO 'NP-[0-9]*');
ALTER TABLE poseernp ADD CONSTRAINT cantidadestock1 CHECK(cantidadestock BETWEEN 1 AND 99999);

-- Entidad
ALTER TABLE poseernp ADD CONSTRAINT poseernp_pkey PRIMARY KEY (idsucursal,idproductonp);

-- Referencial
ALTER TABLE poseernp ADD CONSTRAINT poseernp_fkey1 FOREIGN KEY (idsucursal)
REFERENCES sucursal (idsucursal);

ALTER TABLE poseernp ADD CONSTRAINT poseernp_fkey2 FOREIGN KEY (idproductonp) 
REFERENCES noperecedero (idproductonp);

CREATE TABLE poseere(
	idsucursal VARCHAR(10),
    idproductoe CHAR(10),
    cantidadestock INT 
);

-- Restricciones poseere
ALTER TABLE poseere ALTER COLUMN idsucursal SET NOT NULL;
ALTER TABLE poseere ADD CONSTRAINT idsucursalD1 CHECK (idsucursal SIMILAR TO 'S-[0-9]*');
ALTER TABLE poseere ALTER COLUMN idproductoe SET NOT NULL;
ALTER TABLE poseere ADD CONSTRAINT idproductoe1 CHECK(idproductoe SIMILAR TO 'E-[0-9]*');
ALTER TABLE poseere ADD CONSTRAINT cantidadestock1 CHECK(cantidadestock BETWEEN 1 AND 99999);

-- Entidad
ALTER TABLE poseere ADD CONSTRAINT poseere_pkey PRIMARY KEY (idsucursal,idproductoe);

-- Referencial
ALTER TABLE poseere ADD CONSTRAINT poseere_fkey1 FOREIGN KEY (idsucursal)
REFERENCES sucursal (idsucursal);

ALTER TABLE poseere ADD CONSTRAINT poseere_fkey2 FOREIGN KEY (idproductoe) 
REFERENCES electronica (idproductoe);






---------------------------------------------------------------------------------------------------
CREATE TABLE venderp(
	idventa CHAR(10),
    idproductop CHAR(10),
    cantidadproducto INT 
    
);


--Restricciones venderp
ALTER TABLE venderp ALTER COLUMN idventa SET NOT NULL;
ALTER TABLE venderp ADD CONSTRAINT idventa1 CHECK(idventa SIMILAR TO 'V-[0-9]*');
ALTER TABLE venderp ALTER COLUMN idproductop SET NOT NULL;
ALTER TABLE venderp ADD CONSTRAINT idproductop1 CHECK(idproductop SIMILAR TO 'P-[0-9]*');
ALTER TABLE venderp ADD CONSTRAiNT cantidadproducto CHECK(cantidad between 1 and 99999);


--Entidad
ALTER TABLE venderp ADD CONSTRAINT venderp_pkey PRIMARY KEY (idventa,idproductop);

--Referencial
ALTER TABLE venderp ADD CONSTRAINT venderp_fkey1 FOREIGN KEY (idventa)
REFERENCES venta (idventa)

ALTER TABLE venderp ADD CONSTRAINT venderp_fkey2 FOREIGN KEY (idproductop) 
REFERENCES perecedero (idproductop)
---------------------------------------------------------------------------------------------------------------
CREATE TABLE vendernp(
	idventa CHAR(10),
    idproductonp CHAR(10),
    cantidadproducto INT 
    
);


--Restricciones vendernp
ALTER TABLE vendernp ALTER COLUMN idventa SET NOT NULL;
ALTER TABLE vendernp ADD CONSTRAINT idventa1 CHECK(idventa SIMILAR TO 'V-[0-9]*');
ALTER TABLE vendernp ALTER COLUMN idproductonp SET NOT NULL;
ALTER TABLE vendernp ADD CONSTRAINT idproductonp1 CHECK(idproductonp SIMILAR TO 'NP-[0-9]*');
ALTER TABLE vendernp ADD CONSTRAiNT cantidadproducto CHECK(cantidad between 1 and 99999);


--Entidad
ALTER TABLE vendernp ADD CONSTRAINT vendernp_pkey PRIMARY KEY (idventa,idproductonp);

--Referencial
ALTER TABLE vendernp ADD CONSTRAINT vendernp_fkey1 FOREIGN KEY (idventa)
REFERENCES venta (idventa)

ALTER TABLE vendernp ADD CONSTRAINT vendernp_fkey2 FOREIGN KEY (idproductonp) 
REFERENCES noperecedero (idproductonp)
----------------------------------------------------------------------------------------------------------------------
CREATE TABLE vendere(
	idventa CHAR(10),
    idproductoe CHAR(10),
    cantidadproducto INT 
    
);


--Restricciones vendere
ALTER TABLE vendere ALTER COLUMN idventa SET NOT NULL;
ALTER TABLE vendere ADD CONSTRAINT idventa1 CHECK(idventa SIMILAR TO 'V-[0-9]*');
ALTER TABLE vendere ALTER COLUMN idproductoe SET NOT NULL;
ALTER TABLE vendere ADD CONSTRAINT idproductoe1 CHECK(idproductoe SIMILAR TO 'E-[0-9]*');
ALTER TABLE vendere ADD CONSTRAiNT cantidadproducto CHECK(cantidad between 1 and 99999);


--Entidad
ALTER TABLE vendere ADD CONSTRAINT vendere_pkey PRIMARY KEY (idventa,idproductoe);

--Referencial
ALTER TABLE vendere ADD CONSTRAINT vendere_fkey1 FOREIGN KEY (idventa)
REFERENCES venta (idventa)

ALTER TABLE vendere ADD CONSTRAINT vendere_fkey2 FOREIGN KEY (idproductoe) 
REFERENCES electronica (idproductoe)