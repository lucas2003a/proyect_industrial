CREATE DATABASE industrialbd;
USE industrialbd;

 
 /****************************************************
******************* TURNOS ***************************
*****************************************************/

CREATE TABLE turnos
(
	idturno 			INT AUTO_INCREMENT PRIMARY KEY,
	turno				VARCHAR(20) NOT NULL,
	fecharegistro 	DATE			NOT NULL DEFAULT NOW(),
	usuario			VARCHAR(20) NOT NULL,
	estado			CHAR(1) 		NOT NULL DEFAULT '1',
	CONSTRAINT uk_turno_tur UNIQUE (turno)
) ENGINE = INNODB;

CREATE INDEX idx_idturno ON turnos (idturno);
CREATE INDEX idx_turno ON turnos (turno);

INSERT INTO turnos(turno,usuario) VALUES ('MAÑANA','ADMIN'),('TARDE','ADMIN');

SELECT * FROM turnos

-- ********* GRADOS **********

CREATE TABLE grados
(
	idgrado		INT AUTO_INCREMENT PRIMARY KEY,
	idturno		INT 			NOT NULL,
	grado			VARCHAR(20)	NOT NULL,
	fecharegistro DATE NOT NULL DEFAULT NOW(),
	usuario		VARCHAR(20)	NOT NULL,
	estado		CHAR(1)	NOT NULL DEFAULT'1',
	CONSTRAINT fk_idturno_gr FOREIGN KEY (idturno) REFERENCES turnos (idturno),
	CONSTRAINT uk_idturno_gr UNIQUE (idturno,grado)
)ENGINE = INNODB;

CREATE INDEX idx_idgrado ON grados (idgrado);
CREATE INDEX idx_idturno ON grados (idturno);
CREATE INDEX idx_grado ON grados (grado);

 INSERT INTO grados(idturno,grado,usuario) VALUES
(1,'PRIMERO','ADMIN'),(1,'SEGUNDO','ADMIN'),(1,'TERCERO','ADMIN'),(1,'CUARTO','ADMIN'),(1,'QUINTO','ADMIN'),
(2,'PRIMERO','ADMIN'),(2,'SEGUNDO','ADMIN'),(2,'TERCERO','ADMIN'),(2,'CUARTO','ADMIN'),(2,'QUINTO','ADMIN');

 SELECT * FROM grados
 
 -- ********* SECCIONES ********
CREATE TABLE secciones
(
	idseccion		INT AUTO_INCREMENT PRIMARY KEY,
	idgrado			INT	NOT NULL,
	seccion			CHAR(1)	NOT NULL,
	fecharegistro	DATE NOT NULL DEFAULT NOW(),
	usuario			VARCHAR(20) NOT NULL,
	estado			CHAR(1)	NOT NULL DEFAULT '1',
	CONSTRAINT fk_idgrado_sec FOREIGN KEY(idgrado) REFERENCES grados(idgrado),
	CONSTRAINT chk_seccion_sec CHECK (seccion BETWEEN 'A' AND 'Z'),
	CONSTRAINT uk_seccion_sec UNIQUE (idgrado,seccion)
)ENGINE = INNODB;

CREATE INDEX idx_idseccion ON secciones(idseccion);
CREATE INDEX idx_idgrado ON secciones(idgrado);
CREATE INDEX idx_seccion ON secciones (seccion);

INSERT INTO secciones(idgrado,seccion,usuario) VALUES
(1,'A','ADMIN'),(1,'B','ADMIN'),(1,'C','ADMIN'),(2,'D','ADMIN'),(2,'E','ADMIN'),(2,'F','ADMIN'),(3,'G','ADMIN'),(3,'H','ADMIN'),(3,'I','ADMIN'),(4,'J','ADMIN'),(4,'K','ADMIN'),
(5,'L','ADMIN'),(5,'M','ADMIN');

SELECT * FROM secciones;

/*****************************************************
******************* TALLERES *************************
*****************************************************/

CREATE TABLE talleres
(
	idtaller		INT AUTO_INCREMENT PRIMARY KEY,
	taller		VARCHAR(40) NOT NULL,
	fecharegistro	DATE	NOT NULL DEFAULT NOW(),
	usuario			VARCHAR(20)	NOT NULL,
	estado			CHAR(1)	NOT NULL DEFAULT '1',
	CONSTRAINT uk_taller UNIQUE(taller)
)ENGINE = INNODB;

CREATE INDEX idx_idtaller ON talleres(idtaller);
CREATE INDEX idx_taller ON talleres(taller);

INSERT INTO talleres(taller,usuario)VALUES
('EBANISTERÍA','ADMIN'),('ALABAÑILERÍA','ADMIN'),('INDSUTRIA TEXTIL','ADMIN');

SELECT * FROM talleres;

/* AGREGAR UN CAMPO DE FECHA DE MODIFICACIÓN, QUE NO MODIFIQUE LA FECHA DE REGISTRO
	PERO QUE SI LA ACTUALISE LA FECHA DE MODIFICACIÓN/*

/*****************************************************
******************* DEPARTAMENTOS ********************
******************************************************/

