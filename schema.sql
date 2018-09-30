CREATE DATABASE yeticave
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category_name CHAR(64),
  category_description CHAR(64)
);

CREATE TABLE lot (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lot_name CHAR(128),
  description TEXT,
  picture CHAR(128),
  starting_price INT,
  date_of_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  date_of_completion DATETIME,
  bets_step CHAR(128),
  user_id INT,
  winners_id INT,
  category_id INT
);

CREATE INDEX search_lot ON lot(lot_name);

CREATE TABLE bets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_name CHAR(128),
  amount INT,
  date_of_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  user_id INT,
  lot_id INT
);

CREATE TABLE user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date_of_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  email CHAR(64),
  user_name CHAR(128),
  password CHAR(64),
  avatar CHAR(128),
  contacts TEXT,
  lot_id INT,
  bets_id INT
);

CREATE UNIQUE INDEX user_email ON user(email);
CREATE UNIQUE INDEX name ON user(user_name);