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


  