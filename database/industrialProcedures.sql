USE industrialbd;

/*********************************************************************
********************* TURNOS *****************************************
*********************************************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_turnos()
BEGIN
	SELECT idturno,turno
	FROM turnos
	WHERE estado = '1'
	ORDER BY turno ASC;
END $$

CALL spu_listar_turnos();

/*********************************************************************
********************* GRADOS *****************************************
*********************************************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_grados(IN idturno_ INT)
BEGIN
	SELECT idgrado,grado 
	FROM grados
	WHERE idturno = idturno_
	ORDER BY FIELD(grado,'PRIMERO','SEGUNDO','TERCERO','CUARTO','QUINTO');
END $$

CALL  spu_listar_grados(2);

/************************************************************************
************************* SECCIONES *************************************
*************************************************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_secciones(IN idgrado_ INT)
BEGIN 
	SELECT idseccion,seccion
	FROM secciones
	WHERE idgrado = idgrado_
	ORDER BY seccion ASC;
END $$
DELIMITER ;

CALL spu_listar_secciones(2);

DELIMITER $$
CREATE PROCEDURE spu_insertar_secciones
(
	IN idgrado_		INT,
	IN seccion_		CHAR(1),
	IN usuario_		VARCHAR(20)
)
BEGIN 
	INSERT INTO secciones(idgrado,seccion,usuario)VALUES
		(idgrado_,seccion_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_secciones(6,'G','ADMIN');
SELECT * FROM secciones;

DELIMITER $$
CREATE PROCEDURE spu_modificar_secciones
(
	IN idseccion_	INT,
	IN idgrado_		INT,
	IN seccion_		CHAR(1),
	IN usuario_		VARCHAR(20)
)
BEGIN
	UPDATE secciones SET
	idgrado = idgrado_,
	seccion = seccion_,
	usuario = usuario_
	WHERE idseccion = idseccion_;
END $$
DELIMITER ;

CALL spu_modificar_secciones(9,4,'I','ADMIN2');

DELIMITER $$
CREATE PROCEDURE spu_eliminar_secciones(IN idseccion_ INT)
BEGIN
	UPDATE secciones SET
	estado = '0'
	WHERE idseccion = idseccion_;
END $$
DELIMITER ;

CALL spu_eliminar_secciones(4);

/*********************************************
**************** TALLERES ********************
**********************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_talleres()
BEGIN
	SELECT idtaller,taller
	FROM talleres
	WHERE estado = '1'
	ORDER BY taller ASC;
END $$
DELIMITER ;

CALL spu_listar_talleres();

DELIMITER $$
CREATE PROCEDURE spu_insertar_talleres
(
	IN taller_		VARCHAR(40),
	IN usuario_		VARCHAR(20)
) 
BEGIN
 INSERT INTO talleres(taller,usuario)VALUES
		(taller_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_talleres('MECANICA AUTOMITRÍZ','ADMIN');

DELIMITER $$
CREATE PROCEDURE spu_modificar_talleres
(
	IN idtaller_		INT,
	IN taller_			VARCHAR(40),
	IN usuario_			VARCHAR(20)
)
BEGIN
	UPDATE talleres SET
		taller = taller_,
		usuario = usuario_
		WHERE idtaller = idtaller_;
END $$
DELIMITER ;

CALL spu_modificar_talleres(3,'INDUSTRIA DE VESTIDO','ADMIN');

 /* AGREGAR UN CAMPO DE FECHA DE MODIFICACIÓN Y USUARIO DE MODIFCACIÓN, QUE NO MODIFIQUE LA FECHA DE REGISTRO NI AL USUARIO DE REGISTRO
	PERO QUE SI LA ACTUALISE LA FECHA DE MODIFICACIÓN Y EL USUARIO DE MODIFICACIÓN*/

DELIMITER $$
CREATE PROCEDURE spu_eliminar_talleres(IN idtaller_ INT)
BEGIN
	UPDATE talleres SET
		estado = '0'
	WHERE idtaller = idtaller_;
END $$
DELIMITER ;

