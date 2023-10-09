create database industrialbd2;
use industrialbd2;

-- TABLA DE ACCESOS ////////////

drop table if exists accesos;
create table accesos
(
	idacceso		int 		primary key auto_increment,
    codigoacceso 	char(5)		not null,
    nombreacceso	varchar(20)	not null,
    usuario			varchar(20)	not null,
    estado			char(1) 	not null 	default '1',
    constraint uk_codigoacceso_acc unique (codigoacceso),
    constraint uk_nombreacceso_acc unique (nombreacceso)
)engine = innodb;

-- TABLA DE FUNCIONES ////////////

drop table if exists funciones;
create table funciones
(
	idfuncion		int		primary key auto_increment,
    idacceso		int		not null,
    permiso			char(2)	not null,
    fecharegistro	date	not null	default now(),
    usuario			varchar(20) 		not null,
    estado			char(1)	not null	default '1'
)engine = innodb;

-- TABLA DE USUARIOS ////////////

drop table if exists usuarios;
create table usuarios
(
	idusuario		int			not null auto_increment ,
    nomusuario		varchar(20)	not null,
    claveaccceso	varchar(60)	not null,
    t_persona		char(5)		not null,
    idfuncion		int			not null,
    fecharegistro	date		not null		default now(),
    usuario			varchar(20)	not null,
    estado			char(1)		not null 		default '1',
    
    constraint primary key (idusuario) ,
    constraint uk_nomusuario_usu unique(nomusuario),
    constraint fk_idfuncion_usu	foreign key(idfuncion) references funciones(idfuncion)
)engine = innodb;