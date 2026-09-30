create database my_database;
use my_database;
create table students (
	students_id int auto_increment primary key,
    name varchar(50) not null,
    major varchar(100) not null,
    age int
    );
insert into students (name,major,age) values
('Nguyen Minh Huy','CNTT',20),
('Nguyen Qui Son','QTKD',19),
('Nguyen Tan Trung','TMDT',18),
('Nguyen Minh Duc','Logistis',18),
('Bui Quoc Tien ','CNTT',18),
('Le Nguyen Thien Nhan','TMDT',18),
('Huynh Dieu Phong','CNTT',18),
('Ngo Thi Ngan','TMDT',18),
('Nguyen Khanh Nhu','TMDT',18),
('Bui Thi Thanh Xuan','TMDT',18);
select*from students;
delete from students where students_id in (1,2);
select*from students;
update students
set major = 'CNTT'
where students_id in(8,9);
select*from students














