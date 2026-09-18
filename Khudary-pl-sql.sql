begin
dbms_output.put_line('hello pl sql');
dbms_output.put_line('father''s day');
dbms_output.put_line(q'(father's day)');
end;
/

                  
declare 

v_name varchar(20) := 'Ahmed';
v_age number := 28;
v_date date;


begin
dbms_output.put_line('Name: ' || v_name);
dbms_output.put_line('Age: ' || v_age);
v_date := '2-sep-2026';
dbms_output.put_line('Date: ' || v_date);
end;
/

declare
 
 variable v_sal employees.salary%type;


begin

select salary into :v_sal from employees where employee_id = 100;
-- dbms_output.put_line('Salary: ' || :v_sal);
end;
/

print v_sal;


select *  from user_tables where table_name like '%MPLOY%';


select * from EMPLOYEES  where employee_id = 100;


select * from employees where department_id = 20;


declare 

v_rows_updated number := 0 ;

begin 

update employees set salary = salary + 200 where department_id = 20;

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

type tab_no is table of varchar2(100) 
index by pls_integer;

v_tab tab_no;

begin 

v_tab(1) := 'Ahmed';
v_tab(2) := 'Esmail';   
v_tab(5) := 'Nasr';

dbms_output.put_line('my full name is : ' || v_tab(1) || ' ' || v_tab(5) || ' ' || v_tab(2));


end;
/


-- nested table


declare
type loc_type is table of varchar2(200);

v_loc loc_type := loc_type('cairo', 'alex', 'giza');
begin 

dbms_output.put_line('my locations are : ' || v_loc(1) || ' ' || v_loc(2) || ' ' || v_loc(3));


v_loc.extend();
v_loc(4) := 'Gharbia';
dbms_output.put_line('my city  : ' || v_loc(4));


end;
/