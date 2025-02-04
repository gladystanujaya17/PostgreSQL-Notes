-- Week 4: Common Table Expression (CTE)

SELECT * FROM employee;
SELECT * FROM client;
SELECT * FROM works_with;

-- CTE bisa dipakai untuk mengurangi kompelksitas dari penulisan subquery

-- Ini buat melihat total transaksi dari employee dan client, lalu dicek yang lebih
-- rendah dari 70000
WITH total_transactions AS (
	SELECT emp.first_name, emp.last_name, cli.client_name, SUM(emp.salary) AS emp_total_salary
	FROM employee emp
	JOIN works_with works ON emp.emp_id = works.emp_id
	JOIN client cli ON works.client_id = cli.client_id
	GROUP BY emp.first_name, emp.last_name, cli.client_name
)

SELECT first_name, last_name, client_name, emp_total_salary
FROM total_transactions
WHERE emp_total_salary < 70000
ORDER BY emp_total_salary DESC;