CREATE TABLE departamentos 
(
	iddepartamento INT AUTO_INCREMENT PRIMARY KEY,
	departamento	VARCHAR(20) NOT NULL,
	CONSTRAINT uk_departamento_dep UNIQUE(departamento)	
)ENGINE = INNODB;

 CREATE INDEX idx_iddepartamento ON departamentos(iddepartamento);
 CREATE INDEX idx_departamento ON departamentos(departamento);
 
 INSERT INTO departamentos(departamento)VALUES
 ('ICA'),('LIMA'),('LORETO');

SELECT * FROM departamentos;

/*****************************************************
******************* PROVINCIAS ***********************
******************************************************/

CREATE TABLE provincias
(
	idprovincia		INT AUTO_INCREMENT PRIMARY KEY,
	iddepartamento	INT		NOT NULL,
	provincia		VARCHAR(20) NOT NULL,
	CONSTRAINT fk_iddepartamento_prov FOREIGN KEY(iddepartamento) REFERENCES departamentos(iddepartamento),
	CONSTRAINT uk_provincia UNIQUE(iddepartamento,provincia)
) ENGINE = INNODB;

CREATE INDEX idx_idprovincia ON provincias(idprovincia);
CREATE INDEX idx_iddepartamento ON provincias(iddepartamento);
CREATE INDEX idx_provincia ON provincias(provincia);

INSERT provincias(iddepartamento,provincia) VALUES
(1,'CHINCHA'),(1,'PALPA'),(1,'NAZCA');

SELECT * FROM provincias;

 /*****************************************************
******************* DISTRITOS *************************
******************************************************/

CREATE TABLE distritos 
(
	iddistrito		INT AUTO_INCREMENT PRIMARY KEY,
	idprovincia		INT 		NOT NULL,
	distrito			VARCHAR(20) NOT NULL,
	CONSTRAINT fk_idprovincia_dis FOREIGN KEY(idprovincia) REFERENCES provincias(idprovincia),
	CONSTRAINT uk_distrito_ UNIQUE(idprovincia,distrito)
) ENGINE = INNODB;

 CREATE INDEX idx_iddistrito ON distritos(iddistrito);
 CREATE INDEX idx_idprovincia ON distritos(idprovincia);
 CREATE INDEX idx_distrito ON distritos(distrito);
 
 INSERT INTO distritos(idprovincia,distrito)VALUES
 (1,'ALTO LARÁN'),(1,'GROCIO PRADO'),(1,'SUNAMPE');
 
 SELECT * FROM distritos;
 
  /********************************************************
******************* PAR DE PADRES *************************
***********************************************************/

CREATE TABLE parpadres
(
	idparpadre		INT AUTO_INCREMENT PRIMARY KEY,
	apellidospadre	VARCHAR(40)		NOT NULL,
	nombrespadre	VARCHAR(40)		NOT NULL,
	documento_tipo	VARCHAR(30)		NOT NULL,
	documento_nro	VARCHAR(20)		NOT NULL,
	fechanacimiento DATE				NOT NULL,	
	direccion		VARCHAR(60)		NOT NULL,
	correo			VARCHAR(60)		NOT NULL,
	celular			CHAR(9)			NOT NULL,
	gradoinstruccion	VARCHAR(20) NOT NULL,
	ocupacion		VARCHAR(20)		NOT NULL,
	convivencia		CHAR(2)			NOT NULL,
	religion			VARCHAR(20)		NOT NULL,
	apellidosmadre VARCHAR(40)		NOT NULL,
	nombresmadre   VARCHAR(40)		NOT NULL,
	documento_tipoM VARCHAR(20)	NOT NULL,
	documento_nroM VARCHAR(20)		NOT NULL,
	fechanacimientoM	DATE			NOT NULL,	
	direccionM		VARCHAR(60)		NOT NULL,
	correoM			VARCHAR(60)		NOT NULL,
	celularM			CHAR(9)			NOT NULL,
	gradoinstruccionM	VARCHAR(20) NOT NULL,
	ocupacionM		VARCHAR(20)		NOT NULL,
	convivenciaM		CHAR(2)		NOT NULL,
	religionM		VARCHAR(20)		NOT NULL,
	fecharegistro		DATE 			NOT NULL DEFAULT NOW(),
	usuario			VARCHAR(20)		NOT NULL,
	estado			CHAR(1)			NOT NULL DEFAULT'1',
	CONSTRAINT uk_parpadres_par UNIQUE(documento_nro,documento_nroM),
	CONSTRAINT chk_documentos_par CHECK (documento_nro <> documento_nroM)
)ENGINE = INNODB;

CREATE INDEX idx_idparpadre ON parpadres(idparpadre);
CREATE INDEX idx_apellidospadre ON parpadres(apellidospadre);
CREATE INDEX idx_nombrespadre ON parpadres(nombrespadre);
CREATE INDEX idx_documento_nro ON parpadres(documento_nro);
CREATE INDEX idx_apellidosmadre ON parpadres(apellidosmadre);
CREATE INDEX idx_nombresmadre ON parpadres(nombresmadre);
CREATE INDEX idx_documento_nroM ON parpadres(documento_nroM);

