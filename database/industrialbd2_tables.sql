create database industrialbd2;
use industrialbd2;

-- TABLA DE ACCESOS ////////////

drop table if exists accesos;
create table accesos
(
	idacceso		int 		primary key auto_increment,
    codigoacceso 	char(5)		not null,
    nombreacceso	varchar(20)	not null,
    date_creation	date		not null 	default now(),
    date_update		date		null,
    date_set		date		null,
    date_delete		date		null,
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
    permiso			varchar(30)	not null,
    date_creation	date	not null	default now(),
    date_upload		date	null,
    date_set		date	null,
    date_delete		date	null,
    usuario			varchar(20) 		not null,
    estado			char(1)	not null	default '1',
    constraint uk_permiso_fun unique(permiso)
)engine = innodb;

-- TABLA DE USUARIOS ////////////

drop table if exists usuarios;
create table usuarios
(
	idusuario		int			not null auto_increment ,
    nomusuario		varchar(20)	not null,
    claveacceso		varchar(60)	not null,
    idfuncion		int			not null,
    date_creation	date		not null		default now(),
    date_upload		date		null,
    date_set		date		null,
    date_delete		date		null,
    usuario			varchar(20)	not null,
    estado			char(1)		not null 		default '1',
    constraint primary key (idusuario) ,
    constraint uk_nomusuario_usu unique(nomusuario),
    constraint fk_idfuncion_usu	foreign key(idfuncion) references funciones(idfuncion)
)engine = innodb;