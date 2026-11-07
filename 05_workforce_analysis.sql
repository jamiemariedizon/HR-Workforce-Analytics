
-- HR Workforce Analytics
-- Workforce Analysis Queries

-- 1. Identify terminated employees with missing termination dates
SELECT
    employee_id,
    first_name,
    last_name,
    employment_status,
    termination_date
FROM employees_clean
WHERE employment_status = 'Terminated'
  AND termination_date IS NULL;


-- 2. Employee count by employment status
SELECT
    employment_status,
    COUNT(*) AS employee_count
FROM employees_clean
GROUP BY employment_status
ORDER BY employee_count DESC;


-- 3. Active employee headcount by department
SELECT
    department,
    COUNT(*) AS active_headcount
FROM employees_clean
WHERE employment_status = 'Active'
GROUP BY department
ORDER BY active_headcount DESC;


-- 4. Average salary by department (active employees)
SELECT
    department,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees_clean
WHERE employment_status = 'Active'
GROUP BY department
ORDER BY average_salary DESC;


-- 5. Count terminated employees with missing termination dates
SELECT
    COUNT(*) AS missing_termination_dates
FROM employees_clean
WHERE employment_status = 'Terminated'
  AND termination_date IS NULL;


-- 6. Active employee headcount by location
SELECT
    location,
    COUNT(*) AS active_headcount
FROM employees_clean
WHERE employment_status = 'Active'
GROUP BY location
ORDER BY active_headcount DESC;