CALL spu_eliminar_talleres(3);

  /********************************************************
******************* PAR DE PADRES *************************
***********************************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_parpadres()
BEGIN
	SELECT	idparpadre,
				apellidospadre,
				nombrespadre,
				documento_tipo,
				documento_nro,
				fechanacimiento,
				direccion,
				correo,
				celular,
				gradoinstruccion,
				ocupacion,
				convivencia,
				religion,
				apellidosmadre,
				nombresmadre,
				documento_tipoM,
				documento_nroM,
				fechanacimientoM,
				direccionM,
				correoM,
				celularM,				
				gradoinstruccionM,
				ocupacionM,
				convivenciaM,
				religionM
	FROM parpadres
	WHERE estado = '1'
	ORDER BY 2,13 ASC;
END$$
DELIMITER ;

CALL spu_listar_parpadres();

DELIMITER $$
CREATE PROCEDURE spu_insertar_parpadres
(
				IN apellidospadre_	VARCHAR(40),
				IN nombrespadre_		VARCHAR(40),
				IN documento_tipo_	VARCHAR(30),
				IN documento_nro_		VARCHAR(20),
				IN fechanacimiento_ 	DATE,
				IN direccion_			VARCHAR(60),
				IN correo_				VARCHAR(60),
				IN celular_				CHAR(9),
				IN gradoinstruccion_ 	VARCHAR(20),
				IN ocupacion_			VARCHAR(20),
				IN convivencia_		CHAR(2),
				IN religion_			VARCHAR(20),
				IN apellidosmadre_	VARCHAR(40),
				IN nombresmadre_		VARCHAR(40),
				IN documento_tipoM_	VARCHAR(30),
				IN documento_nroM_	VARCHAR(20),
				IN fechanacimientoM_	DATE,
				IN direccionM_			VARCHAR(60),
				IN correoM_				VARCHAR(60),
				IN celularM_			CHAR(9),
				IN gradoinstruccionM_ VARCHAR(20),
				IN ocupacionM_			VARCHAR(20),
				IN convivenciaM_		CHAR(2),
				IN religionM_			VARCHAR(20),
				IN usuario_				VARCHAR(20)
)
BEGIN
	INSERT INTO parpadres(apellidospadre,nombrespadre,documento_tipo,documento_nro,fechanacimiento,direccion,correo,celular,gradoinstruccion,ocupacion,convivencia,religion,
	apellidosmadre,nombresmadre,documento_tipoM,documento_nroM,fechanacimientoM,direccionM,correoM,celularM,gradoinstruccionM,ocupacionM,convivenciaM,religionM,usuario) VALUES
	(apellidospadre_,nombrespadre_,documento_tipo_,documento_nro_,fechanacimiento_,direccion_,correo_,celular_,gradoinstruccion_,ocupacion_,convivencia_,religion_,
	apellidosmadre_,nombresmadre_,documento_tipoM_,documento_nroM_,fechanacimientoM_,direccionM_,correoM_,celularM_,gradoinstruccionM_,ocupacionM_,convivenciaM_,religion_,usuario_); 
END $$
DELIMITER ;

CALL spu_insertar_parpadres('TIPIÁN ROMÁN','MANUEL ALEXANDER','DNI','12345678974852963122','1956-12-12','AV LOS JAZMINES','mau@gmail.com','956874123','SECUNDARIO','ALBAÑIL','SI','MORMÓN',
'VALENZUEA ROBLES','DIANA ALEXA','CARNET DE EXTRANJERÍA','12345678974852963123','1998-10-15','AV LOS JAZMINES','dialax@gmail.com','852741963','SUPERIOR','TECNICA CONTABLE','SI','MORMÓN','ADMIN');

DELIMITER $$
CREATE PROCEDURE spu_modificar_parpadres
(
				IN idparpadre_			INT,
				IN apellidospadre_	VARCHAR(40),
				IN nombrespadre_		VARCHAR(40),
				IN documento_tipo_	VARCHAR(30),
				IN documento_nro_		VARCHAR(20),
				IN fechanacimiento_ 	DATE,
				IN direccion_			VARCHAR(60),
				IN correo_				VARCHAR(60),
				IN celular_				CHAR(9),
				IN gradoinstruccion_ VARCHAR(20),
				IN ocupacion_			VARCHAR(20),
				IN convivencia_		CHAR(2),
				IN religion_			VARCHAR(20),
				IN apellidosmadre_	VARCHAR(40),
				IN nombresmadre_		VARCHAR(40),
				IN documento_tipoM_	VARCHAR(30),
				IN documento_nroM_	VARCHAR(20),
				IN fechanacimientoM_	DATE,
				IN direccionM_			VARCHAR(60),
				IN correoM_				VARCHAR(60),
				IN celularM_			CHAR(9),
				IN gradoinstruccionM_ VARCHAR(20),
				IN ocupacionM_			VARCHAR(20),
				IN convivenciaM_		CHAR(2),
				IN religionM_			VARCHAR(20),
				IN usuario_				VARCHAR(20)
)
BEGIN
	UPDATE parpadres SET
				apellidospadre = apellidospadre_,
				nombrespadre = nombrespadre_,
				documento_tipo = documento_tipo_,
				documento_nro = documento_nro_,
				fechanacimiento = fechanacimiento_,
				direccion = direccion_,
				correo = correo_,
				celular = celular_,
				gradoinstruccion = gradoinstruccion_,
				ocupacion = ocupacion_,
				convivencia = convivencia_,
				religion = religion_,
				apellidosmadre = apellidosmadre_,
				nombresmadre = nombresmadre_,
				documento_tipoM = documento_tipoM_,
				documento_nroM = documento_nroM_,
				fechanacimientoM = fechanacimientoM_,
				direccionM = direccionM_,
				correoM = correoM_,
				celularM = celularM_,			
				gradoinstruccionM = gradoinstruccionM_,
				ocupacionM = ocupacionM_,
				convivenciaM = convivenciaM_,
				religionM = religionM_,
				usuario = usuario_
				WHERE idparpadre = idparpadre_;
END $$
DELIMITER ;

CALL spu_modificar_parpadres(3,'TIPIÁN ROMÁN','MANUEL ALEXANDER','DNI','12345678974852963148','1956-12-12','AV LOS JAZMINES','mau@gmail.com','956874123','SECUNDARIO','ALBAÑIL','SI','MORMÓN',
'VALENZUEA ROBLES','DIANA ALEXA','CARNET DE EXTRANJERÍA','12345678974852963123','1998-10-15','AV LOS JAZMINES','dialexa@gmail.com','852741963','SUPERIOR','CONTADORA','SI','MORMÓN','ADMIN2');

DELIMITER $$
CREATE PROCEDURE spu_eliminar_parpadres(IN idparpadre_ INT)
BEGIN
	UPDATE parpadres SET
	estado = '0'
	WHERE idparpadre = idparpadre_;
END $$
DELIMITER ;

CALL spu_eliminar_parpadres(3);

/*********************************************
**************** APODERADOS ******************
**********************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_apoderados()
BEGIN
	SELECT	idapoderado,
				apellidos,
				nombres,	
				documento_tipo,
				documento_nro,
				sexo,	
				fechanacimiento,					
				direccion,
				correo,
				celular,
				parentesco		
	FROM apoderados
	WHERE estado = '1'
	ORDER BY apellidos ASC;
END $$
DELIMITER ;

CALL spu_listar_apoderados();

DELIMITER $$
CREATE PROCEDURE spu_insertar_apoderados
(
	IN apellidos_		VARCHAR(40),
	IN nombres_			VARCHAR(40),
	IN documento_tipo_	VARCHAR(30),
	IN documento_nro_	VARCHAR(20),
	IN sexo_				CHAR(1),
	IN fechanacimiento_ DATE,
	IN direccion_		VARCHAR(60),
	IN correo_			VARCHAR(60),
	IN celular_			CHAR(9),
	IN parentesco_		VARCHAR(10),
	IN usuario_			VARCHAR(20)
)
BEGIN
	INSERT INTO apoderados(apellidos,nombres,documento_tipo,documento_nro,sexo,fechanacimiento,direccion,correo,celular,parentesco,usuario)VALUES
		(apellidos_,nombres_,documento_tipo_,documento_nro_,sexo_,fechanacimiento_,direccion_,correo_,celular_,parentesco_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_apoderados('PACHAS LOYOLA','WILFEDO ALFREDO','DNI','963789123','M','2000-12-01','AV ARENALES #313','paco@gmail.com','111222333','PAPÁ','ADMIN3');

DELIMITER $$
CREATE PROCEDURE spu_modificar_apoderados
(
	IN idapoderado_	INT,
	IN apellidos_		VARCHAR(40),
	IN nombres_			VARCHAR(40),
	IN documento_tipo_ VARCHAR(30),
	IN documento_nro_	VARCHAR(20),
	IN sexo_				CHAR(1),
	IN fechanacimiento_ DATE,
	IN direccion_		VARCHAR(60),
	IN correo_			VARCHAR(60),
	IN celular_			CHAR(9),
	IN parentesco_		VARCHAR(10),
	IN usuario_			VARCHAR(20)
)
BEGIN
	UPDATE apoderados SET
		apellidos = apellidos_, 
		nombres = nombres_,
		documento_tipo = documento_tipo_,
		documento_nro = documento_nro_,
		sexo = sexo_,
		fechanacimiento = fechanacimiento_,		
		direccion = direccion_,
		correo = correo_,
		celular = celular_,
		parentesco = parentesco_,
		usuario = usuario_
		WHERE idapoderado = idapoderado_;
END $$
DELIMITER ;

CALL spu_modificar_apoderados(2,'MELO VALERIO','LORENA MERCEDES','DNI','12378945','F','1995-12-01','AV. PRIMAVERA','lorenamer@gmial.com','999666333','PRIMA','ADMIN');

DELIMITER $$
CREATE PROCEDURE spu_eliminar_apoderados(IN idapoderado_ INT)
BEGIN
	UPDATE apoderados SET
	estado = '0'
	WHERE idapoderado = idapoderado_;
END $$
DELIMITER ;

CALL spu_eliminar_apoderados(3);


/*******************************************************
**************** TIPOS PERSONAL ************************
*******************************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_tpersonal()
BEGIN
	SELECT idtipopersonal,tipopersonal
	FROM tipospersonal
	WHERE estado = '1'
	ORDER BY tipopersonal ASC;
END $$
DELIMITER ;

CALL spu_listar_tpersonal();
 
DELIMITER $$ 
CREATE PROCEDURE spu_insertar_tpersonal
(
	IN tipopersonal_ 	VARCHAR(20),
	IN usuario_			VARCHAR(20)
)
BEGIN 
	INSERT INTO tipospersonal(tipopersonal,usuario) VALUES 
		(tipopersonal_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_tpersonal('AUXILIAR','ADMIN');

DELIMITER $$
CREATE PROCEDURE spu_modificar_tpersonal
(
	IN idtipopersonal_ INT,
	IN tipopersonal_	VARCHAR(20),
	IN usuario_			VARCHAR(20)
)
BEGIN
	UPDATE tipospersonal SET
		tipopersonal = tipopersonal_,
		usuario = usuario_
		WHERE idtipopersonal = idtipopersonal_;
END $$
DELIMITER ;

CALL spu_modificar_tpersonal(3,'SUBDIRECTOR','ADMIN2');

DELIMITER $$
CREATE PROCEDURE spu_eliminar_tpersonal(IN idtipopersonal_ INT)
BEGIN
	UPDATE tipospersonal SET
		estado = '0'
	WHERE idtipopersonal = idtipopersonal_;
END $$
DELIMITER ;

CALL spu_eliminar_tpersonal(3);

/*********************************************************************
********************** PERSONAL **************************************
*********************************************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_personal()
BEGIN 
	SELECT tper.tipopersonal,per.apellidos,per.nombres,per.documento_tipo,per.documento_nro,per.sexo,per.fechanacimiento,per.direccion,per.celular,per.correo
	FROM personal AS per
	INNER JOIN tipospersonal AS tper ON tper.idtipopersonal = per.idtipopersonal
	WHERE per.estado = '1'
	ORDER BY apellidos ASC;
END $$
DELIMITER ;

CALL spu_listar_personal();

DELIMITER $$
CREATE PROCEDURE spu_insertar_personal
(
	IN idtipopersonal_ 	INT,
	IN apellidos_			VARCHAR(40),
	IN nombres_				VARCHAR(40),
	IN documento_tipo_	VARCHAR(30),
	IN documento_nro_		VARCHAR(20),	
	IN sexo_					CHAR(1),
	IN fechanacimiento_	DATE,
	IN direccion_			VARCHAR(60),
	IN correo_				VARCHAR(60),
	IN celular_				CHAR(9),
	IN usuario_				VARCHAR(20)	
)
BEGIN
	INSERT INTO personal(idtipopersonal,apellidos,nombres,documento_tipo,documento_nro,sexo,fechanacimiento,direccion,correo,celular,usuario) VALUES
		(idtipopersonal_,apellidos_,nombres_,documento_tipo_,documento_nro_,sexo_,fechanacimiento_,direccion_,correo_,celular_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_personal(3,'ROMANI CASTILLA','CARMEN ROSA','DNI','56457880','F','1999-12-01','AV. LOS SAUCES #341','carminroman@gmail.com','789456789','ADMIN');

DELIMITER $$
CREATE PROCEDURE spu_modificar_personal
(
	IN idpersonal_			INT,
	IN idtipopersonal_	INT,
	IN apellidos_			VARCHAR(40),
	IN nombres_				VARCHAR(40),
	IN documento_tipo_	VARCHAR(30),
	IN documento_nro_		VARCHAR(20),
	IN sexo_					CHAR(1),
	IN fechanacimiento_	DATE,
	IN direccion_			VARCHAR(60),
	IN correo_				VARCHAR(60),
	IN celular_				CHAR(9),
	IN usuario_				VARCHAR(20)
)
BEGIN
	UPDATE personal SET
		idtipopersonal = idtipopersonal_,
		apellidos = apellidos_,
		nombres = nombres_,
		documento_tipo = documento_tipo_,
		documento_nro = documento_nro_,
		sexo = sexo_,
		fechanacimiento = fechanacimiento_,
		direccion = direccion_,
		correo = correo_,
		celular = celular_,
		usuario = usuario_
		WHERE idpersonal = idpersonal_;
END $$
DELIMITER ;

CALL spu_modificar_personal(2,1,'SUNCION MARTINEZ','CESAR NOLBERTO','DNI','12457855','M','1996-11-13','UNA CUADRA DE LA PLAZA DE ARMAS DE PUEBO NUEVO','suncer@gmail.com','111222333','ADMIN');
 
DELIMITER $$
CREATE PROCEDURE spu_eliminar_personal(IN idpersonal_ INT)
BEGIN
	UPDATE personal SET
	estado = '0'
	WHERE idpersonal = idpersonal_;
END $$
DELIMITER ; 

CALL spu_eliminar_personal(3);


/***********************************************************
********************** CURSOS ******************************
************************************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_cursos()
BEGIN
	SELECT idcurso,curso
	FROM cursos
	WHERE estado = '1'
	ORDER BY curso ASC; 
END $$
DELIMITER ;

CALL spu_listar_cursos();

DELIMITER $$
CREATE PROCEDURE spu_insertar_cursos
(
	IN curso_		VARCHAR(40),
	IN usuario_		VARCHAR(20)
)
BEGIN
	INSERT INTO cursos (curso,usuario)VALUES
		(curso_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_cursos('CIENCIAS SOCIALES','ADMIN');

DELIMITER $$
CREATE PROCEDURE spu_modificar_cursos
(
	IN idcurso_ 	INT,
	IN	curso_		VARCHAR(40),
	IN usuario_		VARCHAR(20)
)
BEGIN
	UPDATE cursos SET
	curso = curso_,
	usuario = usuario_
	WHERE idcurso = idcurso_;
END $$
DELIMITER ;

CALL spu_modificar_cursos(4,'BIOLOGÍA','USU1');

DELIMITER $$
CREATE PROCEDURE spu_eliminar_cursos(IN idcurso_ INT)
BEGIN
	UPDATE cursos SET
	 estado = '0'
	 WHERE idcurso = idcurso_;
END $$ 
DELIMITER ;

CALL spu_eliminar_cursos(2);

/**********************************************************************************
************************** DETALLE DE CURSOS **************************************
***********************************************************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_dtcursos()
BEGIN
	SELECT cur.curso,tper.tipopersonal,per.apellidos,per.nombres,dtc.fechainicio,dtc.fechatermino,dtc.contenido
	FROM detallecursos AS dtc
	INNER JOIN cursos AS cur ON cur.idcurso = dtc.idcurso
	INNER JOIN personal AS per ON per.idpersonal = dtc.idpersonal
	INNER JOIN tipospersonal AS tper ON tper.idtipopersonal = per.idpersonal
	WHERE dtc.estado = '1'
	ORDER BY cur.curso ASC;
END $$
DELIMITER ;

CALL spu_listar_dtcursos();

DELIMITER $$
CREATE PROCEDURE spu_insertar_dtcursos
(
	IN idcurso_		INT,
	IN idpersonal_	INT,
	IN fechainicio_	DATE,
	IN fechatermino_	DATE,
	IN contenido_		TEXT,
	IN usuario_		VARCHAR(20)
)
BEGIN 
	INSERT INTO detallecursos(idcurso,idpersonal,fechainicio,fechatermino,contenido,usuario) VALUES
	(idcurso_,idpersonal_,fechainicio_,fechatermino_,contenido_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_dtcursos(1,1,'2023-12-28','2024-01-26','cursos novedosos','USU1');

DELIMITER $$
CREATE PROCEDURE spu_modificar_dtcursos
(
	IN iddetallecurso_		INT,
	IN idcurso_					INT,
	IN idpersonal_				INT,
	IN fechainicio_			DATE,
	IN	fechatermino_			DATE,
	IN contenido_ 				TEXT,
	IN usuario_					VARCHAR(20)
)
BEGIN
	UPDATE detallecursos SET
	idcurso = idcurso_,
	idpersonal = idpersonal_,
	fechainicio = fechainicio_,
	fechatermino = fechatermino_,
	contenido = contenido_,
	usuario = usuario_
	WHERE iddetallecurso = iddetallecurso_;
END $$
DELIMITER ;

CALL spu_modificar_dtcursos(1,1,1,'2023-06-14','2023-07-14','matemática para alumnos de 3°','USU4');

DELIMITER $$
CREATE PROCEDURE spu_eliminar_dtcursos(IN iddetallecurso_ INT)
BEGIN
	UPDATE detallecursos SET
	estado = '0'
	WHERE iddetallecurso = iddetallecurso_;
END $$
DELIMITER ;

CALL spu_eliminar_dtcursos(2);


/***********************************************
***************** AULAS ************************
**********************************************/

