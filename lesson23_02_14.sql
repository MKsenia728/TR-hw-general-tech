create database if not exists chat;
use chat;
drop database onlinechat;

create table if not exists users
	(user_id integer primary key auto_increment,
	fullname varchar(256) not null,
	country varchar(64),
	is_blocked BOOL default false,
	created_at datetime default current_timestamp
);

create table chats(
    chat_id int primary key auto_increment,
    topic nvarchar(256) not null,
    created_at datetime default current_timestamp,
    user1_id INTEGER,
    user2_id INTEGER,
    FOREIGN KEY (user1_id) REFERENCES users(user_id),
    FOREIGN KEY (user2_id) REFERENCES users(user_id)
);

create table if not exists messages(
	message_id integer primary key auto_increment,
	chat_id integer,
	author_id integer,
	recipient_id integer,
	text text not null,
	created_at datetime default current_timestamp,
	is_removed  BOOL default false,
	FOREIGN KEY (author_id) REFERENCES users(user_id),
	FOREIGN KEY (recipient_id) REFERENCES users(user_id),
	FOREIGN KEY (chat_id) REFERENCES users(user_id)
);

create table if not exists reactions(
	reaction_id integer primary key auto_increment,
	user_id integer,
	message_id integer,
	value integer not null check(value between 1 and 5),
	created_at datetime default current_timestamp,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (message_id) REFERENCES messages(message_id)
);

-- ================lesson 14.02.23 ===================
insert into users (fullname, country) 
values("Ivan Ivanov", "Germany"),
		("Serg Bern", "France"),
        ("Anna Lin", "Poland"),
        ("Maria Petrova", "Germany"),
        ("Vlad Sidorov", "France");
 select * from users;       
insert into chats (topic,user1_id, user2_id) 
values  ("Animals", 1,2),
		("Life and Sport", 4,1),
        ("Germany", 2,3),
        ("Berlin shopping", 3,5),
        ("Any", 1,5);
insert into chats (topic,user1_id, user2_id) 
values  ("best",2,1);
select * from chats;
insert into messages (chat_id,author_id,recipient_id,text) 
values  
		(1, 1, 2, "Cat"),
		(1, 2, 1, "Dog"),
		(1, 1, 2, "Cat and dog"),
		(2, 1, 4, "Fitness"),
		(3, 2, 3, "Life in Germany"),
		(3, 3, 2, "Like"),
		(4, 3, 5, "Aldi"),
		(4, 5, 3, "Netto"),
		(5, 1, 5, "111"),
		(5, 1, 5, "222");
select * from messages;
insert into reactions (user_id, message_id, value) 
values  
		(1, 1, 5),
		(2, 1, 5),
		(4, 4, 3),
		(5, 2, 4),
		(5, 3, 5);
select * from reactions;
insert into messages (chat_id,author_id,recipient_id,text) 
values  
		(1, 1, 2, "last");

SELECT topic, users.fullname 
FROM chats 
LEFT JOIN users ON 
CASE 
WHEN user1_id = 1 THEN user2_id 
WHEN user2_id = 1 THEN user1_id
END = users.user_id
WHERE user1_id = 1 OR user2_id = 1;

SELECT text, created_at FROM messages
WHERE author_id=1 OR recipient_id=1
GROUP BY chat_id, text, created_at;

-- sql_mode=only_full_group_by;
SET sql_mode=(SELECT REPLACE(@@sql_mode,‘ONLY_FULL_GROUP_BY‘,‘‘));

select count, 
authors.fullname as sender, recipients.fullname as recipient 
from messages
left join users authors on messages.author_id=authors.user_id
left join users recipients on messages.recipient_id=recipients.user_id

where chat_id = 1
group by authors.user_id, recipients.user_id;

select messages.text, authors.fullname, recipients.fullname, messages.created_at
from messages
LEFT JOIN users authors ON messages.author_id=authors.user_id
LEFT JOIN users recipients ON messages.recipient_id=recipients.user_id
where chat_id = 1
ORDER BY messages.created_at DESC
LIMIT 200;

select count(*) as count, authors.fullname
from messages
LEFT JOIN users authors ON messages.author_id=authors.user_id
where chat_id = 1
group by authors.user_id;

select count(*) as count, sum(length(text)) as sum, authors.fullname
from messages
LEFT JOIN users authors ON messages.author_id=authors.user_id
group by authors.user_id
order by sum desc;