-- Week 4: Subquery

SELECT * FROM employee

-- SUBQUERY WHERE

-- 1. Coba lihat AVG Salary keseluruhan dulu
SELECT ROUND(AVG(salary), 2)
FROM employee
-- Average Salary: 92888.89

-- 2. Cari employee yang salarynya lebih besar dari average 
SELECT emp_id, first_name, last_name, salary
FROM employee
WHERE salary > 92888.89

-- 3. Cara nomor 2 kurang efektif karena kalau nambah baris employee baru, nilai AVG
-- akan berubah, sehingga bisa pakai SUBQUERY WHERE agar hasilnya lebih konsisten
SELECT emp_id, first_name, last_name, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee)



-- SUBQUERY FROM
-- Mencari salary terendah dari salary diatas AVG
-- Jadi, AVG salary kan 92888.89, nah SUBQUERY FROM bisa dipakai
-- untuk mencari rata-rata terendah diatas 92888.89
SELECT MIN(salary) AS minimal_salary
FROM (
	SELECT emp_id, first_name, last_name, salary
	FROM employee
	WHERE salary > (
		SELECT AVG(salary) FROM employee
	) AS transaction_above_avg
)