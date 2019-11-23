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
    email VARCHAR(50) NOT NULL UNIQUE,
    user_password VARCHAR(15) NOT NULL,
    user_contacts VARCHAR(50) NOT NULL
);

CREATE TABLE lots (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lot_name VARCHAR(70),
    lot_description TEXT,
    lot_image VARCHAR(265),
    initial_price INT UNSIGNED,
    final_date DATE,
    bet_step INT UNSIGNED,
    winner_user_id INT UNSIGNED,
    creator_user_id INT UNSIGNED,
    category_id INT UNSIGNED,
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

