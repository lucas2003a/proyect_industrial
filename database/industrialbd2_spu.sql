use industrialbd2;

-- ACCESOS //////////////////////////////////////////////////////////////////////////////////////////

drop procedure if exists spu_acceso_listar;
delimiter $$
create procedure spu_acceso_listar()
begin
	select
		idacceso,
        codigoacceso,
        nombreacceso,
        date_creation,
        date_update,
        date_set,
        date_delete,
        usuario
    from accesos
    where estado = '1'
    order by codigoacceso asc;
end $$
delimiter ;

-- ///////

drop procedure if exists spu_acceso_registrar;
delimiter $$
create procedure spu_acceso_registrar
(
	in _codigoacceso	char(5),
    in _nombreacceso	varchar(20),
    in _usuario			varchar(20)
)
begin
	insert into accesos
		(codigoacceso,nombreacceso,usuario)
        values
        (_codigoacceso,_nombreacceso,_usuario);
end $$
delimiter ;

-- ///////

drop procedure if exists spu_acceso_modificar;
delimiter $$
create procedure spu_acceso_modificar
(
	in _idacceso		int,
	in _codigoacceso	char(5),
    in _nombreacceso	varchar(20),
    in _usuario			varchar(20)
)
begin
 update accesos set
	codigoacceso 	= _codigoacceso,
    nombreacceso 	= _nombreacceso,
    usuario 		= _usuario,
    date_set = now()
    where
		idacceso = _idacceso;
end $$
delimiter ;

-- ////////
drop procedure if exists spu_acceso_eliminar;
delimiter $$
create procedure spu_acceso_eliminar(in _idacceso int)
begin
 update accesos set
	date_delete = now(),
	estado = '0'
where 
	idacceso = _idacceso;
end $$
delimiter ;

-- ////
drop procedure if exists spu_acceso_reactivar;
delimiter $$
create procedure spu_acceso_reactivar(in _idacceso int)
begin 
	update accesos set
		date_delete = null,
        estado = '1'
	where
		idacceso = _idacceso;
end $$
delimiter ;

-- FUNCIONES //////////////////////////////////////////////////////////////////////////////////////////

drop procedure if exists spu_funcion_listar;
delimiter $$
create procedure spu_funcion_listar()
begin
 select 
	fun.idfuncion,
    acc.nombreacceso,
    fun.permiso,
    fun.date_creation,
    fun.date_upload,
    fun.date_set,
    fun.date_delete,
    fun.usuario
 from funciones as fun
 inner join accesos as acc on acc.idacceso = fun.idacceso
 where
	fun.estado = '1'
order by acc.nombreacceso asc;
end $$
delimiter ;

-- //////////

drop procedure if exists spu_funcion_registrar;
delimiter $$
create procedure spu_funcion_registrar
(
	in _idacceso		int,
    in _permiso			varchar(30),
    in _usuario			varchar(20)
)
begin
	insert into funciones
		(idacceso,permiso,usuario)
        values
        (_idacceso,_permiso,_usuario);
end $$
delimiter ;

-- //////////

drop procedure if exists spu_funcion_modificar;
delimiter $$
create procedure spu_funcion_modificar
(
	in _idfuncion		int,
    in _idacceso		int,
    in _permiso			varchar(30),
    in _usuario			varchar(20)
)
begin
	update funciones set
		idacceso 	= _idacceso,
        permiso		= _permiso,
        usuario		= _usuario,
        date_set	= now()
        
	where
		idfuncion = _idfuncion;
end $$
delimiter ;

-- /////////

drop procedure if exists spu_funcion_eliminar;
delimiter $$
create procedure spu_funcion_eliminar(in _idfuncion int)
begin
	update funciones set
		date_delete = now(),
		estado = '0'
        
	where 
		idfuncion = _idfuncion;
end $$
delimiter ;

-- /////////

drop procedure if exists spu_funcion_reactivar;
delimiter $$
create procedure spu_funcion_reactivar(in _idfuncion int)
begin
	update funciones set
		date_delete = null,
        estado 		= '1'
        
	where 
		idfuncion = _idfuncion;
end $$
delimiter ;

-- USUARIOS //////////////////////////////////////////////////////////////////////////////////////////

drop procedure if exists spu_usuario_listar;
delimiter $$
create procedure spu_usuario_listar()
begin
	select
		idusuario,
        nomusuario,
        date_creation,
        date_upload,
        date_set,
        date_delete,
        usuario
	from usuarios as  usu
    where
		usu.estado = '1'
	order by nomusuario asc;
end $$
delimiter ;

-- ////////

drop procedure if exists spu_usuario_registrar;
delimiter $$
create procedure spu_usuario_registrar
(
	in _nomusuario		varchar(20),
    in _claveacceso		varchar(60),
    in _usuario			varchar(20)
)
begin
	insert into usuarios
		(nomusuario,claveacceso,usuario)
		values
        (_nomusuario,_claveacceso,_usuario);
