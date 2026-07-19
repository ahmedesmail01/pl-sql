-- create or replace procedure test_boolean_flag (
--    emp_id in employees.employee_id%type
-- ) is
--    v_bool         boolean;
--    v_emp_salary   employees.salary%type;
--    v_bool_string  varchar2(5);
--    v_salary_limit constant employees.salary%type := 8000;
-- begin
--     -- Your SQL code here
--    if emp_id = null then
--       dbms_output.put_line('Employee ID is null');
--    else
--       select salary
--         into v_emp_salary
--         from employees
--        where employee_id = emp_id;
--       if v_emp_salary > v_salary_limit then
--          v_bool := true;
--          v_bool_string := 'TRUE';
--       else
--          v_bool := false;
--          v_bool_string := 'FALSE';
--          dbms_output.put_line('EMP ID: '
--                               || emp_id
--                               || ' has salary greater than '
--                               || v_salary_limit
--                               || ': ' || v_bool_string);
--       end if;

--    end if;

--    exception 
--     when no_data_found then 
--       dbms_output.PUT_LINE('No employee found with ID: ' || emp_id);
-- end;





-------------------------------------------------
-- case statement to test the procedure
-------------------------------------------------




-- DECLARE

-- v_grade varchar2(1) := '&grade';


-- begin


--    case v_grade
--       when 'A' then
--          dbms_output.put_line('Excellent');
--       when 'B' then
--          dbms_output.put_line('Good');
--       when 'C' then
--          dbms_output.put_line('Average');
--       when 'D' then
--          dbms_output.put_line('Below Average');
--       when 'F' then
--          dbms_output.put_line('Failing');
--       else
--          dbms_output.put_line('Invalid grade');
--    end case;



-- end;


-- create or replace procedure get_by_manager (
--    manager_id in employees.manager_id%type
-- )

-- is 

-- --all rows of employees who report to a specific manager.
-- begin
--    -- for emp_rec in (select * from employees where manager_id = manager_id) loop
--    --    dbms_output.put_line('Employee ID: ' || emp_rec.employee_id || ', Name: ' || emp_rec.first_name || ' ' || emp_rec.last_name);
--    -- end loop;

-- end;


-- -- create table retired_employees (
--    employee_id number(6) primary key,
--    first_name varchar2(20),
--    last_name varchar2(25),
--    retired_salary number(8,2),
--    retirement_date date
-- );

-- create or replace procedure retire_employees_with_salary_above (
--    salary_limit in employees.salary%type
-- ) is
--    cursor emp_cursor is
--       select employee_id, first_name, last_name, salary
--       from employees
--       where salary > salary_limit;
-- begin
--    delete from retired_employees;

--    for emp_rec in emp_cursor loop
--       insert into retired_employees (
--          employee_id,
--          first_name,
--          last_name,
--          retired_salary,
--          retirement_date
--       ) values (
--          emp_rec.employee_id,
--          emp_rec.first_name,
--          emp_rec.last_name,
--          emp_rec.salary,
--          sysdate
--       );
--    end loop;

--    commit;
-- end;
-- /

-- begin
--    retire_employees_with_salary_above(10000);
-- end;
-- /

-- select * from retired_employees;



create or replace procedure retire_employees_with_salary_above2 (
   salary_limit in employees.salary%type
) is 
   cursor emp_cursor is
      select employee_id , first_name, last_name, salary from employees where salary > salary_limit;
   
   begin

      delete from retired_employees;

      for emp_rec in emp_cursor loop 
         insert into retired_employees(
            employee_id, first_name, last_name, retired_salary, retirement_date
         ) values (
            emp_rec.employee_id, emp_rec.first_name, emp_rec.last_name, emp_rec.salary, sysdate
         );
      end loop;
      commit;

   end;
   /



