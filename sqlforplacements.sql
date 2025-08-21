CREATE DATABASE ORG;
USE ORG;

CREATE TABLE emp (
    worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name CHAR(25),
    last_name CHAR(25),
    salary INT,
    joining_date DATETIME,
    department CHAR(25)
);

INSERT INTO emp (
    first_name,
    last_name,
    salary,
    joining_date,
    department
) VALUES
('Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
('Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
('Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
('Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
('Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
('Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
('Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
('Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

select * from emp;

create table bonus(
worker_ref_id int,
bonus_amount int,
bonus_date datetime,
 foreign key (worker_ref_id)
 REFERENCES emp(worker_id)
 on delete cascade
);

INSERT INTO bonus (
    worker_ref_id,
    bonus_amount,
    bonus_date
) VALUES
(1, 5000, '2015-03-01 09:00:00'),
(2, 8000, '2016-06-15 10:30:00'),
(3, 12000, '2017-12-20 11:45:00'),
(4, 15000, '2018-05-25 09:15:00'),
(5, 10000, '2019-08-30 08:50:00'),
(6, 7500, '2020-01-10 09:10:00'),
(7, 4000, '2021-07-19 10:05:00'),
(8, 6000, '2022-02-28 09:40:00');

create table title(
worker_ref_id int ,
worker_title char(34),
affected_from datetime,
foreign key (worker_ref_id)
references emp(worker_id)
on delete cascade
);

INSERT INTO Title (
    worker_ref_id,
    worker_title,
    affected_from
) VALUES
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(5, 'Manager', '2016-06-11 00:00:00'),
(4, 'Asst. Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00'),
(6, 'Lead', '2016-06-11 00:00:00'),
(3, 'Lead', '2016-06-11 00:00:00');

select * from Title;




////dql(DATA QUERY LANGUAGE)
use org;
select * from emp;
select first_name from emp;
select 44+11;
select * from emp where salary>80000;
select* from emp where salary between 200000 and 500000;

-- suppose we want all emp who woker in admin and hr department
-- faltu way
select * from emp where department = 'HR' or department = 'admin';

-- better way
select * from emp where department in ('HR' , 'admin');

-- not operation 
select * from emp where department not in ('hr');

-- is null and is not null
select * from emp where salary is not null;

-- wildcard useing %% and like
-- here we have to get k in betweeen
select * from emp where first_name like '%k%';

-- any one occurance of character with i
select * from emp where first_name like '%_i%';


use org;
select * from emp where salary between 100000 and 500000;
select * from emp where department in ('HR','admin');

-- sorting on basis of salary(ace)
select * from emp order by salary;

-- sorting dec

select * from emp order by salary desc;


-- uniqne value using distinct
 select distinct department from emp;
 
 
 -- grouping of data(using aggregation function count,sum , sub etc)
 select department, count(department) from emp group by department;
 
 -- @ what is the avarge salary of each departemnt
 
 select department , avg(salary) from emp group by department;
 
 -- @ per deartment min salary
 select department , min(salary) from emp group by department;
 
 
 -- @ department count haveing more then 2 worker(groupby having)
 
 select department , count(department) from emp group by department having count(department)>2;

 