-- create or replace procedure add_dept (
--     d_id in number,
--     d_name in varchar2
-- ) as 
-- begin

--     insert into departments(department_id, department_name) values (d_id, d_name);
--     dbms_output.put_line('Department ' || SQL%ROWCOUNT || ' row.');
-- end;
-- /


-- execute add_dept(900, 'acc');

-- ---------------------------------------------------------
-- functions
-- ---------------------------------------------------------

-- create or replace function get_emp_count (d_id in number) return number as
--  v_count number;
--  d_name varchar2(30);
-- begin
--     select count(*) into v_count from employees where department_id = d_id;
--     select department_name into d_name from departments where department_id = d_id;
--     dbms_output.put_line('department' || d_name || ' has ' || v_count || ' employees');
--     return v_count;
-- end;


-- select first_name, department_id, get_emp_count(department_id) from employees ;

select text from user_source where name = 'ADD_DEPT' order by line;



-- create or replace procedure formate_phone(
--     phone_number IN OUT varchar2
-- ) as 

-- begin
--     phone_number  := '(' || substr(phone_number, 1,3) || ')' || substr(phone_number, 4,3) || '-' || substr(phone_number, 7);
--     -- dbms_output.PUT_LINE('your formated phone_number is :' || phone_number);
-- end;


-- execute formate_phone('01025698192');

-- declare 
--     v_phone varchar2(20) := '1234567899';
-- begin
--     formate_phone(v_phone);
--     dbms_output.put_line(v_phone);
-- end;
/