INSERT INTO parpadres VALUES
 (1,'ATUNCAR HERNANDEZ','CARLOS ALBERTO','DNI','1112223','1970-07-16','AV.SANTA ROSA#541','carlosalbatun@hotmail.com','956993597','SUPERIOR','TRABAJADOR','SI','CATOLICO',
'VALERIO ALMEYDA','MARÍA ROSALVA','DNI','11122233','1969-12-21','AV, SANTA ROSA#541','mariavalerio@gmail.com','956993597','SUPERIOR','TRABAJADOR','SI','CATOLICO','2023-05-16','ADMIN',1),
(2,'ATUNCAR HERNANDEZ','CARLOS ALBERTO','DNI','11122233','1970-07-16','AV.SANTA ROSA#541','carlosalbatun@hotmail.com','956993597','SUPERIOR','TRABAJADOR','SI','ATEO',
'CUBA GUEVARA','GLORIA ELIZABETH','DNI','789456123','1969-12-21','AV, SANTA ROSA#541','MARIEL@gmail.com','956993597','SUPERIOR','TRABAJADOR','SI','ATEO','2023-05-16','ADMIN',1);

SELECT * FROM parpadres;

  /********************************************************
******************* APODERADOS ****************************
***********************************************************/
CREATE TABLE apoderados
(
	idapoderado		INT AUTO_INCREMENT PRIMARY KEY,
	apellidos		VARCHAR(40)	NOT NULL,
	nombres			VARCHAR(40)	NOT NULL,	
	documento_tipo	VARCHAR(30)	NOT NULL,
	documento_nro	VARCHAR(20)	NOT NULL,
	sexo				CHAR(1)		NOT NULL,
	fechanacimiento DATE			NOT NULL,	
	direccion		VARCHAR(60)	NOT NULL,
	correo			VARCHAR(60)	NOT NULL,
	celular			CHAR(9)		NOT NULL,
	parentesco		VARCHAR(10) NOT NULL,
	fecharegistro	DATE			NOT NULL DEFAULT NOW(),
	usuario			VARCHAR(20) NOT NULL,
	estado			CHAR(1)		NOT NULL DEFAULT '1',
	CONSTRAINT uk_documento_nro_ap UNIQUE(documento_nro),
	CONSTRAINT chk_sexo_ap CHECK (sexo IN('F','M'))
)ENGINE = INNODB;

CREATE INDEX idx_idapoderado ON apoderados(idapoderado);
CREATE INDEX idx_apellidos	ON apoderados(apellidos);
CREATE INDEX idx_nombres ON apoderados(nombres);
CREATE INDEX idx_documento_nro_ap ON apoderados(documento_nro);

INSERT INTO apoderados(apellidos,nombres,documento_tipo,documento_nro,sexo,fechanacimiento,direccion,correo,celular,parentesco,usuario)VALUES
('VALERIO ALMEYDA','MARÍA ATANASIA','DNI','12378946','F','1995-12-01','AV. PRIMAVERA','mariatan@gmial.com','999666333','ABUELA','ADMIN'),
('MELO VALERIO','LORENA MERCEDES','DNI','12378945','F','1995-12-01','AV. PRIMAVERA','lorenamer@gmial.com','999666333','PRIMA','AADMIN');

SELECT * FROM apoderados;

  /********************************************************
******************* ALUMNOS *******************************
***********************************************************/

CREATE TABLE alumnos
(
	idalumno				INT AUTO_INCREMENT,
	apellidos			VARCHAR(40)		NOT NULL,
	nombres				VARCHAR(40)		NOT NULL,	
	documento_tipo		VARCHAR(30)	NOT NULL,
	documento_nro		VARCHAR(20)	NOT NULL,
	sexo 					CHAR(1)		NOT NULL,	
	fechanacimiento 	DATE 			NOT NULL, -- check para la fecha de nacimiento sea distinta a la de hoy
	iddistrito			INT		NOT NULL,
	direccion			VARCHAR(60)	NOT NULL,
	correo				VARCHAR(60)	NOT NULL,
	celular 				CHAR(9)	NOT NULL,
	idseccion			INT NOT NULL,
	idtaller				INT NOT NULL,
	religion				VARCHAR(20)	NOT NULL,
	lenguamaterna		VARCHAR(20)	NOT NULL,
	lenguasegunda		VARCHAR(20) NOT NULL DEFAULT 'NINGUNA',
	discapacidad		TEXT			NOT NULL DEFAULT 'NINGUNA',
	fechaalta			DATE			NOT NULL,
	fechasese			DATE			NOT NULL,
	idparpadre			INT			NOT NULL,
	idapoderado			INT 			NOT NULL,
	fecharegistro		DATE			NOT NULL DEFAULT 	NOW(),
	usuario				VARCHAR(20) NOT NULL,		
	estado				CHAR(1)	NOT NULL DEFAULT '1',
	CONSTRAINT pk_idalumno_al PRIMARY KEY alumnos(idalumno),
	CONSTRAINT fk_idseccion_al	FOREIGN KEY (idseccion) REFERENCES secciones(idseccion),
	CONSTRAINT uk_documento_nro_al	UNIQUE (documento_nro),
	CONSTRAINT fk_iddistrito_al FOREIGN KEY (iddistrito) REFERENCES distritos(iddistrito),
	CONSTRAINT fk_idparpadre_al FOREIGN KEY (idparpadre) REFERENCES parpadres(idparpadre),
	CONSTRAINT fk_idapoderado_al FOREIGN KEY (idapoderado) REFERENCES apoderados(idapoderado),
	CONSTRAINT chk_sexo_al	CHECK (sexo IN('F','M'))
)ENGINE = INNODB;

