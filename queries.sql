--запрос на заполнение категорий данными.

INSERT INTO categories (name, code)
    VALUES ('Доски и лыжи', 'boards'),
           ('Крепления', 'attachment'),
           ('Ботинки', 'boots'),
           ('Одежда', 'clothing'),
           ('Инструменты', 'tools'),
           ('Разное', 'other');

--запрос на добавление данных о пользователях.

INSERT INTO users (email, password, contacts)
    VALUES ('abcde@mail.ru', 'abcde12345', '89991111111'),
           ('vwxyz@gmail.com', 'vwxyz98765', '88882222222');

--запрос на добаление данных по имеющимся лотам.

INSERT INTO lots (name, category_id, initial_price, image, final_date, creator_user_id)
    VALUES ('2014 Rossignol District Snowboard', '1', '10999', 'img/lot-1.jpg', '2019-12-31', '1'),
           ('DC Ply Mens 2016/2017 Snowboard', '1', '159999', 'img/lot-2.jpg', '2019-12-25','2'),
           ('Крепления Union Contact Pro 2015 года размер L/XL', '2', '8000', 'img/lot-3.jpg', '2019-12-26', '1'),
           ('Ботинки для сноуборда DC Mutiny Charocal', '3', '10999', 'img/lot-4.jpg', '2019-12-27', '1'),
           ('Куртка для сноуборда DC Mutiny Charocal', '4', '7500', 'img/lot-5.jpg', '2019-11-11', '2'),
           ('Маска Oakley Canopy', '6', '5400', 'img/lot-6.jpg', '2019-12-29', '2');

--запрос на добавление ставок.

INSERT INTO bets (acceptable_price, user_id, lot_id, date_of_birth)
    VALUES ('15000', '1', '1', NOW()),
           ('8000', '2', '6', NOW()),
           ('10000', '2', '6', NOW()),
           ('20000', '1', '3', NOW());

--запрос на получение всех категорий.

SELECT name from categories;

--запрос на получение лотов с указанием названия лота, его стартовой цены, ссылки на изображение, текущей цены, названия категории, к которой он принадлежит.

SELECT lots.id, lots.name, initial_price, image, MAX(bets.acceptable_price) as current_price, categories.name from lots
JOIN categories ON lots.category_id = categories.id
LEFT JOIN bets ON lots.id = bets.lot_id
WHERE final_date > NOW() 
GROUP BY lots.id
ORDER BY final_date DESC LIMIT 6;


--запрос на получение данных о лоте по его id и категории, к которой он принадлежит.

SELECT lots.id, categories.name from lots
JOIN categories
ON lots.category_id = categories.id;

--запрос на обновление названия лота по его идентификатору.

UPDATE lots
SET name = 'Доска DC Ply Mens 2016/2017 Snowboard'
WHERE id = 2;

SELECT name from lots
WHERE id = 2;


--запрос на получения перечня ставок для лота по его идентификатору с сортировкой по дате.

SELECT acceptable_price, date_of_birth from bets
WHERE lot_id = 6
ORDER BY date_of_birth ASC;