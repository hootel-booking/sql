CREATE database thesisHotelBooking;
use thesisHotelBooking;

create table review(
	id int auto_increment,
	content text,
	rate int DEFAULT 0,
	name varchar(50),
	email varchar(50),
	id_room int,
	
	primary key (id)
);
	
create table `size`(
	id int auto_increment,
	square int,
	
	primary key(id)
);
	
create table`type`(
	id int auto_increment,
	name varchar(50),
	
	primary key(id)
);
	
create table room(
	id int auto_increment,
	name varchar(100),
	price decimal(12, 2) DEFAULT 0,
	discount int DEFAULT 0,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	update_date datetime,
	main_image varchar(255),
	description text,
	id_size int,
	id_type int,
	
	primary key(id)
);

create table roomservice(
	id_service int,
	id_room int,
	
	primary key(id_service, id_room)
);

create table service(
	id int auto_increment,
	name varchar(100),
	
	primary key(id)
);

create table image(
	id int auto_increment,
	name varchar(255),
	id_room int,
	
	primary key (id)
);

create table cart(
	id int auto_increment,
	is_delete bit,
	id_room int,
	id_user int,
	
	primary key(id)
);
	
create table reservation(
	id int auto_increment,
	check_in datetime,
	check_out datetime,
	adult_number int DEFAULT 0,
	child_number int DEFAULT 0,
	price decimal(12, 2) DEFAULT 0,
	discount int DEFAULT 0,
	id_user int,
	id_status int,
	id_room int,
	update_by int,
	deposit decimal(12, 2) DEFAULT 0,
	note text,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	update_date datetime,
	
	primary key (id)
);


create table status (
	id int auto_increment,
	name varchar(50),
	
	primary key(id)
);

create table `user`(
	id int auto_increment,
	first_name varchar(255),
	last_name varchar(255),
	user_name varchar(255),
	email varchar(255),
	password varchar(255),
	phone varchar(50),
	avatar varchar(255),
	id_role int,
	
	primary key(id)
);

create table blog (
	id int auto_increment,
	title varchar(255),
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	name_main_image varchar(255),
	content text,
	id_user int,
	
	primary key(id)
);

create table imageblog (
	id int auto_increment,
	name varchar(255),
	id_blog int,
	
	primary key(id)
);
	
create table blogtag(
	id_blog int,
	id_tag int,
	
	primary key (id_blog, id_tag)
);
	
create table tag(
	id int auto_increment,
	name varchar(50),
	
	primary key(id)
);
	
create table comment(
	id int auto_increment,
	content text,
	`like` int DEFAULT 0,
	email varchar(50),
	name varchar(50),
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	id_blog int,
	
	primary key(id)
);

create table `role`(
	id int auto_increment,
	name varchar (50),
	
	primary key (id)
);

create table bank_account(
	id_user int,
	account_number varchar(50),
	amount decimal(12, 2) DEFAULT 0,
	transfer_amount decimal(12, 2) DEFAULT 0,
	deposit_amount decimal(12, 2) DEFAULT 0,
	transfer_date datetime,
	deposit_date datetime,
	
	primary key (id_user)
);

alter table review add constraint fk_idRoom_review foreign key (id_room) references room(id);

alter table room add constraint fk_idSize_size foreign key (id_size) references `size` (id);
alter table room add constraint fk_idType_room foreign key (id_type) references `type` (id); 

alter table roomservice add constraint fk_idRoom_roomservice foreign key (id_room) references room(id);
alter table roomservice add constraint fk_idService_roomservice foreign key (id_service) references service(id);

alter table image add constraint fk_idRoom_image foreign key (id_room) references room(id);

alter table cart add constraint fk_idRoom_cart foreign key(id_room) references room(id);
alter table cart add constraint fk_idUser_cart foreign key (id_user) references `user`(id);

alter table reservation add constraint fk_idRoom_reservation foreign key (id_room) references room(id);
alter table reservation add constraint fk_idStatus_reservation foreign key (id_status) references status(id);
alter table reservation add constraint fk_idUser_reservation foreign key (id_user) references `user`(id);
alter table reservation add constraint fk_updateBy_reservation foreign key (update_by) references `user`(id);

alter table blog add constraint fk_idUser_blog foreign key (id_user) references `user` (id);

alter table blogtag add constraint fk_idBlog_blogtag foreign key(id_blog) references blog (id);
alter table blogtag add constraint fk_idTag_blogtag foreign key (id_tag) references tag (id);

alter table imageblog add constraint fk_idBlog_imageblog foreign key(id_blog) references blog(id);

alter table comment add constraint fk_idBlog_comment foreign key(id_blog) references blog(id);

alter table `user` add constraint fk_idRole_user foreign key (id_role) references `role` (id);

alter table bank_account add constraint fk_idUser_user foreign key (id_user) references `user`(id);