CREATE INDEX idx_idalumno ON alumnos (idalumno);
CREATE INDEX idx_idseccion ON alumnos (idseccion);
CREATE INDEX idx_documento_nro ON alumnos (documento_nro);
CREATE INDEX idx_iddistrito ON alumnos (iddistrito);
CREATE INDEX idx_idparpadre ON alumnos (idparpadre);
CREATE INDEX idx_idapoderado ON alumnos (idapoderado);

INSERT INTO alumnos(apellidos,nombres,documento_tipo,documento_nro,sexo,fechanacimiento,iddistrito,direccion,correo,celular,idseccion,idtaller,religion,lenguamaterna,lenguasegunda,discapacidad,fechaalta,fechasese,idparpadre,idapoderado,usuario)VALUES
('ATUNCAR VALERIO','LUCAS ALFREDO','DNI','77068571','M','2003-11-22',1,'AV.SANTA ROSA #541','lucasatuncar1gmail.com','922634773',1,1,'CATOLICO','ESPAÑOL','NO','NIGUNA','2023-05-17','2028-05-17',1,2,'ADMIN'),
('ATUNCAR VALERIO','SAMUEL','DNI','77068572','M','2003-11-22',1,'AV.SANTA ROSA #541','lucasatuncar1gmail.com','922634773',3,2,'ATEO','ESPAÑOL','NO','NIGUNA','2023-05-17','2028-05-17',1,2,'ADMIN'),
('SOTO VILLAVICECIO','CARLOS','DNI','77068555','M','2003-11-22',1,'AV.SANTA ROSA #541','carlosso@gmail.com','922634773',1,3,'MUSULMAN','ESPAÑOL','NO','NIGUNA','2023-05-17','2028-05-17',1,1,'ADMIN'),
('VALERIO ALMEYDA','MARÍA ROSALVA','DNI','77068566','F','2003-11-22',1,'AV.SANTA ROSA #541','mariros@gmail.com','922634776',11,1,'CATOLICO','ESPAÑOL','NO','NIGUNA','2023-05-17','2028-05-17',1,1,'ADMIN'),
('VALERIO ALMEYDA','MARÍA ROSALVA','DNI','77068560','F','2003-11-22',1,'AV.SANTA ROSA #541','mariros@gmail.com','922634776',12,2,'ATEO','ESPAÑOL','NO','NIGUNA','2023-05-17','2028-05-17',1,2,'ADMIN');


 SELECT * FROM alumnos;
 
/********************************************************
******************* TIPOS DE PERSONAL *******************
*********************************************************/

CREATE TABLE tipospersonal
(
	idtipopersonal		INT AUTO_INCREMENT,
	tipopersonal		VARCHAR(20)		NOT NULL,
	fecharegistro		DATE				NOT NULL DEFAULT NOW(),
	usuario				VARCHAR(20)		NOT NULL,
	estado				CHAR(1) 			NOT NULL DEFAULT '1',
	CONSTRAINT pk_idtipopersonal_tper PRIMARY KEY tipospersonal(idtipopersonal),
	CONSTRAINT uk_tipopersonal_tper UNIQUE (tipopersonal)
)ENGINE = INNODB;

CREATE INDEX idx_idtipopersopnal ON tipospersonal(idtipopersonal);
CREATE INDEX idx_tipopersonal ON tipospersonal (tipopersonal);

INSERT INTO tipospersonal(tipopersonal,usuario) VALUES
('PROFESOR','ADMIN'),('DIRECTOR','ADMIN'),('BIBLITECARIA','ADMIN'),('SECRETARIA','ADMIN');

SELECT * FROM tipospersonal;

/********************************************************
******************* PERSONAL ****************************
*********************************************************/

CREATE TABLE personal
(
	idpersonal		INT AUTO_INCREMENT,
	idtipopersonal		INT 			NOT NULL,
	apellidos			VARCHAR(40)	NOT NULL,
	nombres 				VARCHAR(40)	NOT NULL,
	documento_tipo		VARCHAR(30)	NOT NULL,	
	documento_nro		VARCHAR(20)	NOT NULL,
	sexo					CHAR(1)		NOT NULL,
	fechanacimiento	DATE			NOT NULL,
	direccion			VARCHAR(60) NOT NULL,
	correo				VARCHAR(60)	NOT NULL,
	celular			   CHAR(9)		NOT NULL,
	fecharegistro		DATE			NOT NULL DEFAULT NOW(),
	usuario				VARCHAR(20) NOT NULL,
	estado				CHAR(1)		NOT NULL DEFAULT '1',
	CONSTRAINT pk_idpersonal_per	PRIMARY KEY personal(idpersonal),
	CONSTRAINT fk_idtipopersonal_per	FOREIGN KEY	(idtipopersonal) REFERENCES tipospersonal(idtipopersonal),
	CONSTRAINT uk_documento_nro_per UNIQUE (documento_nro),
	CONSTRAINT fk_sexo_per	CHECK (sexo IN('F','M'))
)ENGINE = INNODB;

CREATE INDEX idx_idpersonal ON personal(idpersonal);
CREATE INDEX idx_idtpopersonal ON personal(idtipopersonal);
CREATE INDEX idx_documento_nro ON personal(documento_nro);

