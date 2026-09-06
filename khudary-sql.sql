select * from jobs;


select * from employees;

select upper(first_name) from employees;
select lower(first_name) from employees;
select initcap(first_name)  name from employees;
select substr(first_name, 1,1)  name from employees;
select first_name , instr(first_name, 'E',1,2)  name from employees;
select upper(first_name) name , length(first_name) length  from employees;

select first_name , lpad(salary, 10, '#') salary from employees;
select first_name , rpad(salary, 10, '*') salary from employees;
select * from dual;

select trim ('H' from  'Hello World  ') v from dual;
select trim ('d' from  'Hello World') v from dual;
select trim (leading ' ' from  ' Hello World  ') v from dual;
select round(55.499, -1) v from dual;
select round(55.399, 1) v from dual;
select trunc(55.399, 1) v from dual;
select trunc(55.399, 2) v from dual;
select trunc(55.399, -2) v from dual;
select trunc(55.399, -1) v from dual;
select mod(55.399, -1) v from dual;


select sysdate v from dual;
select first_name, round(sysdate - hire_date) / 365 as duration  from employees;
select first_name, next_day(hire_date, 'MONDAY') as duration from employees;
select first_name, next_day(hire_date, 2) as duration from employees;
--date full date format
select hire_date, to_char(hire_date, 'DD-MON-YYYY hh:mi:ss pm') as duration from employees;
select hire_date, add_months(hire_date, 6) as duration from employees;


select to_char(1477, '9,999') v from dual;
select to_char(1477, '$09999') v from dual;


select to_number('1,477', '9,999') v from dual;

-- get date as dd/mm/yyyy  => 05/09/1998 format
select to_date('05-09-1998', 'dd/mm/YYYY') v from dual;


select first_name, hire_date, sum(salary) from employees group by first_name, hire_date;
select department_id, sum(salary) from employees group by department_id;

select first_name, salary from employees where salary = (select max(salary) from employees);


select listagg(first_name, ', ') within group (order by first_name) as names from employees;

select employees.first_name , departments.department_name from employees , departments where 
employees.department_id = departments.department_id;

desc departments;


create table copy_dept as select * from departments;
commit;

select * from copy_dept;

savepoint before_delete;
delete from copy_dept where department_id = 10;
rollback to before_delete;

select  departments from user_tables;

select * from employees where department_id = 20;

create table marketing_employees as select * from employees where department_id = 20;

select * from marketing_employees;


desc employees;

create table employees_copy as select * from employees;
select * from employees_copy;
insert into employees_copy select * from employees where department_id = 30;
commit;

alter table employees_copy add (gender varchar2(10) default 'male');
commit;

desc employees_copy;

-- alter table employees_copy modify (gender varchar2(10) default "male");
alter table employees_copy drop (gender);
desc employees_copy;

rollback;

select * from employees_copy;  

select email , to_char(hire_date, 'dd-mm-yyyy') as hire_date from employees_copy where hire_date > to_date('05-09-2016', 'dd-mm-yyyy') order by hire_date;

rename employees_copy to employees_backup;

<<<<<<< HEAD
create table dept_backup as select * from departments where 1=3;

select * from dept_backup;

desc dept_backup;

select * from employees_backup  order by first_name fetch first 9 percent rows with ties;

select table_name from USER_TABLES;
=======

select table_name from user_tables where table_name like 'EMP%';

select * from user_objects ;

select * from tabs;

describe user_tab_columns;

describe user_constraints;

select * from user_constraints where table_name = 'EMPLOYEES';
>>>>>>> cfcb563372cd41bc556963280d0b8640c0e51f1e
