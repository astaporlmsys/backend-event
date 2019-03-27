create table adresse (id_adress bigint generated by default as identity, adresse varchar(255), pays varchar(255), zip_code varchar(255), primary key (id_adress))
create table contact (id bigint generated by default as identity, date_reception timestamp, date_traitement timestamp, id_contact varchar(255), message clob, sujet varchar(255), id_user_contact varchar(255) not null, primary key (id))
create table document_metadata (id_document bigint generated by default as identity, document_date binary(255), file_name varchar(255), id_user varchar(255), url_image varchar(255), uuid varchar(255), image_event varchar(255) not null, primary key (id_document))
create table event (id bigint generated by default as identity, adress_event varchar(255), desc_event clob, desc_organisation clob, end_event timestamp, id_event varchar(255), organisation varchar(255), price integer not null, start_event timestamp, title_event varchar(255), id_type_evenement bigint, id_user_event varchar(255) not null, primary key (id))
create table type_evenement (id_type_evenement bigint generated by default as identity, type_evenement varchar(255), primary key (id_type_evenement))
create table user_event (id bigint generated by default as identity, id_events bigint not null, id_user bigint not null, primary key (id))
create table users (id bigint generated by default as identity, actif boolean not null, email varchar(255), firstname varchar(255), id_users varchar(255), lastname varchar(255), password varchar(256), phone varchar(255), primary key (id))
alter table event add constraint UK_dpy7ujo8lh0q580ta5las6n25 unique (id_event)
alter table users add constraint UK_1x52hkauhan4adbq4gkw8kn6s unique (id_users)
alter table contact add constraint FKgr9mgbwiic0ukxq463bv206a3 foreign key (id_user_contact) references users (id_users)
alter table document_metadata add constraint FKlnliq8wn27uph9gp6ct4o3f5k foreign key (image_event) references event (id_event)
alter table event add constraint FK657go25lb5nfiuux8u39v5kog foreign key (id_type_evenement) references type_evenement
alter table event add constraint FKrb91b4nla7m6s6x7i194n6f62 foreign key (id_user_event) references users (id_users)
