CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);

-- Используя JOIN-ы, выполните следующие операции:
-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT c.name, s.shopname
FROM cats c
JOIN shops s
ON s.id = c.shops_id;

-- Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
SELECT c.name, s.shopname
FROM cats c
JOIN shops s
ON s.id = c.shops_id
WHERE "Murzik" IN (c.name);

SELECT c.name, s.shopname
FROM cats c
JOIN shops s
ON s.id = c.shops_id
WHERE "Murzik" = c.name;

-- Вывести магазины, в котором НЕ продаются коты “Мурзик” и “Zuza”
SELECT s.shopname
FROM shops s
WHERE s.shopname NOT IN (SELECT s.shopname
FROM cats c
LEFT JOIN shops s
ON s.id = c.shops_id
WHERE c.name IN ("Murzik", "Zuza"));


