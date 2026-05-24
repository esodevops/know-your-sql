# Solutions for Join Practice Dataset Questions

## Core Join Questions

1. **List employees with their department names.**

```sql
SELECT e.*, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
```

2. **Show all employees, including those without a department.**

```sql
SELECT e.*, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;
```

3. **Show all departments, including those without employees.**

```sql
SELECT d.*, e.emp_id, e.first_name, e.last_name
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id;
```

4. **List employees with their salary records.**

```sql
SELECT e.*, s.salary, s.pay_date
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id;
```

5. **Show all employees including those without salary records.**

```sql
SELECT e.*, s.salary, s.pay_date
FROM employees e
LEFT JOIN salaries s ON e.emp_id = s.emp_id;
```

6. **List employees with project names.**

```sql
SELECT e.*, p.project_name
FROM employees e
JOIN employee_projects ep ON e.emp_id = ep.emp_id
JOIN projects p ON ep.project_id = p.project_id;
```

7. **Find employees not assigned to any project.**

```sql
SELECT e.*
FROM employees e
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
WHERE ep.project_id IS NULL;
```

8. **List projects with assigned employee names.**

```sql
SELECT p.project_name, e.first_name, e.last_name
FROM projects p
JOIN employee_projects ep ON p.project_id = ep.project_id
JOIN employees e ON ep.emp_id = e.emp_id;
```

9. **Show attendance with employee names.**

```sql
SELECT a.*, e.first_name, e.last_name
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id;
```

10. **Show only absent employees with attendance date.**

```sql
SELECT a.day, e.first_name, e.last_name
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id
WHERE a.status = 'Absent';
```

11. **Show employees and projects including employees with no project.**

```sql
SELECT e.*, p.project_name
FROM employees e
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
LEFT JOIN projects p ON ep.project_id = p.project_id;
```

12. **Show departments and average salary using left joins.**

```sql
SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
LEFT JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;
```

13. **List employees with manager names and department names.**

```sql
SELECT e.first_name, e.last_name, m.first_name AS manager_first, m.last_name AS manager_last, d.dept_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id
LEFT JOIN departments d ON e.dept_id = d.dept_id;
```

14. **Show projects that currently have no employee assignment.**

```sql
SELECT p.*
FROM projects p
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
WHERE ep.emp_id IS NULL;
```

15. **List employees hired after `2023-12-31` with department names.**

```sql
SELECT e.*, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.hire_date > '2023-12-31';
```

16. **Show attendance entries with department names.**

```sql
SELECT a.*, d.dept_name
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id
JOIN departments d ON e.dept_id = d.dept_id;
```

17. **List all employees and whether they have salary records (`Yes/No`).**

```sql
SELECT e.*, CASE WHEN s.emp_id IS NULL THEN 'No' ELSE 'Yes' END AS has_salary
FROM employees e
LEFT JOIN salaries s ON e.emp_id = s.emp_id;
```

18. **Find managers and the number of direct reports each has.**

```sql
SELECT m.emp_id, m.first_name, m.last_name, COUNT(e.emp_id) AS num_reports
FROM employees m
JOIN employees e ON m.emp_id = e.manager_id
GROUP BY m.emp_id, m.first_name, m.last_name;
```

19. **Show employees and all project names they are assigned to (grouped).**

```sql
SELECT e.emp_id, e.first_name, e.last_name, STRING_AGG(p.project_name, ', ') AS projects
FROM employees e
JOIN employee_projects ep ON e.emp_id = ep.emp_id
JOIN projects p ON ep.project_id = p.project_id
GROUP BY e.emp_id, e.first_name, e.last_name;
```

20. **Show departments with employee and project counts.**

```sql
SELECT d.dept_name, COUNT(DISTINCT e.emp_id) AS employee_count, COUNT(ep.project_id) AS project_count
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY d.dept_name;
```

## Aggregate and Self-Join Questions

21. **Count employees per department.**

```sql
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
```

22. **Show each employee with their manager's name.**

```sql
SELECT e.first_name, e.last_name, m.first_name AS manager_first, m.last_name AS manager_last
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;
```

23. **Find employees whose salary is above the average salary.**

```sql
SELECT e.*, s.salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.salary > (SELECT AVG(salary) FROM salaries);
```

24. **Find departments with no employees.**

```sql
SELECT d.*
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;
```

25. **Find employees hired in 2024 with their department names.**

```sql
SELECT e.*, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2024;
```

26. **Find the highest salary in each department.**

```sql
SELECT d.dept_name, MAX(s.salary) AS max_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;
```

27. **Count number of employees without salary records.**

```sql
SELECT COUNT(*)
FROM employees e
LEFT JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.emp_id IS NULL;
```

28. **Find average salary by department.**

```sql
SELECT d.dept_name, AVG(s.salary) AS avg_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;
```

29. **Count attendance `Absent` entries by department.**

```sql
SELECT d.dept_name, COUNT(a.att_id) AS absent_count
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id
JOIN departments d ON e.dept_id = d.dept_id
WHERE a.status = 'Absent'
GROUP BY d.dept_name;
```

30. **Find employees who have more than one project.**

```sql
SELECT e.emp_id, e.first_name, e.last_name, COUNT(ep.project_id) AS project_count
FROM employees e
JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id, e.first_name, e.last_name
HAVING COUNT(ep.project_id) > 1;
```

31. **Find employees managed by `Alice Johnson`.**

```sql
SELECT e.*
FROM employees e
JOIN employees m ON e.manager_id = m.emp_id
WHERE m.first_name = 'Alice' AND m.last_name = 'Johnson';
```

32. **Find departments with more than two employees.**

```sql
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 2;
```

33. **Count projects per employee.**

```sql
SELECT e.emp_id, e.first_name, e.last_name, COUNT(ep.project_id) AS project_count
FROM employees e
LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id, e.first_name, e.last_name;
```

34. **Find employees whose salary is below department average.**

```sql
SELECT e.*, s.salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
JOIN (
  SELECT d.dept_id, AVG(s.salary) AS avg_salary
  FROM departments d
  JOIN employees e ON d.dept_id = e.dept_id
  JOIN salaries s ON e.emp_id = s.emp_id
  GROUP BY d.dept_id
) dept_avg ON e.dept_id = dept_avg.dept_id
WHERE s.salary < dept_avg.avg_salary;
```

35. **Find top 3 departments by total salary.**

```sql
SELECT d.dept_name, SUM(s.salary) AS total_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name
ORDER BY total_salary DESC
LIMIT 3;
```
