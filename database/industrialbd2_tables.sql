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

create index idx_idacceso on accesos(idacceso);
create index idx_codigoacceso on accesos(codigoacceso);
create index idx_nombreacceso on accesos(nombreacceso);

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
    constraint uk_permiso_fun unique(permiso),
    constraint fk_idacceso_fun	foreign key(idacceso) references accesos(idacceso)
)engine = innodb;

create index idx_idfucnion on funciones(idfuncion);
create index idx_idacceso on funciones(idacceso);
create index idx_permiso on funciones(permiso);

-- TABLA DE USUARIOS ////////////

drop table if exists usuarios;
create table usuarios
(
	idusuario		int			not null auto_increment ,
    nomusuario		varchar(20)	not null,
    claveacceso		varchar(60)	not null,
    date_creation	date		not null		default now(),
    date_upload		date		null,
    date_set		date		null,
    date_delete		date		null,
    usuario			varchar(20)	not null,
    estado			char(1)		not null 		default '1',
    constraint primary key (idusuario) ,
    constraint uk_nomusuario_usu unique(nomusuario)
)engine = innodb;

create index idx_idusuario on usuarios(idusuario);
create index idx_nomusuario on usuarios(nomusuario);

-- TABLA DETALLE DE FUNCIONES ////////////

drop table if exists detalle_funciones;
create table detalle_funciones
(
	id_detalle_funcion			int 	not null 	auto_increment,
    idusuario					int		not null,
    idfuncion					int 	not null,
    date_creation				date	not null	default now(),
    date_upload					date	null,
    date_set					date	null,
    date_delete					date	null,
    usuario						varchar(20)		not null,
    estado						char(1)	not null	default '1',
    constraint primary key(id_detalle_funcion),
    constraint uk_idusuario_idfuncion_detfun unique(idusuario,idfuncion),
    constraint fk_idusuario_detfun foreign key(idusuario) references usuarios(idusuario),
    constraint fk_idfuncion_detfun foreign key(idfuncion) references funciones(idfuncion)
)engine = innodb;

create index idx_id_detalle_funcion on detalle_funciones(id_detalle_funcion);
create index idx_idusuario on detalle_funciones(idusuario);
create index idx_idfuncion on detalle_funciones(idfuncion);

-- TABLA MADRES ////////////////////////////////////////////////////////////////////////////

drop table if exists madres;
create table madres
(
	idmadre					int not null auto_increment,
    apellidosM				varchar(40)		not null,
    nombresM				varchar(40)		not null,
    documento_tipoM			varchar(20)		not null,
    documento_nroM			varchar(20)		not null,
    fechanacimientoM		date			not null,
    direccionM				varchar(60)		not null,
    correoM					varchar(60)		not null,
    celularM				char(9)			not null,
    gradoinstruccionM		varchar(20)		not null,
    ocupacionM				varchar(20)		not null,
    convivenciaM				char(2) 		not null,
    religionM				varchar(20) 	not null,
    date_creation			date			not null	default now(),
    date_upload				date			null,
    date_set				date			null,
    date_delete				date			null,
    usuario					varchar(20)		not null,
    estado					char(1)			not null	default '1',
    constraint primary key(idmadre),
    constraint uk_apellido_nombres_madre unique(apellidosM,nombresM),
    constraint uk_documento_nro_madre unique(documento_nroM),
    constraint chk_celularM_madre check(celularM regexp '^[0-9]+$')
)engine = innodb;

create index idx_idmadre on madres(idmadre);
create index idx_apellidosM on madres(apellidosM);
create index idx_nombresM on madres(nombresM);
create index idx_documento_nroM on madres(documento_nroM);
create index idx_celularM on madres(celularM);