INSERT INTO personal(idtipopersonal,apellidos,nombres,documento_tipo,documento_nro,sexo,fechanacimiento,direccion,correo,celular,usuario)VALUES
	(1,'MEZA GARCIA','GORVERT ALEJANDRO','CARNET DE EXTRANEJRÍA','12457856000000000000','M','1996-11-13','POR LA PLAZA DE ARMAS DE CHINCHA','grome@gmail.com','111222333','ADMIN'),
	(1,'MARTINEZ SUNCION','CESAR','CARNET DE EXTRANEJRÍA','12457855000000000000','M','1996-11-13','POR LA PLAZA DE ARMAS DE CHINCHA','SUNCER@gmail.com','111222333','ADMIN');

SELECT * FROM personal

/********************************************************
************************** CURSOS ***********************
*********************************************************/
CREATE TABLE cursos
(
	idcurso 			INT AUTO_INCREMENT PRIMARY KEY,
	curso				VARCHAR(40) NOT NULL,
	fecharegsitro 	DATE 			NOT NULL DEFAULT NOW(),
	usuario			VARCHAR(20)	NOT NULL,
	estado			CHAR(1) 		NOT NULL DEFAULT '1',
	CONSTRAINT uk_curso_cur UNIQUE (curso)
)ENGINE = INNODB;

CREATE INDEX idx_idcurso ON cursos(idcurso);
CREATE INDEX idx_curso ON cursos(curso);

INSERT INTO cursos (curso,usuario)VALUES
	('MATEMÁTICA','ADMIN'),('COMUNICACIÓN','ADMIN'),('ED.FÍSICA','ADMIN');
	
SELECT * FROM cursos;	

-- ***** DETALE CURSOS *********
CREATE TABLE detallecursos
(
	iddetallecurso		INT AUTO_INCREMENT,
	idcurso				INT	NOT NULL,
	idpersonal			INT	NOT NULL,
	fechainicio			DATE	NOT NULL,
	fechatermino		DATE  NOT NULL,
	contenido			TEXT	NOT NULL,
	fecharegistro 		DATE 	NOT NULL	DEFAULT NOW(),
	usuario				VARCHAR(20)	NOT NULL,
	estado				CHAR(1)	NOT NULL DEFAULT '1',
	CONSTRAINT pk_iddetallecurso_detc PRIMARY KEY detallecursos(iddetallecurso),
	CONSTRAINT fk_curso_detc	FOREIGN KEY (idcurso) REFERENCES cursos (idcurso),
	CONSTRAINT chk_fechatermino_detc CHECK (fechatermino > fechainicio ),
	CONSTRAINT fk_idpersonal_detc	FOREIGN KEY (idpersonal) REFERENCES personal(idpersonal)
)ENGINE = INNODB;

CREATE INDEX idx_detallecurso ON detallecursos(iddetallecurso);
CREATE INDEX idx_idcurso ON detallecursos(idcurso);
CREATE INDEX idx_fechainicio ON detallecursos(fechainicio);
CREATE INDEX idx_idpersonal ON detallecursos(idpersonal);

INSERT INTO detallecursos(idcurso,fechainicio,fechatermino,contenido,idpersonal,usuario)VALUES
	(1,'2023-06-12','2023-07-12','matmática para alumnos de 3 grado',1,'ADMIN'),
	(2,'2023-06-12','2023-07-12','comunicación para alumnos de 3 grado',2,'ADMIN');
	
SELECT * FROM detallecursos;

-- ********** AULAS ***********
CREATE TABLE aulas
(
	idaula 		INT AUTO_INCREMENT,
	nroaula		VARCHAR(3)		NOT NULL,
	fecharegistro 		DATE 	NOT NULL	DEFAULT NOW(),
	usuario				VARCHAR(20)	NOT NULL,
	estado		CHAR(1)			NOT NULL DEFAULT '1',
	CONSTRAINT pk_idaula_aul PRIMARY KEY aulas(idaula),
	CONSTRAINT uk_noraula_aul UNIQUE (nroaula)
)ENGINE = INNODB;

CREATE INDEX idx_idaula ON aulas (idaula);
CREATE INDEX idx_nroaula ON aulas(nroaula);

INSERT INTO aulas(nroaula,usuario)VALUES
('301','USU'),
('1','USU'),
('2','USU'),
('3','USU');

SELECT * FROM aulas;

-- ********* HORARIOS *********
DROP TABLE horarios;
CREATE TABLE horarios 
(
	idhorario			INT AUTO_INCREMENT PRIMARY KEY,
	idseccion			INT 			NOT NULL,
	dia					VARCHAR(10) NOT NULL,	
	iddetallecurso		INT 			NOT NULL,
	horainicio			TIME 			NOT NULL,
	horatermino			TIME 			NOT NULL,
	idaula				INT 			NOT NULL,
	fecharegistro		DATE			NOT NULL DEFAULT NOW(),
	usuario				VARCHAR(20)	NOT NULL,
	estado				CHAR(1)		NOT NULL DEFAULT '1',
	CONSTRAINT fk_idseccion_hor FOREIGN KEY (idseccion) REFERENCES secciones (idseccion),
	CONSTRAINT fk_iddetallecurso_hor FOREIGN KEY (iddetallecurso) REFERENCES detallecursos(iddetallecurso),
	CONSTRAINT chk_horatermino_hor CHECK (horatermino > horainicio),
	CONSTRAINT fk_idaula_hor FOREIGN KEY (idaula) REFERENCES aulas(idaula),
	CONSTRAINT uk_horadeinicio_hor UNIQUE (dia,iddetallecurso,horainicio,horatermino,idaula)
)ENGINE INNODB;

