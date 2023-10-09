use industrialbd2;

-- ACCESOS //////////

drop procedure if exists accesos_listar;
delimiter $$
create procedure accesos_listar()
begin
	select * from accesos
    where estado = '1';
end $$
delimiter ;

drop procedure if exists accesos_registrar;
delimiter $$
create procedure accesos_registrar
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

drop procedure if exists accesos_modificar;
delimiter $$
create procedure accesos_modificar()
begin
end $$
delimiter ;()