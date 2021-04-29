/*
Задание: 1
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
*/
SELECT model, speed, hd
FROM PC
WHERE price < 500
/*
Задание: 2
Найдите производителей принтеров. Вывести: maker
*/
SELECT DISTINCT maker
FROM Product
WHERE type = 'printer'

/*
Задание: 3
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
*/
SELECT model, ram, screen
FROM Laptop
WHERE price > 1000

/*
Задание: 4
Найдите все записи таблицы Printer для цветных принтеров.
*/
SELECT *
FROM Printer
WHERE color='y'

/*
Задание: 5
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
*/
SELECT model, speed, hd
FROM PC
WHERE (cd = '12x' OR cd = '24x') AND price < 600

/*
Задание: 6
Укажите производителя и скорость для тех ПК-блокнотов, которые имеют жесткий диск объемом не менее 100 Гбайт.
*/
SELECT DISTINCT maker, Laptop.speed
FROM Product, Laptop
WHERE Laptop.hd >= 100 AND Product.model = Laptop.model

/*
Задание: 7
Найдите номера моделей и цены всех продуктов (любого типа), выпущенных производителем B (латинская буква).
*/
SELECT DISTINCT Product.model, PC.price 
FROM PC JOIN Product ON PC.model = Product.model 
WHERE maker = 'B'
UNION ALL
SELECT DISTINCT Product.model, Laptop.price 
FROM Laptop JOIN Product ON Laptop.model = Product.model 
WHERE maker = 'B'
UNION ALL
SELECT DISTINCT Product.model, Printer.price 
FROM Printer JOIN Product ON Printer.model = Product.model 
WHERE maker = 'B'

/*
Задание: 8
Найдите производителя, выпускающего ПК, но не ПК-блокноты.
*/
SELECT DISTINCT maker
FROM Product
WHERE type = 'PC' AND
maker NOT IN(SELECT maker FROM Product WHERE type = 'Laptop')

/*
Задание: 9
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
*/
SELECT DISTINCT Product.maker
FROM PC JOIN Product ON PC.model = Product.model 
WHERE PC.speed >= 450

/*
Задание: 10
Найдите принтеры, имеющие самую высокую цену. Вывести: model, price
*/
SELECT model, price
FROM Printer
WHERE price = (SELECT MAX(price) FROM PRINTER)

/*
Задание: 11
Найдите среднюю скорость ПК.
*/
SELECT AVG(speed) AS Avg_speed
FROM PC
/*
Задание: 12
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
*/
SELECT AVG(speed) AS Avg_speed
FROM Laptop
WHERE price > 1000

/*
Задание: 13
Найдите среднюю скорость ПК, выпущенных производителем A.
*/
SELECT AVG(speed) AS Avg_speed
FROM PC JOIN Product ON PC.model = Product.model
WHERE maker = 'A'

/*
Задание: 14
Для каждого значения скорости найдите среднюю стоимость ПК с такой же скоростью процессора. Вывести: скорость, средняя цена
*/
SELECT speed, AVG(price)
FROM PC
GROUP BY speed

/*
Задание: 15
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
*/
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(hd) > 1

/*
Задание: 16
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с номером, модель с меньшим номером, скорость и RAM.
*/
SELECT DISTINCT PC_1.model, PC_2.model, PC_2.speed, PC_2.ram 
FROM PC PC_1 JOIN PC PC_2
ON PC_1.ram = PC_2.ram
AND PC_1.speed = PC_2.speed
AND PC_1.model > PC_2.model

/*
Задание: 17
Найдите модели ПК-блокнотов, скорость которых меньше скорости любого из ПК. 
Вывести: type, model, speed
*/
SELECT DISTINCT Product.type, Laptop.model, Laptop.speed
FROM Laptop JOIN Product ON Product.model = Laptop.model
WHERE speed < ALL (SELECT speed FROM PC)

/*
Задание: 18
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
*/
/*
Задание: 19
Для каждого производителя найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.
*/
/*
Задание: 20
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей
*/
/*
Задание: 21
Найдите максимальную цену ПК, выпускаемых каждым производителем. Вывести: maker, максимальная цена.
*/
/*
Задание: 22
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
*/
/*
Задание: 23
Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker
*/
/*
Задание: 24
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
*/
/*
Задание: 25
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
*/





















