USE lesson_3;
/*1. Отсортируйте данные по полю заработная плата (salary) в порядке:
убывания; возрастания*/
# В порядке возрастания
SELECT * 
FROM staff
ORDER BY salary;

# В порядке убывания
SELECT * 
FROM staff
ORDER BY salary DESC;

-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT 
	CONCAT(firstname, " ", lastname) as fullname,
    post, 
    salary
FROM staff
ORDER BY salary DESC LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT 
	post,
	SUM(salary) as summ_salary
FROM staff
GROUP BY post;

/* 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте
от 24 до 49 лет включительно.*/
SELECT 
	post,
    COUNT(*) as workers_count
FROM staff
WHERE post = "Рабочий" AND (age BETWEEN 24 AND 49)
GROUP BY post;

-- 5. Найдите количество специальностей
SELECT 
	COUNT(DISTINCT post) as post_count
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

SELECT
	post,
    ROUND(AVG(age), 0) as average_age
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;

