-- Week 3: Aggregations, Group By, Window Function

-- AVG() -> rata-rata
SELECT AVG(salary) FROM employee;

-- -> ROUND() = pembulatan
SELECT ROUND(AVG(salary), 2) FROM employee;

-- COUNT() -> total 
-- Contoh: Total employee 
SELECT COUNT(emp_id) AS TotalEmployee FROM employee;

-- -> DISTINCT -> untuk hitung satu aja tanpa duplikat (nilai unik)
SELECT DISTINCT(COUNT(emp_id)) AS TotalEmployee FROM employee;

-- MIN() & MAX()
-- Bisa pakai 2 aggregate functions yang berbeda
SELECT 
	MIN(salary) AS gajiTerkecil,
	MAX(salary) AS gajiTerbesar 
FROM employee;

/*
Note:
Aggregate functions tidak akan menghitung baris NULL, 
kecuali COUNT(), baris NULL akan tetap dihitung.

Kalau semua kolom berisi NULL, aggregate functions akan mengembalikan NULL,
kecuali COUNT(), akan mengembalikan nilai '0'
*/



-- GROUP BY
SELECT * FROM employee;

-- Contoh 1: Jumlah salary pada employee berdasarkan jenis kelamin
-- Single Group By
SELECT sex, SUM(salary)
FROM employee
GROUP BY sex;

-- Contoh 2: Jumlah salary pada employee berdasarkan jenis kelamin dan branch_id
SELECT sex, branch_id, SUM(salary)
FROM employee
GROUP BY sex, branch_id;

-- Filtering GROUP BY pakai HAVING
SELECT sex, branch_id, SUM(salary)
FROM employee
GROUP BY sex, branch_id
HAVING SUM(salary) > 200000;

-- ORDER BY: juga disesuaikan dengan nama kolom yang dipakai bersama dengan agg function
SELECT sex, branch_id, SUM(salary) AS TotalSalary
FROM employee
GROUP BY sex, branch_id
HAVING SUM(salary) > 200000
ORDER BY sex, branch_id DESC;

/*
Note:
Setiap kolom yang yang dibarengi dengan fungsi aggregasi
harus masuk ke GROUP BY clause.
Contoh seperti sex, branch_id, ini harus ditulis di klausa GROUP BY.

Setiap kolom yang dibarengi dengan fungsi aggregasi 
harus masuk ke ORDER BY kalau mau diurutkan datanya. 

Kalau udah pakai GROUP BY, filtering harus pakai HAVING.
*/



-- WINDOW FUNCTION

-- Tanpa pakai Window Function
SELECT
	sex,
	salary,
	AVG(salary) AS avgSalary
FROM employee
GROUP BY sex, salary;

-- Window Function tanpa pakai ROUND()
SELECT
	sex,
	salary,
	AVG(salary) OVER() AS avgSalary
FROM employee;

-- Window Function pakai ROUND() -> tulis sampe OVER() juga
SELECT 
	sex,
	salary,
	ROUND(AVG(salary) OVER(), 2) AS avgSalary
FROM employee;

-- Groupingnya pakai PARTITION BY
-- Membandingkan salary dan average salary antar jenis kelamin (laki laki dan perempuan)
SELECT 
	sex,
	salary,
	ROUND(AVG(salary) OVER(PARTITION BY sex), 2) AS avgSalarySex 
FROM employee;

-- PARTITION BY lebih dari satu kolom
SELECT 
	sex,
	branch_id,
	salary,
	ROUND(AVG(salary) OVER(PARTITION BY sex, branch_id), 2) AS avgSalarySex 
FROM employee;

-- ORDER BY 
SELECT
	sex,
	salary,
	ROUND(AVG(salary) OVER(PARTITION BY sex ORDER BY salary DESC), 2) AS avgSalarySex
FROM employee;

-- FRAME CLAUSE

-- frame_start:
-- CURRENT ROW, UNBOUNDED PRECEDING, N PRECEDING

-- frame_end:
-- CURRENT ROW, UNBOUNDED FOLLOWING, N FOLLOWING

-- cari youtube deh susah jelasinnya

/*
Note:
Window function ini digunakan untuk menampilkan nilai salary awal dan fungsi agregatnya.
Jadi, bisa dibandingkan satu sama lain.

Misal, mau bandingin salary employee dengan average salary keseluruhan, bisa pakai window function.

Window function harus pakai OVER() ya, jangan lupa ya.

PARTITION BY -> mirip2 GROUP BY deh fungsinya
*/