end $$
delimiter ;

-- /////////

drop procedure if exists spu_usuario_modificar;
delimiter $$
create procedure spu_usuario_modificar
(
	in _idusuario		int,
    in _nomusuario		varchar(20),
    in _usuario			varchar(60)
)
begin
	update usuarios set
		nomusuario	= _nomusuario,
        date_set	= now(),
        usuario		= _usuario
        
	where
		idusuario = _idusuario;
end $$
delimiter ;

-- ///////

drop procedure if exists spu_cambiar_clave;
delimiter $$
create procedure spu_cambiar_clave
(
	in _idusuario		int,
    in _claveacceso		varchar(60)
)
begin
	update usuarios set
        claveacceso = _claveacceso,
        date_set	= now()
        
	where
		idusuario = _idusuario;
end $$
delimiter ;

-- //////

drop procedure if exists spu_usuario_eliminar;
delimiter $$
create procedure spu_usuario_eliminar(in _idusuario int)
begin
	update usuarios set
		date_delete = now(),
        estado = '0'
        
	where
		idusuario = _idusuario;
end $$
delimiter ;

-- ////////

drop procedure if exists spu_usuario_reactivar;
delimiter $$
create procedure spu_usuario_reactivar(in _idusuario int)
begin
	update usuarios set
		date_delete = null,
        estado = '1'
        
	where
		idusuario = _idusuario;
end $$
delimiter ;

-- /////

drop procedure if exists spu_usuario_buscar;
delimiter $$
create procedure spu_usuario_buscar(in _nomusuario varchar(20))
begin
	select
		idusuario,
        nomusuario,
        date_creation,
        date_upload,
        date_set,
        date_delete,
        usuario
	from usuarios
    where
		nomusuario like concat('%',_nomusuario,'%')
        and
        estado = '1'
	order by nomusuario asc;
end $$
delimiter ;

-- DETALLES FUNCIONES ////////////////////////////////////////////////////////////

-- ////
drop procedure if exists spu_detalle_funcion_listar;
delimiter $$
create procedure spu_detalle_funcion_listar()
begin
	select
		detfun.id_detalle_funcion,
        usu.nomusuario,
        fun.permiso,
        detfun.date_creation,
        detfun.date_upload,
        detfun.date_set,
        detfun.date_delete,
        detfun.usuario
    from detalle_funciones as detfun
    inner join usuarios as usu on usu.idusuario = detfun.idusuario
    inner join funciones as fun on fun.idfuncion = detfun.idfuncion
    where detfun.estado = '1'
    order by usu.nomusuario asc;
end $$
delimiter ;

-- ////

drop procedure if exists spu_detalle_funcion_registrar;
delimiter $$
create procedure spu_detalle_funcion_registrar
(
	in _idusuario 	int,
    in _idfuncion	int,
    in _usuario		varchar(20)
)
begin
	insert into detalle_funciones
		(idusuario,idfuncion,usuario)
        values
        (_idusuario,_idfuncion,_usuario);
end $$
delimiter ;

-- ///// 

drop procedure if exists spu_detalle_funcion_modificar;
delimiter $$
create procedure spu_detalle_funcion_modificar
(
	in _id_detalle_funcion		int,
    in _idusuario				int,
    in _idfuncion				int,
    in _usuario					varchar(20)
)
begin
	update detalle_funciones set
		idusuario	= _idusuario,
        idfuncion	= _idfuncion,
        date_set	= now(),
        usuario		= _usuario
	
    where
		id_detalle_funcion = _id_detalle_funcion; 
end $$
delimiter ;

-- ///////

drop procedure if exists spu_detalle_funcion_eliminar;
delimiter $$
create procedure spu_detalle_funcion_eliminar(in _id_detalle_funcion int)
begin
	update detalle_funciones set
		date_delete = now(),
		estado = '0'
        
	where 
		id_detalle_funcion = _id_detalle_funcion;
end $$
delimiter ;

-- ////

drop procedure if exists spu_detalle_funcion_reactivar;
delimiter $$
create procedure spu_detalle_funcion_reactivar(in _id_detalle_funcion int)
begin
	update detalle_funciones set
		date_delete = null,
		estado = '1'
        
	where 
		id_detalle_funcion = _id_detalle_funcion;
end $$
delimiter ;

-- //////

drop procedure if exists spu__detalle_funcion_buscar;
delimiter $$
create procedure spu__detalle_funcion_buscar(in _nomusuario varchar(20))
begin
	select
		detfun.id_detalle_funcion,
        usu.nomusuario,
        fun.permiso,
        detfun.date_creation,
        detfun.date_upload,
        detfun.date_set,
        detfun.date_delete,
        detfun.usuario
    from detalle_funciones as detfun
    inner join usuarios as usu on usu.idusuario = detfun.idusuario
    inner join funciones as fun on fun.idfuncion = detfun.idfuncion
    where
		usu.nomusuario like concat('%',_nomusuario,'%')
		and
			detfun.estado = '1'
    order by usu.nomusuario asc;
