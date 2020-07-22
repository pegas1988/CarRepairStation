create table hibernate_sequence (next_val bigint);
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );
create table messages (
    id int8 not null,
    colour varchar(255),
    filename varchar(255),
    tag varchar(255),
    text varchar(255) not null,
    year integer not null,
    user_id int8 ,
    primary key (id));
create table user_role (
    user_id int8 not null,
    roles varchar(255));
create table usr (
    id int8 not null,
    activation_code varchar(255),
    active bit not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id));
alter table messages add constraint message_user_fk foreign key (user_id) references usr (id);
alter table user_role add constraint user_role_user_fk foreign key (user_id) references usr (id);