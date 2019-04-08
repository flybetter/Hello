drop table if exists employees;

create table employees (
  id             int(6) unsigned not null auto_increment,
  first_name     varchar(20)     not null,
  last_name      varchar(25)     not null,
  email          varchar(25)              default null,
  phone_number   varchar(20)     not null,
  hire_date      date,
  job_id         int(10),
  salary         decimal(8, 2),
  commission_pct decimal(2, 2),
  department_id  int(6),
  manager_id     int(5),
  primary key (id),
  index index_first_name(first_name),
  index index_last_name(last_name)
) engine=Innodb charset='utf8';

drop table if exists salary;

create table salary(
  job_id int(6) unsigned auto_increment,
  job_title varchar(8),
  max_salary int(6),
  min_salary int(6),
  primary key(job_id)
);

drop table if exists departments;

create table departments(
  department_id int(4) unsigned auto_increment,
  department_name varchar(30),
  manager_id int(6) ,
  location_id int(4),
  primary key (department_id)
);

drop table if exists locations;

create table locations(
  location_id int(4),
  street_address varchar(40),
  postal_code varchar(12),
  city varchar(30),
  state_province varchar(25),
  country_id char(2),
  primary key(location_id)
);

drop table if exists job_grades;

create table job_grades(
  grade_level varchar(3),
  lowest_sal decimal(4,2),
  highest_sal decimal(4,2)
);


--  查询每个月倒数第二天入职的员工信息

select last_name, hire_date
from employees
where hire_date = last_day(hire_date) - 1;

--  查询last_name 为'Chen'的manager的信息
--

select manager_id from employees where last_name='Chen'

select * from employees where id= 108
--

select * from employees where id =(select manager_id from employees where last_name='Chen');

--

select m.* from employees as m, employees as e where m.id =e.manager_id and e.last_name='Chen';

-- 查询平均工资大于8000的部门id和它的平均工资

select department_id,avg(salary) from employees group by department_id having avg(salary)>8000;

-- 查询工资最低的员工信息：last_name,salary

select last_name,salary from employees where salary=(select min (salary)from employees);

-- 查询平均工资最低的部门信息

select * from departments where department_id=(select department_id from employees  group by department_id having avg (salary)=(select min(avg(salary)) from employees group by department_id))


-- 查询平均工资最低的部门信息和该部门的平均工资

select d.*,(select avg (salary)from employees as e where e.department_id=d.department_id ) from departments as d where department_id=(select department_id from employees group by department_id having avg(salary)=(select min(avg(salary)) from employees group by department_id)
)


-- 查询平均工资最高的job信息

select * from salary where job_id =(
select job_id from employees group by job_id having avg(salary)=(
select max(avg (salary))from employees group by  job_id))

-- 查询平均工资高于公司平均工资的部门有哪些？

select department_name from departments where department_id=(
select department_id from employees group by department_id having avg (salary)=(select avg(salary) from employees group by department_id having avg(salary)>(select avg (salary) from employees))
)

-- 查询出公司中所有manager的详细信息

select * from employees where id in (select distinct manager_id from employees);

-- 各个部门中最高工资中最低的那个部门的最低工资是多少

select min(salary)from employees where department_id=(select department_id from employees group by department_id having max(salary)=(select min(max(salary)) from employees group by department_id)
)

-- 查询平均工资最高的部门的manager的详细信息:last_name,department_id, email, salary

select * from employees where id  in (
select distinct  managerid from employees where department_id=(select department_id from employees group by department_id having avg(salary)=(select max(avg(salary)) from employees group by department_id)
))

-- 查询1999年来公司的人中所有员工的最高工资的那个员工的信息

select * from employees where salary=(select max(salary)from employees where date_fromat(hire_date,'%Y')='1999') and date_format(hire_date,'%Y')='1999';



-- 高级查询












