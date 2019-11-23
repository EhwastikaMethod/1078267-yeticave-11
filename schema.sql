DROP DATABASE if exists yeticave;
CREATE DATABASE yeticave CHARACTER SET utf8 COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE categories (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(30),
    code VARCHAR(16)
);

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(254) NOT NULL UNIQUE,
    user_password VARCHAR(15) NOT NULL,
    user_contacts VARCHAR(60) NOT NULL
);

CREATE TABLE lots (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(70) NOT NULL,
    description TEXT NOT NULL,
    image VARCHAR(265) NOT NULL,
    initial_price INT UNSIGNED NOT NULL,
    final_date DATE NOT NULL,
    bet_step INT UNSIGNED,
    winner_user_id INT UNSIGNED,
    creator_user_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (winner_user_id) REFERENCES users (id),
    FOREIGN KEY (creator_user_id) REFERENCES users (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE bets (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    date_of_birth TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acceptable_price INT UNSIGNED,
    user_id INT UNSIGNED,
    lot_id INT UNSIGNED,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (lot_id) REFERENCES lots (id)
);

