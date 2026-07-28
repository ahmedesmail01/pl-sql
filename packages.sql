-- select * from employees;

create or replace package emp_pack 
    as
    procedure hire_emp(e_f_name in employees.first_name%type , e_salary in employees.salary%type);
    function get_salary (e_id in employees.employee_id%type) return employees.salary%type;
    end emp_pack;
    /



create or replace package body emp_pack  is 

    procedure hire_emp(e_f_name in employees.first_name%type , e_salary in employees.salary%type)
        is 
        begin
         insert into EMPLOYEES(FIRST_NAME, SALARY) values (e_f_name , e_salary);
         DBMS_OUTPUT.PUT_LINE('employee added');
        end hire_emp;

    function get_salary (e_id in employees.employee_id%type) return employees.salary%type is
        v_salary employees.salary%type;
        begin
            select salary into v_salary from employees where employee_id = e_id;
            return v_salary;

        end get_salary ;
    end emp_pack;
    /
