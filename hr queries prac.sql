use hr;

select *
from locations
where Country_ID='US';

select *
from departments
where location_id in(1400,1500,1600,1700);

-- combining two queries

select *
from departments
where location_id in(select location_id
from locations
where Country_ID='US');

select * 
from employees
where department_id in(select department_id
from departments
where location_id in(select location_id
from locations
where Country_ID='US'));

select * 
from countries
where region_id=1;

select * 
from countries
where region_id=(
select region_id from regions where
region_name = 'Europe');

select * from employees
where employee_id not in(select 
distinct employee_id 
from job_history); 

select * from employees 
where employee_id in( select
manager_id from departments
where manager_id <>0);

select * from employees 
where employee_id in( select distinct
manager_id from employees
where manager_id <>0);

select * from locations
where location_id not in( select distinct
location_id from departments);

select * from countries
where country_id not in( select distinct
country_id from locations);

select sum(salary) as total from employees where department_id=(select 
department_id from departments where
department_name = 'IT');

select * from employees where department_id=(select 
department_id from departments where
department_name = 'IT');