end $$
delimiter ;


-- MADRES /////////////////////////////////////////////////////////////////////

-- LISTAR
drop procedure if exists spu_madre_listar;
delimiter $$
create procedure spu_madre_listar()
begin
	select * from madres
    where
		estado = '1'
	order by apellidosM,nombresM;
end $$
delimiter ;

-- REGISTRAR
drop procedure spu_madre_registrar;
delimiter $$
create procedure spu_madre_registrar
(
	in _apellidosM		varchar(40),
    in _nombresM		varchar(40),
    in _documento_tipoM varchar(20),
    in _documento_nroM 	varchar(20),
    in _fechanacimientoM date,
    in _direccionM		varchar(60),
    in _correoM			varchar(60),
    in _celularM		char(9),
    in _gradoinstruccionM varchar(20),
    in _ocupacionM		varchar(20),
    in _convivenciaM		char(2),
    in _religionM		varchar(20),
    in _usuario			varchar(20)
)
begin
	insert into madres
		(apellidosM,nombresM,documento_tipoM,documento_nroM,fechanacimientoM,direccionM,
		correoM,celularM,gradoinstruccionM,ocupacionM,convivenciaM,religionM,usuario)
    values
        (_apellidosM,_nombresM,_documento_tipoM,_documento_nroM,_fechanacimientoM,_direccionM,
		_correoM,_celularM,_gradoinstruccionM,_ocupacionM,_convivenciaM,_religionM,_usuario);    
end $$
delimiter ;

-- MODIFICAR
drop procedure spu_madre_modificar;
delimiter $$
create procedure spu_madre_modificar
(
	in _idmadre			int,
	in _apellidosM		varchar(40),
    in _nombresM		varchar(40),
    in _documento_tipoM varchar(20),
    in _documento_nroM 	varchar(20),
    in _fechanacimientoM date,
    in _direccionM		varchar(60),
    in _correoM			varchar(60),
    in _celularM		char(9),
    in _gradoinstruccionM varchar(20),
    in _ocupacionM		varchar(20),
    in _convivenciaM		char(2),
    in _religionM		varchar(20),
    in _usuario			varchar(20)
)
begin
	update madres set
		apellidosM			= _apellidosM,		
		nombresM 			= _nombresM,		
		documento_tipoM 	= _documento_tipoM,
		documento_nroM  	=_documento_nroM,
		fechanacimientoM 	= _fechanacimientoM,
		direccionM		 	= _direccionM,
		correoM 		 	=_correoM,
		celularM		 	= _celularM,
		gradoinstruccionM 	= _gradoinstruccionM,
		ocupacionM		 	= _ocupacionM,
		convivenciaM		 	= _convivenciaM,
		religionM		 	= _religionM,
        date_set			= now(),
		usuario 			= _usuario
        
	where 
		idmadre = _idmadre;
end $$
delimiter ;

-- ELIMINAR

drop procedure spu_madre_eliminar;
delimiter $$
create procedure spu_madre_eliminar(in _idmadre int)
begin
	update madres set
		date_delete = now(),
        estado = '0'
        
	where
     idmadre = _idmadre;
end $$
delimiter ;

-- REACTIVAR

drop procedure spu_madre_reactivar;
delimiter $$
create procedure spu_madre_reactivar(in _idmadre int)
begin
	update madres set
		date_delete = null,
        estado = '1'
        
	where
     idmadre = _idmadre;
end $$
delimiter ;

-- BUSCAR
 drop procedure if exists spu_madre_buscar;
 delimiter $$
 create procedure spu_madre_buscar( in _camposBuscar varchar(80))
 begin
	select * from madres
    where apellidosM like concat('%',_camposBuscar,'%') or nombresM  like concat('%',_camposBuscar,'%')
		and 
			estado = '1'
	order by apellidosM asc;
 end $$
 delimiter ;
 
 -- MATRICULAS //////////////////////////////////////////////////////////////////////////////////////////
 
 -- LISTAR
  drop procedure if exists spu_matricula_listar;
  delimiter $$
  create procedure spu_matricula_listar()
  begin
	select 
		idmatricula,
        nromatricula,
        cmodularbefore,
        colegioprocedencia,
        date_creation,
        date_upload,
        date_set,
        date_delete,
        usuario
    from matriculas
    where
		estado = '1';
  end $$
  delimiter ;
-- REGISTRAR
-- MODIFICAR
-- ELIMINAR
-- REACTIVAR
-- BUSCAR
 
 
-- LISTAR
-- REGISTRAR
-- MODIFICAR
-- ELIMINAR
-- REACTIVAR
-- BUSCAR
