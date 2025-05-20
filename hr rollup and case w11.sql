use hr;

-- example 6

SELECT employee_id, last_name, first_name, e.department_id, salary,
CASE
	WHEN salary < 5000 then 'low'
    WHEN salary between 5000 and 9999 then 'medium'
    WHEN salary > 9999 then 'high'
    ELSE 'unknown'
END as Salary_Range

from employees e
left join departments d ON 
e.department_id = d.department_id;

-- rollup for the total number of rows, coalesce to replace null values with whatever value we write
 
SELECT COALESCE(department_name,'Total') AS Department,
COUNT(employee_id) as num_of_empl
FROM departments d LEFT JOIN employees e ON
d.department_id=e.department_id
GROUP BY department_name WITH ROLLUP;

SELECT COALESCE(department_name,'Grand Total') as department_name , SUM(salary) as totalsalary
from employees e join departments d
ON e.department_id = d.department_id
where e.department_id IN (40,50,60)
group by department_name with rollup;

SELECT COALESCE(department_name,'Grand Total') as department_name , COUNT(employee_id) as num_of_emp
from departments d left join employees e ON
d.department_id = e.department_id 
group by department_name with rollup;

SELECT coalesce(department_name,'Average') as department , round(avg(salary),2) as avg_sal
from employees e left join departments d ON
d.department_Id = e.department_id
group by department_name with rollup;