CREATE INDEX idx_idhorario ON horarios(idhorario);
CREATE INDEX idx_idseccion ON horarios(idseccion);
CREATE INDEX idx_dias ON horarios(dia);
CREATE INDEX idx_iddetallecurso ON horarios(iddetallecurso);
CREATE INDEX idx_horainicio ON horarios(horainicio);
CREATE INDEX idx_horatermino ON horarios(horatermino);
CREATE INDEX idx_idaula ON horarios(idaula);


INSERT INTO horarios(dia,idseccion,iddetallecurso,horainicio,horatermino,idaula,usuario)VALUES
('LUNES',1,1,'8:00','9:00',1,'ADMIN'),('LUNES',2,2,'9:00','10:00',1,'ADMIN'),('LUNES',4,1,'10:00','11:00',1,'ADMIN'),('LUNES',5,2,'12:00','13:00',1,'ADMIN'),
('LUNES',7,2,'13:00','14:00',1,'ADMIN'),('LUNES',8,2,'14:00','15:00',1,'ADMIN'),('LUNES',10,1,'15:00','16:00',1,'ADMIN'),('LUNES',11,2,'16:00','17:00',1,'ADMIN'),
('LUNES',12,1,'17:00','18:00',1,'ADMIN'),('LUNES',13,2,'1:00','2:00',1,'ADMIN');

SELECT * FROM horarios; -- grados order by grado asc

/*****************************************************************************
******************************** ACCESOS *************************************
*****************************************************************************/

CREATE TABLE accesos
(
	idacceso		INT AUTO_INCREMENT PRIMARY KEY,
	codigoacceso	VARCHAR(10) NOT NULL,
	nombreacceso 	VARCHAR(20) NOT NULL,
	CONSTRAINT uk_codigoacceso_acc UNIQUE (codigoacceso),
	CONSTRAINT uk_nombreacceso_acc UNIQUE (nombreacceso)
)ENGINE = INNODB;
CREATE INDEX idx_idacceso ON accesos(idacceso);
CREATE INDEX idx_codigoacceso ON accesos(codigoacceso);
CREATE INDEX idx_nombreacceso ON accesos(nombreacceso);
INSERT INTO accesos(codigoacceso,nombreacceso) VALUES
	('ACC001','MODIFICAR ALUMNOS'),
	('ACC002','MODIFICAR PERSONAL'),
	('ACC003','ELIMNAR ALUMNOS');
SELECT * FROM accesos;

/*****************************************************************************
******************************** USUARIOS ************************************
*****************************************************************************/
CREATE TABLE usuarios
(
	idusuario			INT AUTO_INCREMENT PRIMARY KEY,
	nomusuario 			VARCHAR(20)	NOT NULL,
	claveacceso			VARCHAR(60)	NOT NULL,
	origentabla			VARCHAR(30) NOT NULL,
	origenid				INT 		NOT NULL,
	fecharegistro		DATE 		NOT NULL DEFAULT NOW(),
	usuario				VARCHAR(20)	NOT NULL,
	estado				CHAR(1)	NOT NULL DEFAULT '1',
	CONSTRAINT uk_nomusuarios_usu UNIQUE (nomusuario)
)ENGINE = INNODB;
CREATE INDEX idx_idusuario ON usuarios(idusuario);
CREATE INDEX idx_nomusuario ON usuarios(nomusuario);
CREATE INDEX idx_origentabla ON usuarios (origentabla);
CREATE INDEX idx_origenid ON usuarios(origenid);
INSERT INTO usuarios(nomusuario,claveacceso,origentabla,origenid,usuario) VALUES
	('MARC101','MARQUITOS','ALUMNOS',1,'ADMIN'),
	('MARCIA101','CIAMAR','ALUMNOS',2,'ADMIN');
SELECT * FROM	usuarios;

/*****************************************************************************
******************************** FUNCIONES ***********************************
*****************************************************************************/

CREATE TABLE funciones
(
	idfuncion		INT AUTO_INCREMENT PRIMARY KEY,
	idusuario		INT NOT NULL,
	idacceso			INT NOT NULL,
	permiso			CHAR(2) NOT NULL,
	fecharegistro	DATE NOT NULL DEFAULT NOW(),
	usuario			VARCHAR(20) NOT NULL,
	estado 			CHAR(1) NOT NULL DEFAULT '1',
	CONSTRAINT fk_idusuario_fun	FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario),
	CONSTRAINT fk_accesos_fun FOREIGN KEY (idacceso) REFERENCES accesos(idacceso)
) ENGINE = INNODB;
CREATE INDEX idx_idfuncion ON funciones(idfuncion);
CREATE INDEX idx_idusuario ON funciones(idusuario);
CREATE INDEX idx_idacceso ON funciones(idacceso);
INSERT INTO funciones(idusuario,idacceso,permiso,usuario)VALUES
	(1,1,'SI','ADMIN'),(2,2,'NO','ADMIN');
SELECT * FROM funciones;

/*****************************************************************************
******************************** LIBROS **************************************
*****************************************************************************/

