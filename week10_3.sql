
select region_name, country_name, department_name, count(employee_id) as num_of_emp1
from regions r join countries c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
JOIN employees e ON d.department_id = e.department_id
group by region_name, country_name, department_name
union all
-- adding total number of employees
select 'total', '', '', count(employee_id) as num_of_emp1
from regions r join countries c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
JOIN employees e ON d.department_id = e.department_id;