DELIMITER $$
CREATE PROCEDURE spu_listar_aulas()
BEGIN
	SELECT idaula,nroaula
	FROM aulas 
	WHERE estado = '1'
	ORDER BY nroaula+0 ASC;
END$$
DELIMITER ;

CALL spu_listar_aulas();


DELIMITER $$
CREATE PROCEDURE spu_insertar_aulas
(
	IN nroaula_			VARCHAR(30),
	IN usuario_			VARCHAR(20)
)
BEGIN
	INSERT INTO aulas(nroaula,usuario)VALUES
	(nroaula_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_aulas('15','USU'); 

DELIMITER $$
CREATE PROCEDURE spu_modificar_aulas
(
	IN idaula_		INT,
	IN nroaula_		VARCHAR(3),
	IN usuario_		VARCHAR(20)
)
BEGIN 
	UPDATE aulas SET
	nroaula = nroaula_,
	usuario = usuario_
	WHERE idaula = idaula_;
END $$
DELIMITER ;
 
CALL spu_modificar_aulas(1,'302','USU');
 
DELIMITER $$
CREATE PROCEDURE spu_eliminar_aulas(IN idaula_ INT)
BEGIN
	UPDATE aulas SET
	estado = '0'
		WHERE idaula = idaula_;
END $$
DELIMITER ;

CALL spu_eliminar_aulas(2);

/*********************************************
**************** HORARIOS ********************
**********************************************/
DROP PROCEDURE spu_listar_horarios;
DELIMITER $$
CREATE PROCEDURE spu_listar_horarios()
BEGIN 
	SELECT tur.turno,g.grado,secc.seccion,hor.dia,cur.curso,hor.horainicio,hor.horatermino,aul.nroaula
	FROM horarios AS hor
	INNER JOIN secciones AS secc ON secc.idseccion = hor.idseccion
	INNER JOIN grados AS g ON g.idgrado = secc.idgrado
	INNER JOIN turnos AS tur ON tur.idturno = g.idturno
	INNER JOIN detallecursos AS detc ON detc.iddetallecurso = hor.iddetallecurso
	INNER JOIN cursos AS cur ON cur.idcurso = detc.idcurso
	INNER JOIN aulas AS aul ON aul.idaula = hor.idaula
	WHERE hor.estado = '1'
	ORDER BY FIELD(g.grado,'PRIMERO','SEGUNDO','TERCERO','CUARTO','QUINTO'),secc.seccion,FIELD(hor.dia,'LUNES','MARTES','MIERCOLES','JUEVES','VIERNES');
END $$
DELIMITER ;

CALL spu_listar_horarios();


DELIMITER $$
CREATE PROCEDURE spu_insertar_horarios
(
	IN idseccion_ 			INT,
	IN dia_					VARCHAR(10),
	IN iddetallecurso_	INT,
	IN horainicio_			TIME,
	IN horatermino_		TIME,
	IN idaula_				INT,
	IN usuario_				VARCHAR(20)
)
BEGIN
	INSERT INTO horarios
	(idseccion,dia,iddetallecurso,horainicio,horatermino,idaula,usuario) VALUES
	(idseccion_,dia_,iddetallecurso_,horainicio_,horatermino_,idaula_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_horarios(1,'JUEVES',1,'10:30','11:30',1,'USU');

DELIMITER $$
CREATE PROCEDURE spu_modificar_horarios
(
	IN idhorario_		INT,
	IN dia_				VARCHAR(10),
	IN	iddetallecurso_ INT,
	IN horainicio_		TIME,
	IN horatermino_	TIME,
	IN idaula_			INT,
	IN usuario_			VARCHAR(20)
)
BEGIN
	UPDATE horarios SET 
		dia		= dia_,
		iddetallecurso	= iddetallecurso_,
		horainicio = horainicio_,
		horatermino = horatermino_,
		idaula		= idaula_,
		usuario		= usuario_
		WHERE idhorario = idhorario_;
END $$
DELIMITER ;

CALL spu_modificar_horarios(9,'MIERCOLES',2,'07:30','08:30',1,'ADMIN');

DELIMITER $$
CREATE PROCEDURE spu_eliminar_horarios(IN idhorario_ INT)
BEGIN
	UPDATE horarios SET
		estado = '0'
		WHERE idhorario = idhorario_;
END $$
DELIMITER ;

CALL spu_eliminar_horarios(6);

/*****************************************************************************
******************************** usuarios ************************************
*****************************************************************************/
DROP PROCEDURE spu_usuarios_login;
DELIMITER $$
CREATE PROCEDURE spu_usuarios_login(IN nomusuario_ VARCHAR(20))
BEGIN
	SELECT * FROM usuarios 
	WHERE nomusuario = nomusuario_ AND estado = '1';
END$$
DELIMITER ;

SELECT * FROM usuarios;

CALL spu_usuarios_login('MARC101');
UPDATE usuarios SET claveacceso = '$2y$10$2v.ZyNmCJZtKa3b2KofynOAC7ff9AuzYYk5ktUDzsc7LGLJaB2iA.'
WHERE idusuario = 1;

/*****************************************************************************
******************************** MATRICULAS **********************************
*****************************************************************************/

DROP PROCEDURE spu_listar_matriculas;
DELIMITER $$
CREATE PROCEDURE spu_listar_matriculas()
BEGIN
	SELECT ma.nromatricula,ma.periodomatricula,ma.cmodularbefore,ma.colegioprocedencia,ma.apellidos,ma.nombres,ma.documento_tipo,ma.documento_nro,ma.sexo,dist.distrito,ma.direccion,ma.correo,ma.celular,par.apellidospadre,par.nombrespadre,par.documento_tipo,par.documento_nro,par.celular,par.apellidosmadre,par.nombresmadre,par.documento_tipoM,par.documento_nroM,par.celularM,
			apo.apellidos,apo.nombres,apo.documento_tipo,apo.documento_nro,apo.celular
	FROM matriculas AS ma
	INNER JOIN distritos AS dist ON dist.iddistrito = ma.iddistrito
	INNER JOIN parpadres AS par ON par.idparpadre = ma.idparpadre
	INNER JOIN apoderados AS apo ON apo.idapoderado = ma.idapoderado
	WHERE ma.estado = '1'
	ORDER BY ma.apellidos;
END$$
DELIMITER ;

CALL spu_listar_matriculas();

DROP PROCEDURE spu_insertar_matriculas;
DELIMITER $$
CREATE PROCEDURE spu_insertar_matriculas
(
    IN nromatricula_	VARCHAR(10),
    IN periodomatricula_ YEAR(4),
    IN cmodularbefore_	VARCHAR(10),
    IN colegioprocedencia_ VARCHAR(50),
	IN apellidos_		VARCHAR(40),
	IN nombres_			VARCHAR(40),
	IN documento_tipo_ VARCHAR(30),
	IN documento_nro_	 VARCHAR(20),	
	IN sexo_			CHAR(1),
	IN fechanacimiento_	DATE,
	IN iddistrito_		INT,
	IN direccion_	VARCHAR(60),	
	IN correo_		VARCHAR(60),
	IN celular_		CHAR(9),	
	IN religion_		VARCHAR(20),
	IN lenguamaterna_	VARCHAR(20),
	IN lenguasegunda_	VARCHAR(20),
	IN discapacidad_	TEXT,
	IN fechaalta_		DATE,
	IN fechasese_		DATE,
	IN idparpadre_		INT,
	IN idapoderado_  	INT,
	IN usuario_			VARCHAR(20)
)
BEGIN
	/*
	if fechasese_ = '' then convert(varchar(20)) and
		set fechasese_ = 'ACTIVO';
	END IF;*/
	
	INSERT INTO matriculas(nromatricula,periodomatricula,cmodularbefore,colegioprocedencia,apellidos,nombres,documento_tipo,documento_nro,sexo,fechanacimiento,iddistrito,direccion,correo,celular,religion,lenguamaterna,
	lenguasegunda,discapacidad,fechaalta,fechasese,idparpadre,idapoderado,usuario)VALUES
		(nromatricula_,periodomatricula_,cmodularbefore_,colegioprocedencia_,apellidos_,nombres_,documento_tipo_,documento_nro_,sexo_,fechanacimiento_,iddistrito_,direccion_,correo_,celular_,religion_,lenguamaterna_,
		lenguasegunda_,discapacidad_,fechaalta_,fechasese_,idparpadre_,idapoderado_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_matriculas('MA006','2023','123567891','Jose Pardo y Barreda','ROMERO VILLA','GABRIEL ALEJANDRO','DNI','23569846','M','200-03-12',2,'AV. LAS MAGNOLIAS','456@gmail.com','123456789','CATÓLICA','CASTELLANO',
	'NINGUNA','NINGUNA','2023-02-19','',1,2,'ADMIN4');

DROP PROCEDURE spu_modificar_matriculas;
DELIMITER $$
CREATE PROCEDURE spu_modificar_matriculas
(
IN idalumno_		INT,
	IN apellidos_		VARCHAR(40),
	IN nombres_			VARCHAR(40),
	IN documento_tipo_ VARCHAR(30),
	IN documento_nro_	 VARCHAR(20),	
	IN sexo_			CHAR(1),
	IN fechanacimiento_	DATE,
	IN iddistrito_		INT,
	IN direccion_	VARCHAR(60),	
	IN correo_		VARCHAR(60),
	IN celular_		CHAR(9),
	IN idseccion_		INT,
	IN idtaller_		INT,	
	IN religion_		VARCHAR(20),
	IN lenguamaterna_	VARCHAR(20),
	IN lenguasegunda_	VARCHAR(20),
	IN discapacidad_	TEXT,
	IN fechaalta_		DATE,
	IN fechasese_		DATE,
	IN idparpadre_		INT,
	IN idapoderado_  	INT,
	IN usuario_			VARCHAR(20)
)
BEGIN 
	UPDATE matriculas SET
		apellidos = apellidos_,
		nombres = nombres_,
		documento_tipo = documento_tipo_,
		documento_nro = documento_nro_,
		sexo = sexo_,
		fechanacimiento = fechanacimiento_,
		iddistrito = iddistrito_,
		direccion = direccion_,
		correo = correo_,
		celular = celular_,
		idseccion = idseccion_,
		idtaller = idtaller_,
		religion = religion_,
		lenguamaterna = lenguamaterna_,
		lenguasegunda = lenguasegunda_,
		discapacidad = discapacidad_,
		fechaalta = fechaalta_,
		fechasese = fechasese_,
		idparpadre = idparpadre_,
		idapoderado = idapoderado_,
		usuario = usuario_
		WHERE idalumno = idalumno_;
END $$
DELIMITER ;
 
CALL spu_modificar_matriculas (1,'ATUNCAR ','LUCAS ALFREDO','DNI','77068571','M','2003-11-22',1,'AV.SANTA ROSA #541','lucasatuncar1gmail.com','922634773',1,1,'CATOLICO','ESPAÑOL','NO','NIGUNA','2023-05-17','2028-05-17',1,2,'ADMIN');


DROP PROCEDURE spu_eliminar_matriculas;
DELIMITER $$
CREATE PROCEDURE spu_eliminar_matriculas(IN idmatricula_ INT)
BEGIN
	UPDATE matriculas SET 
		estado = '0'
	WHERE idmatricula = idmatricula_;
END$$
DELIMITER ; 

CALL spu_eliminar_matriculas(4);

/**********************************
******** ALUMNOS ******************
**********************************/
DROP PROCEDURE spu_listar_alumnos;
DELIMITER $$
CREATE PROCEDURE spu_listar_alumnos()
BEGIN
	SELECT ma.apellidos,ma.nombres,ma.documento_tipo,ma.documento_nro,ma.sexo,dist.distrito,ma.direccion,ma.correo,ma.celular,tur.turno,g.grado,secc.seccion,tall.taller,
			par.apellidospadre,par.nombrespadre,par.documento_tipo,par.documento_nro,par.celular,par.apellidosmadre,par.nombresmadre,par.documento_tipoM,par.documento_nroM,par.celularM,
			apo.apellidos,apo.nombres,apo.documento_tipo,apo.documento_nro,apo.celular
	FROM alumnos AS al
	INNER JOIN	matriculas AS ma ON ma.idmatricula = al.idmatricula
	INNER JOIN secciones AS secc ON secc.idseccion = al.idseccion
	INNER JOIN grados AS g ON g.idgrado = secc.idgrado
	INNER JOIN turnos AS tur ON tur.idturno = g.idturno
	INNER JOIN talleres AS tall ON tall.idtaller = al.idtaller
	INNER JOIN distritos AS dist ON dist.iddistrito = ma.iddistrito
	INNER JOIN parpadres AS par ON par.idparpadre = ma.idparpadre
	INNER JOIN apoderados AS apo ON apo.idapoderado = ma.idapoderado
	WHERE al.estado = '1'
	ORDER BY ma.apellidos;
END $$
DELIMITER ;

CALL spu_listar_alumnos();

/*******************************************************************************************************************************/
DROP PROCEDURE spu_insertar_alumnos;
DELIMITER $$
CREATE PROCEDURE spu_insertar_alumnos
(
	IN idmatricula_ 	INT,
    IN idusuario_		INT,
	IN idseccion_		INT,
	IN idtaller_		INT,	
	IN usuario_			VARCHAR(20)
)
BEGIN
	/*
	if fechasese_ = '' then convert(varchar(20)) and
		set fechasese_ = 'ACTIVO';
	END IF;*/
	
	INSERT INTO alumnos(idmatricula,idusuario,idseccion,idtaller,usuario)VALUES
		(idmatricula_,idusuario_,idseccion_,idtaller_,usuario_);
END $$
DELIMITER ;

CALL spu_insertar_alumnos('ROMERO VILLA','GABRIEL ALEJANDRO','DNI','23569846','M','200-03-12',2,'AV. LAS MAGNOLIAS','456@gmail.com','123456789',6,2,'CATÓLICA','CASTELLANO',
	'NINGUNA','NINGUNA','2023-02-19','',1,2,'ADMIN4');

DROP PROCEDURE spu_modificar_alumnos;
DELIMITER $$
CREATE PROCEDURE spu_modificar_alumnos
(
	IN idalumno_		INT,
	IN apellidos_		VARCHAR(40),
	IN nombres_			VARCHAR(40),
	IN documento_tipo_ VARCHAR(30),
	IN documento_nro_	 VARCHAR(20),	
	IN sexo_			CHAR(1),
	IN fechanacimiento_	DATE,
	IN iddistrito_		INT,
	IN direccion_	VARCHAR(60),	
	IN correo_		VARCHAR(60),
	IN celular_		CHAR(9),
	IN idseccion_		INT,
	IN idtaller_		INT,	
	IN religion_		VARCHAR(20),
	IN lenguamaterna_	VARCHAR(20),
	IN lenguasegunda_	VARCHAR(20),
	IN discapacidad_	TEXT,
	IN fechaalta_		DATE,
	IN fechasese_		DATE,
	IN idparpadre_		INT,
	IN idapoderado_  	INT,
	IN usuario_			VARCHAR(20)
)
BEGIN 
	UPDATE alumnos SET
		apellidos = apellidos_,
		nombres = nombres_,
		documento_tipo = documento_tipo_,
		documento_nro = documento_nro_,
		sexo = sexo_,
		fechanacimiento = fechanacimiento_,
		iddistrito = iddistrito_,
		direccion = direccion_,
		correo = correo_,
		celular = celular_,
		idseccion = idseccion_,
		idtaller = idtaller_,
		religion = religion_,
		lenguamaterna = lenguamaterna_,
		lenguasegunda = lenguasegunda_,
		discapacidad = discapacidad_,
		fechaalta = fechaalta_,
		fechasese = fechasese_,
		idparpadre = idparpadre_,
		idapoderado = idapoderado_,
		usuario = usuario_
		WHERE idalumno = idalumno_;
END $$
DELIMITER ;
 
CALL spu_modificar_alumnos (1,'ATUNCAR ','LUCAS ALFREDO','DNI','77068571','M','2003-11-22',1,'AV.SANTA ROSA #541','lucasatuncar1gmail.com','922634773',1,1,'CATOLICO','ESPAÑOL','NO','NIGUNA','2023-05-17','2028-05-17',1,2,'ADMIN');


DELIMITER $$
CREATE PROCEDURE spu_eliminar_alumnos(IN idalumno_ INT)
BEGIN
	UPDATE alumnos SET
	estado = '0'
		WHERE idalumno = idalumno_; 
END $$
DELIMITER ;

CALL spu_eliminar_alumnos(6);

/*****************************************************************************
******************************** ESTADOS SALUD *******************************
*****************************************************************************/
DROP PROCEDURE spu_listar_estsalud;
DELIMITER $$
CREATE PROCEDURE spu_listar_estsalud()
BEGIN
	SELECT codigoregistro,idalumno,edad,enfermedad,alergias,traumas,vacunas
	FROM estadossalud
	WHERE estado = '1'
	ORDER BY codigoregistro ASC;
END $$
DELIMITER ;

CALL spu_listar_estsalud();

DROP PROCEDURE spu_insertar_estsalud;
DELIMITER $$
CREATE PROCEDURE spu_insertar_estsalud
(
	IN codigoregistro_	VARCHAR(10),
	IN idalumno_	INT,
	IN edad_		CHAR(2),
	IN enfermedad_	 	TEXT,
	IN alergias_	 	TEXT,
	IN traumas_			TEXT,
	IN vacunas_			TEXT,
	IN usuario_	VARCHAR(20)
)
BEGIN
	INSERT INTO estadossalud(codigoregistro,idalumno,edad,enfermedad,alergias,traumas,vacunas,usuario) VALUES
		(codigoregistro_,idalumno_,edad_,enfermedad_,alergias_,traumas_,vacunas_,usuario_);
END$$
DELIMITER ;

CALL spu_insertar_estsalud('ES003',2,'12','muchas','muchas','muchas','muchas','ADMIN');

DROP PROCEDURE spu_modificar_estsalud;
DELIMITER $$
CREATE PROCEDURE spu_modificar_estsalud
(
	IN idestadosalud_ 		INT,
	IN codigoregistro_		VARCHAR(20),
	IN idalumno_				INT,
	IN edad_						CHAR(2),
	IN enfermedad_				TEXT,
	IN alergias_				TEXT,
	IN traumas_					TEXT,
	IN vacunas_					TEXT,
	IN usuario_					VARCHAR(20)
)
BEGIN
	UPDATE estadossalud SET
		codigoregistro = codigoregistro_,
		idalumno = idalumno_,
		edad = edad_,
		enfermedad = enfermedad_,
		alergias = alergias_,
		traumas = traumas_,
		vacunas = vacunas_,
		usuario = usuario_
	WHERE idestadosalud = idestadosalud_;
END $$
DELIMITER ;

CALL spu_modificar_estsalud(2,'ES005','2','15','muchisimas','muchisimas','muchisimas','muchisimas','ADMIN');

DELIMITER $$
CREATE PROCEDURE spu_eliminar_estsalud(IN idestadosalud_ INT)
BEGIN
	UPDATE estadossalud SET
		estado = '0'
	WHERE idestadosalud = idestadosalud_;
END$$
DELIMITER ;

CALL spu_eliminar_estsalud(3);

/*****************************************************************************
******************************** TRIAJES *************************************
*****************************************************************************/
 
DROP PROCEDURE spu_listar_triajes;
DELIMITER $$
CREATE PROCEDURE spu_listar_triajes()
BEGIN
	SELECT ests.codigoregistro,al.apellidos,al.nombres,tri.fecha,tri.peso,tri.talla,tri.observaciones,tri.otros,tri.tipocontrol,tri.resultado
	FROM triajes AS tri
	INNER JOIN estadossalud AS ests ON ests.idestadosalud = tri.idestadosalud
	INNER JOIN alumnos AS al ON al.idalumno = ests.idalumno
	WHERE tri.estado = '1'
	ORDER BY ests.codigoregistro ASC;
END$$
DELIMITER ;

CALL spu_listar_triajes();

DROP PROCEDURE spu_insertar_triajes;
DELIMITER $$
CREATE PROCEDURE spu_insertar_triajes
(
	IN idestadosalud_ INT,
	IN fecha_			DATE,
	IN peso_				DECIMAL(6,3),
	IN talla_			DECIMAL(3,2),
	IN observaciones_	TEXT,
	IN otros_			TEXT,
	IN tipocontrol_	TEXT,
	IN resultado_		TEXT,
	IN	usuario_			TEXT
)
BEGIN
	INSERT INTO triajes(idestadosalud,fecha,peso,talla,observaciones,otros,tipocontrol,resultado,usuario)VALUES
		(idestadosalud_,fecha_,peso_,talla_,observaciones_,otros_,tipocontrol_,resultado_,usuario_);
END$$
DELIMITER ;

CALL spu_insertar_triajes(1,'2023-05-25',99.2,1.56,'ninguna','ninguno','ninguno','ninguno','ADMIN');

DROP PROCEDURE spu_modificar_triajes;
DELIMITER $$
CREATE PROCEDURE spu_modificar_triajes
(
	IN idtriaje_		INT,
	IN idestadosalud_ INT,
	IN fecha_			DATE,
	IN	peso_				DECIMAL(6,3),
	IN talla_			DECIMAL(3,2),
	IN observaciones_ TEXT,
	IN otros_			TEXT,
	IN tipocontrol_	TEXT,
	IN resultado_		TEXT,
	IN usuario_			VARCHAR(20)
)
BEGIN
	UPDATE triajes SET
		idestadosalud = idestadosalud_,
		fecha = fecha_,
		peso = peso_,
		talla = talla_,
		observaciones = observaciones_,
		otros = otros_,
		tipocontrol = tipocontrol_,
		resultado = resultado_,
		usuario = usuario_
	WHERE idtriaje = idtriaje_;
END$$
DELIMITER ;
 
CALL spu_modificar_triajes(3,1,'2023-05-25',88.2,1.70,'ninguna','ninguno','ninguno','ninguno','ADMIN');

DROP PROCEDURE spu_eliminar_triajes;
DELIMITER $$
CREATE PROCEDURE spu_eliminar_triajes(IN idtriaje_ INT)
BEGIN
	UPDATE triajes SET
		estado =  '0'
	WHERE idtriaje = idtriaje_;
END$$
DELIMITER ;

CALL spu_eliminar_triajes(4);

/*****************************************************************************
******************************** CLASES **************************************
*****************************************************************************/

DROP PROCEDURE spu_listar_clases;
DELIMITER $$
CREATE PROCEDURE spu_listar_clases()
BEGIN
	SELECT usu.nomusuario,al.apellidos,al.nombres,cur.curso,clas.contenidoclase,clas.asistencia,clas.evcuaderno,clas.evoral,clas.fechaclase,clas.notaclase 
	FROM clases AS clas
	INNER JOIN usuarios AS usu ON usu.idusuario = clas.idusuario
	INNER JOIN alumnos AS al ON al.idalumno = clas.idalumno
	INNER JOIN detallecursos AS detc ON detc.iddetallecurso = clas.iddetallecurso
	INNER JOIN cursos AS cur ON cur.idcurso = detc.idcurso
	WHERE clas.estado = '1'
	ORDER BY al.idalumno ASC;
END$$
DELIMITER ;

CALL spu_listar_clases();

DROP PROCEDURE spu_insertar_clases;
DELIMITER $$
CREATE PROCEDURE spu_insertar_clases
(
	IN idusuario_		INT,
	IN idalumno_		INT,
	IN iddetallecurso_ INT,
	IN contenidoclase_ TEXT,
	IN asistencia_		DECIMAL(3,1),
	IN evcuaderno_		DECIMAL(3,1),
	IN evoral_			DECIMAL(3,1),
	IN notaclase_		DECIMAL(3,1),
	IN fechaclase_		DATE,
	IN usuario_			VARCHAR(20)
)
BEGIN
	INSERT INTO clases(idusuario,idalumno,iddetallecurso,contenidoclase,asistencia,evcuaderno,evoral,notaclase,fechaclase,usuario) VALUES
		(idusuario_,idalumno_,iddetallecurso_,contenidoclase_,asistencia_,evcuaderno_,evoral_,notaclase_,fechaclase_,usuario_);
END$$
DELIMITER ;

CALL spu_insertar_clases(2,2,2,'bastante','05','02','00','10','2023-05-27','ADMIN');

DROP PROCEDURE spu_modificar_clases;
DELIMITER $$
CREATE PROCEDURE spu_modificar_clases
(
	IN idclase_ 		INT,
	IN idusuario_		INT,
	IN idalumno_		INT,
	IN iddetallecurso_ INT,
	IN contenidoclase_ TEXT,
	IN asistencia_		DECIMAL(3,1),
	IN evcuaderno_		DECIMAL(3,1),
	IN evoral_			DECIMAL(3,1),
	IN notaclase_		DECIMAL(3,1),
	IN fechaclase_		DATE,
	IN usuario_			VARCHAR(20)
)
BEGIN
	UPDATE clases SET
		idusuario = idusuario_,
		idalumno = idalumno_,
		iddetallecurso = iddetallecurso_,
		contenidoclase = contenidoclase_,
		asistencia = asistencia_,
		evcuaderno = evcuaderno_,
		evoral = evoral_,
		notaclase = notaclase_,
		fechaclase = fechaclase_,
		usuario = usuario_
	WHERE idclase = idclase_;
END$$
DELIMITER ;

CALL spu_modificar_clases(5,1,2,2,'muchisimas','05','02','00','10','2023-05-28','ADMIN');

DROP PROCEDURE spu_eliminar_clases;
DELIMITER $$
CREATE PROCEDURE spu_eliminar_clases(IN idclase_ INT)
BEGIN
	UPDATE clases SET
		estado = '0'
	WHERE idclase = idclase_;
END$$
DELIMITER ;

CALL spu_eliminar_clases(5);

