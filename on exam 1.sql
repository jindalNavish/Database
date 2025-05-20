use hr;

select Country_ID,Country_name,Region_ID
from countries
where region_id = 3
order by country_id;

select last_name,first_name,employee_id,hire_Date,curdate() as "current_date", round(datediff(curdate(),hire_date)/365,0) as "NumOfYears"
from employees 
order by employee_id;

select count(employee_id) 
from employees 
where commission_pct <> 0 ;

select e.employee_id, first_name, last_name
from employees e join job_history jh ON
e.employee_id = jh.employee_id
group by e.employee_id, first_name, last_name
having count(jh.EMPLOYEE_ID) >= 2;