CREATE TABLE libros
(

	idlibro			INT AUTO_INCREMENT PRIMARY KEY,
	codigolibro		VARCHAR(10) NOT NULL,
	libronombre		VARCHAR(30)	NOT NULL,
	libroautor		VARCHAR(40)	NOT NULL,
	librogrado		VARCHAR(10) NOT NULL,
	fechaingreso	DATE NOT NULL,
	cantidadingreso	INT NOT NULL DEFAULT '0',
	fechasalida			DATE NOT NULL, 
	cantidadsalida		INT NOT NULL DEFAULT '0',
	cantidadsaldo		INT AS(cantidadingreso-cantidadsalida),
	fecharegistro		DATE NOT NULL DEFAULT NOW(),
	usuario			VARCHAR(20),
	estado			CHAR(1)	NOT NULL DEFAULT '1',
	CONSTRAINT uk_libronombre_lib UNIQUE(libronombre),
	CONSTRAINT uk_codigolibro_lib UNIQUE(codigolibro)
)ENGINE = INNODB;


CREATE INDEX idx_idlibro ON libros(idlibro);
CREATE INDEX idx_codigolibro ON libros(codigolibro);
CREATE INDEX idx_libronombre ON libros(libronombre);
CREATE INDEX idx_libroautor ON libros(libroautor);
CREATE INDEX idx_librogrado ON libros(librogrado);
INSERT INTO libros(codigolibro,libronombre,libroautor,librogrado,fechaingreso,cantidadingreso,fechasalida,cantidadsalida,usuario) VALUES
	('LB001','MATEMÁTICAS','EDITORIAL BRUÑO','PRIMERO','2023-05-24',15,'2023-05-26',3,'ADMIN'),
	('LB002','COMUNICACIÓN','EDITORIAL BRUÑO','PRIMERO','2023-05-25',20,'2023-05-27',3,'ADMIN');
SELECT * FROM	libros;

/*****************************************************************************
******************************** MOVIMIENTOS *****************************
*****************************************************************************/

CREATE TABLE movimientos
(
	idusuario		INT AUTO_INCREMENT PRIMARY KEY,
	idalumno			INT NOT NULL,
	idlibro			INT NOT NULL,
	fecha 			DATE NOT NULL,
	ingresocantidad	INT NOT NULL DEFAULT '0',
	salidacantidad		INT NOT NULL DEFAULT '0',
	devolucionfecha	DATE NULL,
	fecharegistro		DATE NOT NULL DEFAULT NOW(),
	usuario				VARCHAR(20) NOT NULL,
	estado				CHAR(1) NOT NULL DEFAULT '1',
	CONSTRAINT fk_idalumno_mov FOREIGN KEY(idalumno) REFERENCES alumnos(idalumno),
	CONSTRAINT fk_idlibro_mov  FOREIGN KEY(idlibro) REFERENCES libros(idlibro)
)ENGINE = INNODB;

CREATE INDEX idx_usuario ON movimientos(idusuario);
CREATE INDEX idx_idalumno ON movimientos(idlibro);
CREATE INDEX idx_fecha ON movimientos(fecha);
INSERT INTO movimientos(idalumno,idlibro,fecha,ingresocantidad,salidacantidad,usuario)VALUES
	(1,1,'2023-05-24',1,1,'ADMIN'),(1,2,'2023-05-24',1,1,'ADMIN');
SELECT * FROM movimientos;

/*****************************************************************************
******************************** ESTADO DE SALUD *****************************
*****************************************************************************/

DROP TABLE estadossalud;
CREATE TABLE estadossalud
(
	idestadosalud		INT AUTO_INCREMENT PRIMARY KEY,
	codigoregistro		VARCHAR(10) NOT NULL,
	idalumno				INT NOT NULL,
	edad					CHAR(2)	NOT NULL,
	enfermedad 			TEXT NULL,
	alergias				TEXT NULL,
	traumas				TEXT NULL,
	vacunas 				TEXT NULL,
	fecharegistro		DATE NOT NULL DEFAULT NOW(),
	usuario				VARCHAR(20) NOT NULL,
	estado				CHAR(1) NOT NULL DEFAULT '1',
	CONSTRAINT uk_cdregistro_ests UNIQUE(codigoregistro)
)ENGINE = INNODB;

CREATE INDEX idx_edad ON estadossalud(edad);
INSERT INTO estadossalud(idalumno,codigoregistro,edad,enfermedad,alergias,traumas,vacunas,usuario)VALUES
		(1,'ES001','12','niguna','ninguna','ninguna','pfiser','ADMIN');
SELECT * FROM estadossalud;

/*****************************************************************************
******************************** TRAJES **************************************
*****************************************************************************/
DROP TABLE triajes;
CREATE TABLE triajes
(
	idtriaje			INT AUTO_INCREMENT PRIMARY KEY,
	idestadosalud	INT NOT NULL,
	fecha				DATE NOT NULL,
	peso				DECIMAL(6,3) NOT NULL,
	talla				DECIMAL(3,2) NOT NULL,
	observaciones 	TEXT NOT NULL,
	otros				TEXT NOT NULL,
	tipocontrol		TEXT NOT NULL,
	resultado		TEXT NOT NULL,
	fecharegistro 	DATE NOT NULL DEFAULT NOW(),
	usuario			VARCHAR(20) NOT NULL,
	estado			CHAR(1) NOT NULL DEFAULT '1',
	CONSTRAINT fk_idestadosalud_tri FOREIGN KEY (idestadosalud) REFERENCES estadossalud(idestadosalud)
)ENGINE = INNODB;
CREATE INDEX idx_idtriaje ON triajes(idtriaje);
CREATE INDEX idx_fecha ON triajes(fecha);
CREATE INDEX idx_idestadosalud ON triajes(idestadosalud);
INSERT INTO triajes (idestadosalud,fecha,peso,talla,observaciones,otros,tipocontrol,resultado,usuario)VALUES
(1,'2003-125-05',80.200,1.70,'NIGUNA','NIGUNO','NINGUNO','NINGUNO','USU');
SELECT * FROM triajes;

