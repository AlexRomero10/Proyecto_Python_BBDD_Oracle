import cx_Oracle

--Creamos primero el usuario

--CREATE USER practica IDENTIFIED BY practica;
--GRANT CONNECT, RESOURCE TO practica;
--ALTER USER practica ACCOUNT UNLOCK;

--Establecer conexión con la base de datos
--dsn = XE o ORCL dependiendo de la version 
cnx = cx_Oracle.connect(user='practica', password='practica', dsn='localhost/xe')


cursor = cnx.cursor()

CREATE TABLE EMPRESA (
    CIF VARCHAR2(9),
    Nombre VARCHAR2(20) NOT NULL,
    Direccion VARCHAR2(20) DEFAULT '0',
    Localidad VARCHAR2(20) DEFAULT '0',
    CONSTRAINT PK_EMPRESA PRIMARY KEY (CIF),
    CONSTRAINT ck_longitud_localidad CHECK (LENGTH(Localidad) BETWEEN 1 AND 20),
    CONSTRAINT ck_nombre_formato CHECK (REGEXP_LIKE(Nombre, '^[a-zA-Z ]+$')),
    CONSTRAINT ck_cif_longitud CHECK (LENGTH(CIF) = 9)
);
INSERT INTO EMPRESA VALUES ('A12345678','Mercadona','Calle Sevilla','Utrera');
INSERT INTO EMPRESA VALUES ('B46066361','Ford','Calle Arenal','Sevilla');
INSERT INTO EMPRESA VALUES ('C28328508','UPS','Calle Pureza','Cadiz');
INSERT INTO EMPRESA VALUES ('D65005357','Iberia','Calle Castilla','Cordoba');
INSERT INTO EMPRESA VALUES ('F46078986','Consum','Calle Tetuan','Almeria');
INSERT INTO EMPRESA VALUES ('G09266298','FC Barcelona','Calle Sierpes','Jaen');
INSERT INTO EMPRESA VALUES ('W0049001A','ARAG SE','Calle Goles','Huelva');
INSERT INTO EMPRESA VALUES ('H11223344','Burger King','Calle Rioja','Malaga');
INSERT INTO EMPRESA VALUES ('I55667788','MCDonalds','Calle Velazquez','Granada');
INSERT INTO EMPRESA VALUES ('J99887766','Abengoa','Avenida Portugal','Sevilla');

CREATE TABLE AreaTrabajo (
    ID_AreaTrabajo VARCHAR2(9) PRIMARY KEY,
    Nombre VARCHAR2(20) NOT NULL,
    Descripcion VARCHAR2(50) DEFAULT '0' NOT NULL,
    CONSTRAINT check_ID_AreaTrabajo CHECK (REGEXP_LIKE(ID_AreaTrabajo, '^[a-zA-Z0-9]+$')), 
    CONSTRAINT check_Longitud_Nombre CHECK (LENGTH(Nombre) <= 20),
    CONSTRAINT check_Formato_Descripcion CHECK (REGEXP_LIKE(Descripcion, '^[-a-zA-Z0-9_.,;:()! ]+$'))
);

INSERT INTO AreaTrabajo VALUES ('111','Alejandro','Area de desarrollo de software');
INSERT INTO AreaTrabajo VALUES ('222','Raul','Recursos Humanos');
INSERT INTO AreaTrabajo VALUES ('333','Daniel','Ventas');
INSERT INTO AreaTrabajo VALUES ('444','Pablo','Soporte Tecnico');
INSERT INTO AreaTrabajo VALUES ('555','Fran','Marketing');
INSERT INTO AreaTrabajo VALUES ('666','Manuel','Investigacion y Desarrollo');
INSERT INTO AreaTrabajo VALUES ('777','Gonzalo','Operaciones');
INSERT INTO AreaTrabajo VALUES ('888','Mario','Calidad');
INSERT INTO AreaTrabajo VALUES ('999','Cristian','Finanzas');
INSERT INTO AreaTrabajo VALUES ('1000','Juan','Proyectos Especiales');

CREATE TABLE PERSONA_DE_CONTACTO (
    Codigo_ContactoEmpresa VARCHAR2(9),
    Cargo VARCHAR2(20) DEFAULT '0' NOT NULL,
    Nombre VARCHAR2(20) DEFAULT '0' NOT NULL,
    Correo_electronico VARCHAR2(50),
    CIF VARCHAR2(9),
    UNIQUE (Codigo_ContactoEmpresa),
    PRIMARY KEY (Codigo_ContactoEmpresa, CIF),
    FOREIGN KEY (CIF) REFERENCES EMPRESA(CIF),
    CHECK (LENGTH(CIF) = 9),
    CHECK (LENGTH(Nombre) <= 20),
    CHECK (REGEXP_LIKE(Correo_electronico, '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'))
);

INSERT INTO PERSONA_DE_CONTACTO VALUES ('111','Gerente','Juan','juan.ruiz@gmail.com','A12345678');
INSERT INTO PERSONA_DE_CONTACTO VALUES ('222','Desarrollador','Daniel','daniel.diane@gmail.com','B46066361');
INSERT INTO PERSONA_DE_CONTACTO VALUES ('333','Coordinador','Mario','mario.ruiz@gmail.com','C28328508');
INSERT INTO PERSONA_DE_CONTACTO VALUES ('444','Informatico','Cristian','cristian.pinillos@gmail.com','D65005357');
INSERT INTO PERSONA_DE_CONTACTO VALUES ('555','Profesor','Alejandro','alex.romero@gmail.com','F46078986');
INSERT INTO PERSONA_DE_CONTACTO VALUES ('666','Ingeniero','Pablo','pablo.rodri@gmail.com','G09266298');
INSERT INTO PERSONA_DE_CONTACTO VALUES ('777','Analista','Angela','angela.gonz@gmail.com','W0049001A');
INSERT INTO PERSONA_DE_CONTACTO VALUES ('888','Profesora','Claudia','claudia.jimen@gmail.com','H11223344');
INSERT INTO PERSONA_DE_CONTACTO VALUES ('999','Arquitecta','Paula','paula.prieto@gmail.com','I55667788');
INSERT INTO PERSONA_DE_CONTACTO VALUES ('1000','Jefa','Lucia','lucia.romero@gmail.com','J99887766');