
-- Remove the previous cleaned table if it exists
DROP TABLE IF EXISTS employees_clean;

-- Create a cleaned employee dataset
CREATE TABLE employees_clean AS
SELECT
    employee_id,
    TRIM(first_name) AS first_name,
    TRIM(last_name) AS last_name,

    CASE
        WHEN LOWER(TRIM(department)) IN ('hr', 'human resources')
            THEN 'Human Resources'
        ELSE TRIM(department)
    END AS department,

    TRIM(job_title) AS job_title,

    CASE
        WHEN LOWER(TRIM(location)) IN ('dallas tx', 'dallas, tx')
            THEN 'Dallas, TX'
        ELSE TRIM(location)
    END AS location,

    NULLIF(TRIM(hire_date), '')::DATE AS hire_date,
    NULLIF(TRIM(salary), '')::NUMERIC AS salary,

    CASE
        WHEN LOWER(TRIM(employment_status)) = 'active'
            THEN 'Active'
        WHEN LOWER(TRIM(employment_status)) = 'terminated'
            THEN 'Terminated'
        ELSE TRIM(employment_status)
    END AS employment_status,

    NULLIF(TRIM(termination_date), '')::DATE AS termination_date

FROM employees_raw

-- Exclude employee IDs appearing more than once
-- Pending verification of conflicting source records
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM employees_raw
    GROUP BY employee_id
    HAVING COUNT(*) > 1
);