/*****************************************************************************
******************************** MATRICULAS **************************************
*****************************************************************************/

CREATE TABLE matriculas
(
	idmatricula 		INT AUTO_INCREMENT PRIMARY KEY,
	nromatricula		VARCHAR(10) NOT NULL,
	idalumno				INT NOT NULL,
	periodomatricula	YEAR NOT NULL,
	cmodularbefore	VARCHAR(10) NOT NULL,
	colegioprocedencia	VARCHAR(50) NOT NULL,
	idtriaje				INT NOT NULL,
	fecharegistro		DATE NOT NULL DEFAULT NOW(),
	usuario				VARCHAR(20) NOT NULL,
	estado				CHAR(1) NOT NULL DEFAULT '1',
	CONSTRAINT uk_nromatricula_ma UNIQUE(nromatricula),
	CONSTRAINT fk_idalumno_ma FOREIGN KEY(idalumno) REFERENCES alumnos(idalumno),
	CONSTRAINT fk_idtriaje_ma FOREIGN KEY(idtriaje) REFERENCES triajes(idtriaje)
)ENGINE = INNODB;
CREATE INDEX idx_idmatricula ON matriculas(idmatricula);
CREATE INDEX idx_nromatricula ON matriculas(nromatricula);
CREATE INDEX idx_idalumno ON matriculas(idalumno);
CREATE INDEX idx_idtriaje ON matriculas(idtriaje);

INSERT INTO matriculas(nromatricula,idalumno,periodomatricula,cmodularbefore,colegioprocedencia,idtriaje,usuario) VALUES
	('MA001',1,'2003','12231214','AURELI MOISES FLORES GONZALES',1,'USU');
	
SELECT * FROM matriculas;

/*****************************************************************************
******************************** CLASES **************************************
*****************************************************************************/

DROP TABLE clases;
CREATE TABLE clases
(
	idclase			INT AUTO_INCREMENT PRIMARY KEY,
	idusuario		INT NOT NULL,
	idalumno			INT NOT NULL,
	iddetallecurso	INT NOT NULL,
	contenidoclase	TEXT NOT NULL,
	asistencia		DECIMAL(3,1) NOT NULL,
	evcuaderno		DECIMAL(3,1) NOT NULL,
	evoral			DECIMAL(3,1) NOT NULL,
	notaclase		DECIMAL(3,1) NOT NULL,
	fechaclase		DATE NOT NULL DEFAULT NOW(),
	fecharegistro	DATE NOT NULL DEFAULT NOW(),
	usuario 			VARCHAR(20) NOT NULL,
	estado			CHAR(1) NOT NULL DEFAULT '1',
	CONSTRAINT fk_idusuario_clas FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario),
	CONSTRAINT fk_idalumno_clas FOREIGN KEY(idalumno) REFERENCES alumnos(idalumno),
	CONSTRAINT fk_idcurso_clas FOREIGN KEY(iddetallecurso) REFERENCES detallecursos(iddetallecurso),
	CONSTRAINT chk_asistencia_clas CHECK(asistencia>=0.0 AND asistencia <=20.0),
	CONSTRAINT chk_evcuaderno_clas CHECK(evcuaderno>=0.0 AND evcuaderno <=20.0),
	CONSTRAINT chk_evoral_clas CHECK(evoral>=0.0 AND evoral <= 20.0),
	CONSTRAINT chk_notaclase_clas CHECK(notaclase>0.0 AND notaclase <= 20.0),
	CONSTRAINT uk_fechaclase_clas UNIQUE(idalumno,fechaclase)
)ENGINE = INNODB;
CREATE INDEX idx_idclase ON clases(idclase);
CREATE INDEX idx_idusuario ON clases(idusuario);
CREATE INDEX idx_idalumno ON clases(idalumno);
CREATE INDEX idx_idcurso ON clases(iddetallecurso);
CREATE INDEX idx_asistencia ON clases(asistencia);
CREATE INDEX iedx_evcuaderno ON clases(evcuaderno);
CREATE INDEX idx_evoral ON clases(evoral);
CREATE INDEX idx_notaclase ON clases(notaclase);
CREATE INDEX idx_fechaclase ON clases(fechaclase);

INSERT INTO clases(idusuario,idalumno,iddetallecurso,contenidoclase,asistencia,evcuaderno,evoral,notaclase,fechaclase,usuario)VALUES
	(1,1,1,'-----------',10.1,12.4,13.6,15.4,'2023-05-24','ADMIN'),
	(1,1,1,'-----------',10.1,12.4,13.6,15.4,'2023-05-23','ADMIN');
	
SELECT * FROM clases;

