use industrialbd2;

-- ACCESOS //////////

drop procedure if exists spu_acceso_listar;
delimiter $$
create procedure spu_acceso_listar()
begin
	select * from accesos
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
    in _date_update		date,
    in _date_delete		date,
    in _usuario			varchar(20)
)
begin
 update accesos set
	codigoacceso 	= _codigoacceso,
    nombreacceso 	= _nombreacceso,
    date_update 	= nullif(_date_update,''),
    date_delete 	= nullif(_date_delete,''),
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