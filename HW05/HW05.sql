USE hw05;
DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW view_cars AS
	SELECT * 
    FROM cars
    WHERE cost < 25000;
    
SELECT * FROM view_cars;
-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW view_cars AS
	SELECT * 
    FROM cars
    WHERE cost < 30000;

SELECT * FROM view_cars;
-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW skoda_and_audi AS
	SELECT * 
    FROM cars
    WHERE `Name` in ('Skoda', 'Audi');

SELECT * FROM skoda_and_audi;

/*
Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно.
Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/
SELECT train_id, station, station_time
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM Trains;