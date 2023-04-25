DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE articulista(
idarticulista CHAR(10),
nombre VARCHAR(50),
apaterno VARCHAR(50),
amaterno VARCHAR(50),
profesion VARCHAR(50),
correo VARCHAR(50)
);

ALTER TABLE articulista ALTER COLUMN idarticulista SET NOT NULL;
ALTER TABLE articulista ADD CONSTRAINT idarticulistaD1 CHECK (idarticulista SIMILAR TO 'A-[0-9]{5}');
ALTER TABLE articulista ADD CONSTRAINT nombreD1 CHECK (nombre <> '');
ALTER TABLE articulista ADD CONSTRAINT apaternoD1 CHECK (apaterno <> '');
ALTER TABLE articulista ADD CONSTRAINT amaternoD1 CHECK (amaterno <> '');
ALTER TABLE articulista ADD CONSTRAINT profesionD1 CHECK (profesion <> '');
ALTER TABLE articulista ADD CONSTRAINT coreeoD1 CHECK (correo LIKE '_%@_%._%');


ALTER TABLE articulista ADD CONSTRAINT idarticulistaD2 UNIQUE (idarticulista);
ALTER TABLE articulista ADD CONSTRAINT articulista_pkey PRIMARY KEY (idarticulista);

CREATE TABLE seccion(
numseccion INT
);

ALTER TABLE seccion ALTER COLUMN numseccion SET NOT NULL;
ALTER TABLE seccion ADD CONSTRAINT numseccionD1 CHECK (numseccion between 1 and 99999);

ALTER TABLE seccion ADD CONSTRAINT numseccionD2 UNIQUE numseccion;
ALTER TABLE seccion ADD CONSTRAINT seccion_pkey PRIMARY KEY seccion;
-------------------------------------------------------
CREATE TABLE edicion(
numedicion INT,
fecha date
);

ALTER TABLE edicion ALTER COLUMN numedicion SET NOT NULL;
ALTER TABLE edicion ADD CONSTRAINT numedicionD1 CHECK (numedicion between 1 and 99999);
ALTER TABLE edicion ALTER COLUMN fecha SET NOT NULL;

ALTER TABLE edicion ADD CONSTRAINT numedicionD2 UNIQUE numedicion;
ALTER TABLE edicion ADD CONSTRAINT edicion_pkey PRIMARY KEY edicion;
-------------------------------------------------------
CREATE TABLE tener(
numedicion INT,
numseccion INT
paginicio INT,
pagfinal INT
);

ALTER TABLE tener ALTER COLUMN numedicion SET NOT NULL;
ALTER TABLE edicion ADD CONSTRAINT numedicionD1 CHECK (numedicion between 1 and 99999);
ALTER TABLE edicion ALTER COLUMN fecha SET NOT NULL;