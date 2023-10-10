use industrialbd2;

-- ACCESOS

select * from accesos;
call spu_acceso_listar();
call spu_acceso_registrar('AC001','LISTAR ALUMNO','ADMIN');
call spu_acceso_modificar(2,'ACC03','LISTAR ALUMNO','','','USERMASTER');
call spu_acceso_eliminar(2);
call spu_acceso_reactivar(2);
