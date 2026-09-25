begin
   dbms_output.put_line('hello pl sql');
   dbms_output.put_line('father''s day');
   dbms_output.put_line(q'(father's day)');
end;
/


declare
   v_name varchar(20) := 'Ahmed';
   v_age  number := 28;
   v_date date;
begin
   dbms_output.put_line('Name: ' || v_name);
   dbms_output.put_line('Age: ' || v_age);
   v_date := '2-sep-2026';
   dbms_output.put_line('Date: ' || v_date);
end;
/

declare
 
--  variable v_sal employees.salary%type;

 begin
   select salary
     into :v_sal
     from employees
    where employee_id = 100;
-- dbms_output.put_line('Salary: ' || :v_sal);
end;
/

print v_sal;


select *
  from user_tables
 where table_name like '%MPLOY%';


select *
  from employees
 where employee_id = 100;


select *
  from employees
 where department_id = 20;


declare
   v_rows_updated number := 0;
begin
   update employees
      set
      salary = salary + 200
    where department_id = 20;

   v_rows_updated := sql%rowcount;
   dbms_output.put_line('Rows Updated' || v_rows_updated);
end;
/


declare
   v_num number := &v;
begin
   if v_num > 10 then
      dbms_output.put_line('Number is greater than 10');
   else
      dbms_output.put_line('Number is less than or equal to 10');
   end if;
end;
/


-- collections

declare
   type tab_no is
      table of varchar2(100) index by pls_integer;
   v_tab tab_no;
begin
   v_tab(1) := 'Ahmed';
   v_tab(2) := 'Esmail';
   v_tab(5) := 'Nasr';
   dbms_output.put_line('my full name is : '
                        || v_tab(1)
                        || ' '
                        || v_tab(5)
                        || ' ' || v_tab(2));


end;
/


-- nested table

declare
   type loc_type is
      table of varchar2(200);
   v_loc loc_type := loc_type(
      'cairo',
      'alex',
      'giza'
   );
begin
   dbms_output.put_line('my locations are : '
                        || v_loc(1)
                        || ' '
                        || v_loc(2)
                        || ' ' || v_loc(3));


   v_loc.extend();
   v_loc(4) := 'Gharbia';
   dbms_output.put_line('my city  : ' || v_loc(4));
end;
/

select *
  from departments;

declare
   cursor marketing_emps is
   select *
     from employees
    where department_id = 30;

begin

-- select * from marketing_emps;
-- dbms_output.put_line(marketing_emps);
-- marketing_emps;

-- open marketing_emps;

   for emp in marketing_emps loop
      dbms_output.put_line('Employee Name: '
                           || emp.first_name
                           || ' ' || emp.last_name);
   end loop;

-- marketing_emps%rowcount;
-- dbms_output.put_line(marketing_emps%rowcount );
-- dbms_output.put_line(marketing_emps%isopen );

   if marketing_emps%isopen then
      dbms_output.put_line('Cursor is open');
   else
      dbms_output.put_line('Cursor is closed');
   end if;


end;
/


select *
  from employees
 where department_id = 20;

declare
   cursor marketing_emps is
   select *
     from employees
    where department_id = 20
   for update;

begin
   for emp in marketing_emps loop
      update employees
         set
         salary = salary + 100
       where current of marketing_emps;

   end loop;
end;
/


commit;


declare
   v_emp_name employees.first_name%type;
begin
   select first_name
     into v_emp_name
     from employees
    where employee_id = 1;

   dbms_output.put_line('Employee Name: ' || v_emp_name);
exception
   when no_data_found then
      dbms_output.put_line('No employee found with the given ID');
end;
/



select * from user_source where name like 'update%' ;


-- create or replace procedure update_salary (
--     p_emp_id     in employees.employee_id%type,
--     p_new_salary in employees.salary%type
-- ) is
-- begin
--     if p_emp_id is null then
--         raise_application_error(-20001, 'Employee ID is required');
--     end if;

--     if p_new_salary is null or p_new_salary <= 0 then
--         raise_application_error(
--             -20002,
--             'Salary must be greater than zero'
--         );
--     end if;

--     update employees
--        set salary = p_new_salary
--      where employee_id = p_emp_id;

--     if sql%rowcount = 0 then
--         raise_application_error(
--             -20003,
--             'Employee not found: ' || p_emp_id
--         );
--     end if;
-- end update_salary;
-- /


execute update_salary(10, 24000);

select * from employees where EMPLOYEE_ID = 10;


create or replace procedure emp_sal_update (
    p_emp_id in employees.employee_id%type,
    p_new_salary in employees.salary%type
) is 
begin
    if p_emp_id is null then raise_application_error(-20001 ,'employee id is required');
    end if ;
    if p_new_salary is null or 
        p_new_salary <= 0 
     then raise_application_error(-20002, 'p_new_salary must be more than 0');
      end if ;

    update employees 
    set salary = p_new_salary 
    where employee_id = p_emp_id;

    if sql%rowcount = 0 then raise_application_error(-20003, 'user with this id not found ' || p_emp_id); 
    end if;

end;
/


execute emp_sal_update(10, 24000);