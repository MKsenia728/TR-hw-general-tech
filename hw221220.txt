-- +++++++++++++++++++++++++++++++++++++home work 2+++++++++++++++++++++++++++++++++++++++++++
use gt37_38;
select * from employees;
select * from employees where salary > 12000;
set sql_safe_updates=0;
update employees set salary = salary * 5
where department = 'Human Resources';
select * from employees
where department = 'Marketing' and salary < 2850;
update employees set salary = salary * 10
where first_name in("Laura","Adam");
update employees set last_name = 'King'
where first_name='Diana' and last_name='Lorentz';
delete from employees where department = 'sales';
update employees set salary = salary + 5000, department = 'Marketing'
where first_name ='John' and last_name='Russell';
update employees set salary = salary / 10
where first_name in("Laura","Adam");
update employees set email = 'BISSOTLAURA'
where first_name ='Laura' and last_name='Bissot';
update employees set last_name = 'Lorentz', salary = salary + 2000
where first_name='Diana' and last_name='King';
-- +++++++++++++++++++++++++++++++++++++home work 1+++++++++++++++++++++++++++++++++++++++++++
use gt37_38;
create table studentes
(id integer primary key auto_increment, 
firstname varchar(128) not null,
lastname varchar(128) not null,
class integer check(class between 1 and 10),
subject varchar(128) not null,
mark integer check(mark between 0 and 5)
);
insert into studentes(firstname, lastname, class, subject, mark)
values
('Ася','Авдеева',1,'математика',3),
('Петр','Булов',1,'рисование',0),
('Олег','Кука',1,'физкультура',2),
('Игорь','Птичкиг',3,'физкультура',5),
('Федор','Лук',4,'математика',2),
('Ким','Орехов',7,'физика',4),
('Сергей','Ли',8,'физика',5),
('Алина','Инина',10,'литература',2),
('Иванна','Апрель',8,'математика',1),
('Никита','Кон',1,'расование',0),
('Андрей','Чуваров',9,'физика',5);
select * from studentes;
set sql_safe_updates=0;
delete from studentes
where mark = 0;
select * from studentes where mark>3;
select * from studentes where mark<3 and class=1;
delete from studentes where mark<3 and class=1;
select * from studentes where firstname like '_____%';
select * from studentes where lastname like '____%' and lastname like 'а%';
delete from studentes where not(subject='математика' and mark>4 or class between 7 and 10 and mark < 3);
drop table studentes;