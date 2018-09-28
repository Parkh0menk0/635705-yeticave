INSERT INTO category
  SET category_name = "boards",
      category_description = "Доски и лыжи";
INSERT INTO category
  SET category_name = "mounting",
      category_description = "Крепления";
INSERT INTO category
  SET category_name = "shoes",
      category_description = "Ботинки";
INSERT INTO category
  SET category_name = "clothes",
      category_description = "Одежда";
INSERT INTO category
  SET category_name = "tools",
      category_description = "Инструменты";
INSERT INTO category
  SET category_name = "other",
      category_description = "Разное";

INSERT INTO lot
  SET lot_name = "2014 Rossignol Disctrict Snowboard",
      category_id = 1,
      starting_price = 10999,
      picture = "lot-1.jpg";
INSERT INTO lot
  SET lot_name = "DC Ply Mens 2016/2017 Snowboard",
      category_id = 1,
      starting_price = 159999,
      picture = "lot-2.jpg";
INSERT INTO lot
  SET lot_name = "Крепления Union Contact Pro 2015 года размер L/XL",
      category_id = 2,
      starting_price = 8000,
      picture = "lot-3.jpg";
INSERT INTO lot
  SET lot_name = "Ботинки для сноуборда DC Mutiny Charcoal",
      category_id = 3,
      starting_price = 10999,
      picture = "lot-4.jpg";
INSERT INTO lot
  SET lot_name = "Куртка для сноуборда DC Mutiny Charcoal",
      category_id = 4,
      starting_price = 7500,
      picture = "lot-5.jpg";
INSERT INTO lot
  SET lot_name = "Маска Oakley Canopy",
      category_id = 5,
      starting_price = 5400,
      picture = "lot-6.jpg";

INSERT INTO bets
  SET user_name = "Иван",
      amount = 11500;
INSERT INTO bets
  SET user_name = "Константин",
      amount = 11000;
INSERT INTO bets
  SET user_name = "Евгений",
      amount = 10500;
INSERT INTO bets
  SET user_name = "Семён",
      amount = 110000;

INSERT INTO user
  SET email = "ignat.v@gmail.com",
      user_name = "Игнат",
      password = "$2y$10$OqvsKHQwr0Wk6FMZDoHo1uHoXd4UdxJG/5UDtUiie00XaxMHrW8ka";
INSERT INTO user
  SET email = "kitty_93@li.ru",
      user_name = "Леночка",
      password = "$2y$10$bWtSjUhwgggtxrnJ7rxmIe63ABubHQs0AS0hgnOo41IEdMHkYoSVa";
INSERT INTO user
  SET email = "warrior07@mail.ru",
      user_name = "Руслан",
      password = "$2y$10$2OxpEH7narYpkOT1H5cApezuzh10tZEEQ2axgFOaKW.55LxIJBgWW";


SELECT * FROM category;

SELECT lot_name, starting_price, picture,
    (select max(amount) from bets where lot_id = lot.id) as price,
    (select count(*) from bets where lot_id = lot.id) as bets_count,
    category.category_name
    FROM lot
    JOIN category on category_id = category.id
    WHERE date_of_completion DATETIME > NOW()
    ORDER BY date_of_creation DESC;
-- Получить лот по id и название категории, к которой он принадлежит
SELECT lot_name, category.category_name FROM lot JOIN category ON category_id = category.id WHERE lot.id = 1;
-- Обновление названия лота по его идентификатору
UPDATE lot SET lot_name = "Новое название" WHERE id = 1;
-- Список свежих ставок для лота по идентификатору
SELECT * FROM bets WHERE lot_id = 1 ORDER BY date_of_creation DESC;