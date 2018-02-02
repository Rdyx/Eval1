create table admin
(
	id int auto_increment
		primary key,
	adm_nom varchar(255) not null,
	adm_prenom varchar(255) not null,
	adm_tel varchar(255) not null,
	username varchar(180) not null,
	username_canonical varchar(180) not null,
	email varchar(180) not null,
	email_canonical varchar(180) not null,
	enabled tinyint(1) not null,
	salt varchar(255) null,
	password varchar(255) not null,
	last_login datetime null,
	confirmation_token varchar(180) null,
	password_requested_at datetime null,
	roles longtext not null comment '(DC2Type:array)',
	constraint UNIQ_880E0D7692FC23A8
	unique (username_canonical),
	constraint UNIQ_880E0D76A0D96FBF
	unique (email_canonical),
	constraint UNIQ_880E0D76C05FB297
	unique (confirmation_token)
)
;

create table annonce
(
	id int auto_increment
		primary key,
	ann_titre varchar(255) not null,
	ann_photo varchar(255) null,
	ann_nbpieces int not null,
	ann_prix int not null,
	ann_description longtext not null,
	adm_id int null,
	cli_id int null,
	typ_id int null,
	updated_at datetime null,
	constraint FK_F65593E54E949F2D
	foreign key (adm_id) references admin (id)
)
;

create index IDX_F65593E5278CD074
	on annonce (typ_id)
;

create index IDX_F65593E54E949F2D
	on annonce (adm_id)
;

create index IDX_F65593E5BC4EE2B0
	on annonce (cli_id)
;

create table client
(
	id int auto_increment
		primary key,
	cli_nom varchar(255) not null,
	cli_prenom varchar(255) not null,
	cli_tel varchar(255) not null
)
;

alter table annonce
	add constraint FK_F65593E5BC4EE2B0
foreign key (cli_id) references client (id)
;

create table type_annonce
(
	id int auto_increment
		primary key,
	typ_type varchar(255) not null
)
;

alter table annonce
	add constraint FK_F65593E5278CD074
foreign key (typ_id) references type_annonce (id)
;

INSERT INTO carcassonneimmo.client (cli_nom, cli_prenom, cli_tel) VALUES ('Jean', 'Robert', '0606060606');

INSERT INTO carcassonneimmo.admin (adm_nom, adm_prenom, adm_tel, username, username_canonical, email, email_canonical, enabled, salt, password, last_login, confirmation_token, password_requested_at, roles) VALUES ('Test', 'preTest', '0606060606', 'admin', 'admin', 'admin@admin.com', 'admin@admin.com', 1, null, '$2y$13$96eb4Nr5VH8bTyIsD51f8e/wrP0nWrVFNgDTzgvN7T6XLuKk74NJe', '2018-02-01 14:43:17', null, null, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}');

INSERT INTO carcassonneimmo.type_annonce (typ_type) VALUES ('Vente');
INSERT INTO carcassonneimmo.type_annonce (typ_type) VALUES ('Location');

INSERT INTO carcassonneimmo.annonce (ann_titre, ann_photo, ann_nbpieces, ann_prix, ann_description, adm_id, cli_id, typ_id, updated_at) VALUES ('THE ANNONCE', '5a733819d895f960615041.png', 99, 9000, 'CETTE MAISON EST OVER 9000 !!!
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?

    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?

    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?

    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?
v
v    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi consequuntur doloribus explicabo facere, harum nesciunt non nostrum perspiciatis placeat praesentium quis rerum saepe sapiente similique sunt tenetur totam, ut vel?', 1, 1, 1, '2018-02-01 15:54:01');
INSERT INTO carcassonneimmo.annonce (ann_titre, ann_photo, ann_nbpieces, ann_prix, ann_description, adm_id, cli_id, typ_id, updated_at) VALUES ('aoeno', '5a7426f028c87407763272.png', 5, 523, 'zzvzv', 1, 1, 1, '2018-02-02 08:53:04');
INSERT INTO carcassonneimmo.annonce (ann_titre, ann_photo, ann_nbpieces, ann_prix, ann_description, adm_id, cli_id, typ_id, updated_at) VALUES ('ajnc', null, 2352323, 2147483647, 'aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne aeivievn ijenz oijenvzoijv ze vzoevn zeivjn zàievjnz eàivjnze àvijnzeà vijnzevàijznevizj nevàizjne', 1, 1, 2, null);