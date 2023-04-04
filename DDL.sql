DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

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

ALTER TABLE cajero ADD CONSTRAINT curpcajeroD2 UNIQUE(curpcajero);
ALTER TABLE cajero ADD CONSTRAINT cajero_pkey PRIMARY KEY (curpcajero);

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

-- Restricciones cliente

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

ALTER TABLE encargado ADD CONSTRAINT curpencargadoD2 UNIQUE(curpencargado);
ALTER TABLE encargado ADD CONSTRAINT encargado_pkey PRIMARY KEY (curpencargado);

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

-- Restricciones cliente

ALTER TABLE gerente ALTER COLUMN curpencargado SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT curpencargadoD1 CHECK(CHAR_LENGTH(curpencargado)=18);
ALTER TABLE gerente ADD CONSTRAINT nombreencargadoD1 CHECK(nombreencargado <> '');
ALTER TABLE gerente ADD CONSTRAINT paternoencargadoD1 CHECK(paternoencargado <>'');
ALTER TABLE gerente ADD CONSTRAINT maternoencargadoD1 CHECK(maternoencargado <>'');
ALTER TABLE gerente ALTER COLUMN fechanacimiento SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT estadoD1 CHECK(estado <>'');
ALTER TABLE gerente ADD CONSTRAINT ciudadD1 CHECK(ciudad <>'');
ALTER TABLE gerente ADD CONSTRAINT coloniaD1 CHECK (colonia <>'');
ALTER TABLE gerente ADD CONSTRAiNT codigopostalD1 CHECK(codigopostal between 1 and 99999);
ALTER TABLE gerente ADD CONSTRAiNT numeroD1 CHECK(numero between 10000 and 99999);

ALTER TABLE encargado ADD CONSTRAINT curpencargadoD2 UNIQUE(curpencargado);
ALTER TABLE encargado ADD CONSTRAINT encargado_pkey PRIMARY KEY (curpencargado);

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


