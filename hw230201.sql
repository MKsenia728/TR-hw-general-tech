create database if not exists streaming;
use streaming;
create table if not exists users(
    user_ID integer primary key auto_increment,
	fullname varchar(256) not null,
	email varchar(64) not null,
	is_blocked tinyint(1) default 0,
	dt_reg datetime default current_timestamp
    
);

create table if not exists streams(
    stream_id integer primary key auto_increment,
	user_id integer,
	title varchar(256) not null,
    dt_created datetime default current_timestamp,
	is_completed bool default false,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

create table if not exists reactions(
    reaction_id integer primary key auto_increment,
	user_id integer,
	comment text,
    value integer not null check(value between 1 and 5),
    stream_id integer,
    dt_created datetime default current_timestamp,
	is_blocked bool default false,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (stream_id) REFERENCES streams(stream_id)
);