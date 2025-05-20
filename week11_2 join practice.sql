use hr;

select coalesce(department_name,'Total') as department, SUM(salary) as totalsalary
from employees e left join departments d ON
e.department_id = d.department_id
where e.DEPARTMENT_ID in (40,50,60)
group by department_name with rollup;

select coalesce(department_name,'Total') as department, COUNT(employee_id) as num_of_empl
from employees e left join departments d ON
e.department_id = d.department_id
group by department_name with rollup;

select e.employee_id, first_name, last_name
from employees e left join job_history jh ON
e.employee_id = jh.employee_id
group by e.employee_id, first_name, last_name
having count(jh.EMPLOYEE_ID) = 2;

select e.employee_id, first_name, last_name
from employees e left join job_history jh ON
e.employee_id = jh.employee_id 
where jh.employee_id is NULL;

select e.employee_id , e.last_name , e.first_name , COUNT(e.employee_id) as num_of_empl
from employees e left outer join employees d ON
e.employee_ID = d.MANAGER_ID 
group by e.employee_id,e.employee_id , e.last_name , e.first_name ,e.employee_id ;

select department_name ,e.employee_id , e.last_name , e.first_name , COUNT(e.employee_id) as num_of_empl
from employees e  join employees m ON
e.employee_ID = m.MANAGER_ID 
join departments d ON
d.manager_id = e.employee_id
group by department_name,e.employee_id,e.employee_id , e.last_name , e.first_name ,e.employee_id ;

select coalesce(department_name,'total') as department, count(e.employee_id) as num_of_empl
from employees e join departments d ON
e.department_id = d.department_id 
join locations l ON
d.location_id = l.location_id
join countries c ON
l.country_id = c.country_id
join regions r ON
c.Region_ID = r.region_id 
where region_name  = 'Europe'
group by department_name with rollup;

select department_name , COUNT(employee_id) as num_of_empl,
CASE
	when count(employee_id) > 40 then 'A'
    when count(employee_id) between 10 and 40 then 'B'
    when count(employee_id) <10 and count(employee_id)>0 then 'C'
    ELSE 'D'
END AS department_size
from employees e right join departments d ON
e.department_id = d.department_id
group by department_name;

select country_name , city, department_name, count(employee_id) as num_of_empl
from employees e left join departments d ON
e.department_id = d.department_id 
left join locations l ON
d.location_id = l.location_id
left join countries c ON
l.country_id = c.country_id
group by Country_Name, DEPARTMENT_NAME,city,employee_id
order by country_name, department_name;

-- in exam maybe