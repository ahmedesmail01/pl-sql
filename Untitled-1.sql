create or replace procedure test_boolean_flag (
   emp_id in employees.employee_id%type
) is
   v_bool         boolean;
   v_emp_salary   employees.salary%type;
   v_bool_string  varchar2(5);
   v_salary_limit constant employees.salary%type := 8000;
begin
    -- Your SQL code here
   if emp_id = null then
      dbms_output.put_line('Employee ID is null');
   else
      select salary
        into v_emp_salary
        from employees
       where employee_id = emp_id;
      if v_emp_salary > v_salary_limit then
         v_bool := true;
         v_bool_string := 'TRUE';
      else
         v_bool := false;
         v_bool_string := 'FALSE';
         dbms_output.put_line('EMP ID: '
                              || emp_id
                              || ' has salary greater than '
                              || v_salary_limit
                              || ': ' || v_bool_string);
      end if;

   end if;

   exception 
    when no_data_found then 
      dbms_output.PUT_LINE('No employee found with ID: ' || emp_id);
end;