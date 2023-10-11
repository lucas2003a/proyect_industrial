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
    where estado = '1';
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
	fun.estado = '1';
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
		usu.idusuario,
        usu.nomusuario,
        fun.permiso,
        usu.date_creation,
        usu.date_upload,
        usu.date_set,
        usu.date_delete,
        usu.usuario
	from usuarios as  usu
    inner join funciones as fun on fun.idfuncion = usu.idfuncion
    where
		usu.estado = '1';
end $$
delimiter ;

-- ////////

drop procedure if exists spu_usuario_registrar;
delimiter $$
create procedure spu_usuario_registrar
(
	in _nomusuario		varchar(20),
    in _claveacceso		varchar(60),
    in _idfuncion		int,
    in _usuario			varchar(20)
)
begin
	insert into usuarios
		(nomusuario,claveacceso,idfuncion,usuario)
		values
        (_nomusuario,_claveacceso,_idfuncion,_usuario);
end $$
delimiter ;

-- /////////

drop procedure if exists spu_usuario_modificar;
delimiter $$
create procedure spu_usuario_modificar
(
	in _idusuario		int,
    in _nomusuario		varchar(20),
    in _idfuncion		int,
    in _usuario			varchar(60)
)
begin
	update usuarios set
		nomusuario	= _nomusuario,
        idfuncion	= _idfuncion,
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
		usu.idusuario,
        usu.nomusuario,
        fun.permiso,
        usu.date_creation,
        usu.date_upload,
        usu.date_set,
        usu.date_delete,
        usu.usuario
	from usuarios as  usu
    inner join funciones as fun on fun.idfuncion = usu.idfuncion
    where
		nomusuario like concat('%',_nomusuario,'%');
end $$
delimiter ;