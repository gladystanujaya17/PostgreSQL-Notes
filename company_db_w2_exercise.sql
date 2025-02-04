-- Week 2: Basic Query
-- Latihan SELECT Statement

-- Semua data dipilih
SELECT * FROM employee;

-- Beberapa kolom dipilih
SELECT first_name, salary FROM employee;

-- Menampilkan bonus employee (bonus = salary * 2)
SELECT first_name, salary, salary * 2 AS bonus FROM employee;

-- Menampilkan 5 data teratas di tabel
SELECT * FROM employee LIMIT 5;

-- Mengetahui employee yang menjadi supervisor (data unik, hanya 1 aja yang ditam-
-- pilkan -> pakai DISTINCT)
SELECT DISTINCT super_id FROM employee WHERE super_id IS NOT NULL;

-- Mengurutkan karyawan berdasarkan gaji tertinggi -> gaji terendah
SELECT * FROM employee ORDER BY salary DESC;


-- Latihan WHERE Statement

-- WHERE untuk tanggal lahir employee
SELECT * FROM employee WHERE birth_day > '1970-01-01';

-- WHERE untuk menampilkan jenis kelamin Laki-laki
SELECT * FROM employee WHERE sex = 'M';

-- WHERE untuk menampilkan employee laki-laki DAN salary lebih dari 75.000
SELECT * FROM employee WHERE sex = 'M' AND salary > 75000;

-- WHERE untuk menampilkan employee laki-laki ATAU salary lebih dari 75.000
SELECT * FROM employee WHERE sex = 'M' OR salary > 75000;

-- WHERE dengan IN clause -> kegunaan sama seperti OR, tapi ini untuk cek
-- data lebih dari satu di kolom yang sama, seperti cek super_id lebih dari 1
SELECT * FROM employee WHERE super_id IN (102, 106);

-- WHERE dengan LIKE (filter nama pertama pegawai)
-- Filter nama depan employee berawalan huruf A
SELECT * FROM employee WHERE first_name LIKE 'A%';

-- Filter nama depan employee berawalan dan berakhiran huruf a
SELECT * FROM employee WHERE first_name LIKE '%a%';

-- Filter untuk cek string di kata kedua -> pakai underscore (_)

-- WHERE dengan BETWEEN dan AND (diantara)
SELECT * FROM employee WHERE salary BETWEEN 50000 AND 90000;