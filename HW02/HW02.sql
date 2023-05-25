-- 1 Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.
USE lesson_2;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    count_product INT
);

INSERT sales(order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
SELECT * from sales;

/*
2 Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ, от 100 до 300 - Средний заказ, 
больше 300 - Большой заказ
*/
SELECT id AS id_заказа,
CASE 
	WHEN count_product > 300
		THEN "Большой заказ"
	WHEN count_product BETWEEN 100 and 300
		THEN "Средний заказ"
	WHEN count_product < 100
		THEN "Маленький заказ"
END AS "Тип заказа"
FROM sales;

/* 3. Создайте таблицу “orders”, заполните ее значениями. 
Покажите “полный” статус заказа, используя оператор CASE */
 DROP TABLE IF EXISTS orders;
 CREATE TABLE orders
 (
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10) NOT NULL,
    amount DECIMAL(6,2),
    order_status VARCHAR(45)
 );
 
INSERT orders(employee_id, amount, order_status)
VALUES
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
SELECT *,
CASE 
	WHEN order_status = 'OPEN'
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED'
		THEN 'Order is closed'
	WHEN order_status = 'CANCELLED'
		THEN 'Order is cancelled'
END AS 'full_order_status'
FROM orders;
