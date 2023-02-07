create table if not exists donations(
donation_id integer primary key auto_increment,
stream_id integer,
donator_id integer,
amount numeric not null,
donated_at datetime default current_timestamp,
comment varchar(256),
FOREIGN KEY (donator_id) REFERENCES users(user_id),
FOREIGN KEY (stream_id) REFERENCES streams(stream_id)
);