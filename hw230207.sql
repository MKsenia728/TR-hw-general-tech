use platform;
-- Задача (1)- вывести ТОП-1 юзеров по сумме донатов (КТО БОЛЬШЕ ПОЖЕРТВОВАЛ ДОНАТОВ)- поля- имя_юзера- сумма донатов
select users.fullname as best_donator, sum(donations.amount) as sum_donation
from donations
left join users on donations.donator_id=users.user_id
group by donations.donator_id
order by sum_donation desc
limit 1;
-- ЗАДАЧА (2)- вывести ТОП-3 юзеров по сумме собранных донатов- поля- имя_юзера- сумма_собранных_донатов
select users.fullname as recipient, sum(donations.amount) as sum_donation
from donations
left join streams on donations.stream_id=streams.stream_id
left join users on streams.user_id=users.user_id
group by users.user_id
order by sum_donation desc
limit 3;
-- ========== hw 07.02.23========
create database if not exists onlinechat;
use onlinechat;

create table if not exists users
(user_id integer primary key auto_increment,
fullname varchar(256) not null,
age integer check(age between 10 and 120),
country varchar(64),
is_blocked BOOL default false,
created_at datetime default current_timestamp
);

create table if not exists messages(
message_id integer primary key auto_increment,
user_id integer,
user_to_id integer,
message text not null,
created_at datetime default current_timestamp,
is_blocked  BOOL default false,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (user_to_id) REFERENCES users(user_id)
);

create table if not exists reactions(
reaction_id integer primary key auto_increment,
user_id integer,
message_id integer,
value integer not null check(value between 1 and 5),
created_at datetime default current_timestamp,
is_blocked bool default false,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (message_id) REFERENCES messages(message_id)
);
