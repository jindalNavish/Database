use hr;

-- Question 1

SELECT c.country_name, l.city,
COUNT(e.employee_id) AS num_employees
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
GROUP BY c.country_name, l.city
ORDER BY c.country_name, l.city;

-- Question 2  

SELECT e.employee_id, e.last_name AS employee_last_name, e.first_name AS employee_first_name,
e.manager_id AS first_level_manager_id, m1.last_name AS first_level_manager_last_name, m1.first_name AS first_level_manager_first_name,
m1.manager_id AS second_level_manager_id, m2.last_name AS second_level_manager_last_name, m2.first_name AS second_level_manager_first_name,
m2.manager_id AS third_level_manager_id
FROM employees e
LEFT JOIN employees m1 ON e.manager_id = m1.employee_id
LEFT JOIN employees m2 ON m1.manager_id = m2.employee_id

ORDER BY e.last_name, e.first_name;
