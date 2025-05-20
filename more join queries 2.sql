use hr;
-- show all the countries and cities
-- display country_name , city
select country_name, city
from countries c left join locations l 
on c.country_id = l.country_id
where city is null;

-- show region name, country name, city , department name, employee id, name ,job title
-- for employees from Canada

select region_name, country_name, department_name, employee_id, last_name, first_name, job_title
from regions r join countries c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
JOIN employees e ON d.department_id = e.department_id
join jobs j on e.job_id = j.job_id
where country_name = 'Canada';

-- show region name, country name, city , department name, employee id, name ,job title
-- show only department managers from Canada
select region_name, country_name, department_name, employee_id, last_name, first_name, job_title
from regions r join countries c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
JOIN employees e ON d.manager_id = e.employee_id
join jobs j on e.job_id = j.job_id
where country_name = 'Canada';

-- alt
select region_name, country_name, department_name, employee_id, last_name, first_name, job_title
from regions r join countries c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
JOIN employees e ON d.department_id = e.department_id
join jobs j on e.job_id = j.job_id
where country_name = 'Canada'
AND employee_id in (select distinct manager_id from departments where manager_id <>0);


