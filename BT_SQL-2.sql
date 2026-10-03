create database btvn2;
use btvn2;
-- B1
create table employees (
	employee_id int auto_increment primary key,
    name varchar(100) not null,
    age int,
    department varchar(100),
    salary decimal(10,2)
);
-- Thêm 5 nhân viên với thông tin bất kỳ.
insert into employees (name, age, department, salary) values
('Huy', 20, 'IT', 9000000),
('Ánh', 23, 'Kế Toán', 8000000),
('Nguyên', 30, 'IT', 20000000),
('Hồng', 24, 'Sale', 7000000),
('Dũng', 22, 'IT', 10000000);
-- Lấy tất cả thông tin của nhân viên thuộc phòng ban "IT".
select*from employees
where department = 'IT';
-- Cập nhật lương của nhân viên có EmployeeID = 2 thành 8,500.00.
update employees
set salary = 8500000
where employee_id = 2;
select*from employees;
-- Xóa nhân viên có EmployeeID = 4.
delete from employees
where employee_id = 4;
select*from employees;

-- B2
create table sales (
	sale_id int primary key,
    employee_id int,
    sale_amount decimal(10,2),
    sale_date date,
    foreign key(employee_id) references employees(employee_id)
);
-- 5 bản ghi bán hàng với EmployeeID trùng khớp bảng Employees.
insert into sales (sale_id,employee_id,sale_amount,sale_date) values
(01,1,11000000,'2026-09-29'),
(02,2,9000000,'2025-08-10'),
(03,3,10000000,'2026-01-22'),
(04,3,12000000,'2026-06-13'),
(05,5,24000000,'2026-07-19');
-- Tính tổng doanh thu từ tất cả các giao dịch.
select SUM(sale_amount)
from sales;
-- Tìm doanh thu trung bình của nhân viên trong phòng ban "IT".
select avg(s.sale_amount) as doanh_thu_tb
from employees as e
join sales as s
on s.employee_id = e.employee_id
where e.department = 'IT';
-- Liệt kê tất cả các nhân viên chưa thực hiện giao dịch nào.
select*
from employees as e
left join sales as s
on  s.employee_id = e.employee_id
where sale_id is null;

-- B3
create table projects (
	project_id int primary key,
    project_name varchar(100),
    department varchar(50)
);

create table assignments (
	assignment_id int primary key,
    employee_id int,
    project_id int,
    foreign key(employee_id) references employees(employee_id),
    foreign key(project_id) references projects(project_id)
);
select*from assignments;
-- 3 dự án cho bảng Projects.
insert into projects (project_id, project_name, department) values
(1, 'Website ban hang', 'IT'),
(2, 'Chien dich quang cao', 'Sale'),
(3, 'Quyet toan nam', 'Ke Toan');
-- 5 bản ghi vào bảng Assignments.
insert into Assignments (assignment_id, employee_id, project_id) values
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 1),
(5, 2, 2);
-- Lấy danh sách nhân viên và dự án mà họ tham gia.
select e.name,e.department,p.project_id,p.project_name
from employees as e
join assignments as a
on a.employee_id = e.employee_id
join projects as p
on p.project_id = a.project_id;
-- Liệt kê các nhân viên không tham gia dự án nào.
select *
from employees as e
left join assignments as a
on a.employee_id = e.employee_id
where a.project_id is null;
-- Tìm số lượng nhân viên trong mỗi dự án.
select count(e.employee_id) as so_luong_nv,p.project_id,p.project_name
from employees as e
join assignments as a
on a.employee_id = e.employee_id
join projects as p
on p.project_id = a.project_id
group by p.project_id,p.project_name;

-- B4
-- Với bảng Employees, thực hiện:
-- Lấy thông tin nhân viên có lương cao nhất.
select *
from employees
order by salary desc
limit 1;
-- Lấy danh sách nhân viên thuộc phòng ban "IT" sắp xếp theo tuổi giảm dần.
select *
from employees
where department = 'IT'
order by age desc;
-- Tìm nhân viên có lương nằm trong khoảng từ 5,000.00 đến 10,000.00.
select *
from employees
where salary between 5000000 and 10000000;
-- Với bảng Sales, thực hiện:
-- Lấy 3 giao dịch có giá trị cao nhất.
select *
from sales
order by sale_amount desc
limit 3;
-- Tìm tất cả các giao dịch được thực hiện trong tháng hiện tại.
select*
from sales
where month(sale_date)=10 and year(sale_date)=2026;


