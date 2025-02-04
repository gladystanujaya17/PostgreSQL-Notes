-- Week 4: Temporary Table

-- Temporary table ini mirip CTE
-- Bedanya adalah temporary table bisa dipake terus selama satu sesi login
-- Sedangkan CTE, kalau mau dipakai, harus diblok dan diexecute bersamaan dengan querynya
-- CTE hanya bisa dipanggil di query tersebut, jd harus diblok dah deketan sama query yang mau dijalankan

CREATE TEMPORARY TABLE temp_salary AS (
	SELECT emp.first_name, emp.last_name, cli.client_name, SUM(emp.salary) AS emp_total_salary
	FROM employee emp
	JOIN works_with works ON emp.emp_id = works.emp_id
	JOIN client cli ON works.client_id = cli.client_id
	GROUP BY emp.first_name, emp.last_name, cli.client_name
)

SELECT first_name, last_name, client_name, emp_total_salary
FROM temp_salary
WHERE emp_total_salary > 70000
ORDER BY emp_total_salary DESC;