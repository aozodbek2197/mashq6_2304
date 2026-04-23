WITH salary_groups AS (
    SELECT 
        salary,
        COUNT(*) AS employee_count
    FROM employees
    GROUP BY salary
),

duplicate_salaries AS (
    SELECT 
        sg.salary
    FROM salary_groups sg
    WHERE sg.employee_count > 1
),

employees_with_duplicate_salary AS (
    SELECT 
        e.id,
        e.name,
        e.salary
    FROM employees e
    JOIN duplicate_salaries ds
        ON e.salary = ds.salary
)

SELECT *
FROM employees_with_duplicate_salary
ORDER BY salary DESC;
