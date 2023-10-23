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
call spu_funcion_registrar(1,'GESTIÓN DE LIBROS','ADMIN');
call spu_funcion_modificar(1,1,'GESTIÓN DE DOCUMENTOS','ADMIN'); 
call spu_funcion_eliminar(3);
call spu_funcion_reactivar(3);

-- USUARIOS
-- al crear un usuario, se le asigna las funciones que puede realizar

select * from usuarios;
call spu_usuarios_login('Lucas2003');
call spu_usuario_listar();
call spu_usuario_registrar('Lucas2003','cesar2003','ADMIN');
call spu_usuario_modificar(1,'Cesar2000','ADMIN');
call spu_usuario_eliminar(2);
call spu_usuario_reactivar(2);
call spu_usuario_buscar('L');

call spu_cambiar_clave(2,'L');

-- DETALLE FUNCIONES

select * from detalle_funciones;
call spu_detalle_funcion_listar();
call spu_detalle_funcion_registrar(1,2,'ADMIN');
call spu_detalle_funcion_modificar(1,1,1,'ADMIN');
call spu_detalle_funcion_eliminar(1);
call spu_detalle_funcion_reactivar(1);
call spu__detalle_funcion_buscar('L');

-- MADRES

select * from madres;
call spu_madre_listar();
call spu_madre_registrar('PEREZ APOLAYA','MARISOL MARIELA','DNI','77068573','2000-01-12','AV LOS SAUCES #321','MARIAPO@GMAIL.COM','956993599','SUPERIOR','PROFESORA','SI','CATÓLICA','ADMIN');
call spu_madre_modificar(1,'PEREZ LOYOLA','MARIA JIMENA','DNI','77068572','2000-01-12','AV LOS SAUCES #321','MARIAPO@GMAIL.COM','956993599','SUPERIOR','PROFESORA','SI','CATÓLICA','ADMIN');
call spu_madre_eliminar(1);
call spu_madre_reactivar(1);
call spu_madre_buscar('maria');

-- MATRICULAS

select * from matriculas;
call spu_matricula_listar();

