use industrialbd2;

-- ACCESOS
-- tabla para accesos,ejem: administrador, profesor,alumno, etc...

select * from accesos;
call spu_acceso_listar();
call spu_acceso_registrar('AC005','SECRETARIA','ADMIN');
call spu_acceso_modificar(7,'AC005','SECRETARIO','USERMASTER');
call spu_acceso_eliminar(2);
call spu_acceso_reactivar(2);

-- FUNCIONES
-- funciones que se pueden reslizar con un determinado acceso creado en la tabla "accesos"	

select * from funciones;
call spu_funcion_listar();
call spu_funcion_registrar(7,'REGISTRO DE NOTAS','ADMIN');
call spu_funcion_modificar(1,2,'ADMINISTRACIÓN DE ASISTENCIAS','ADMIN'); 
call spu_funcion_eliminar(3);
call spu_funcion_reactivar(3);

-- USUARIOS
-- al crear un usuario, se le asigna las funciones que puede realizar

select * from usuarios;
call spu_usuario_listar();
call spu_usuario_registrar('cesar2003','cesar2003',1,'ADMIN');
call spu_usuario_modificar(1,'L2003','2','ADMIN');
call spu_usuario_eliminar(2);
call spu_usuario_reactivar(2);
call spu_usuario_buscar('L');

call spu_cambiar_clave(1,'LUCASvale2003')