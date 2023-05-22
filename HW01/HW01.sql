/*2. 	Выведите название, производителя и цену для товаров, 
количество которых превышает 2 */
SELECT Product_name, Manufacturer, Price
FROM mobile_phone
WHERE Product_count > 2;

-- 3.  	Выведите весь ассортимент товаров марки “Samsung”
SELECT Product_name, Price, Product_count
FROM mobile_phone
WHERE Manufacturer = "Samsung";

/* 4. 	Выведите информацию о телефонах, 
где суммарный чек больше 100 000 и меньше 145 000* */
SELECT Product_name, Manufacturer
FROM mobile_phone
WHERE Price * Product_count > "100000" 
AND 
Price * Product_count < "145000";

-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT Product_name, Manufacturer, Price, Product_count
FROM mobile_phone
WHERE Product_name LIKE "iPhone%";

-- 4.2. "Galaxy"
SELECT Product_name, Manufacturer, Price, Product_count
FROM mobile_phone
WHERE Product_name LIKE "Galaxy%";

-- 4.3. Товары, в которых есть ЦИФРЫ
SELECT Product_name, Manufacturer, Price, Product_count
FROM mobile_phone
WHERE Product_name RLIKE"[0-9]";

-- 4.4. Товары, в которых есть ЦИФРА "8"
SELECT Product_name, Manufacturer, Price, Product_count
FROM mobile_phone
WHERE Product_name RLIKE"[8]";


