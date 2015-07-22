/****** Object:  Database CMS    Script Date: 17/06/2015 15:21:26 ******/
CREATE DATABASE EasyCmsDB;

USE EasyCmsDB;

CREATE TABLE orderstatus(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	label VARCHAR(50) NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table relUserArticle    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE userarticles(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	article_id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table tblArticle    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE articles(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	category_id INT UNSIGNED NOT NULL,
	price FLOAT(15,4) UNSIGNED NOT NULL,
	label VARCHAR(100) NOT NULL,
	description TEXT NOT NULL,
	is_ordered TINYINT UNSIGNED NOT NULL,
	is_sale TINYINT UNSIGNED NOT NULL,
	status_id INT UNSIGNED NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table tblCategory    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE categories(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	label VARCHAR(100) NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table tblComment    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE comments(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	content TEXT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table tblLineOrder    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE lineorders(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	order_id INT UNSIGNED NOT NULL,
	article_id INT UNSIGNED NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table tblOrder    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE orders(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	status_id INT UNSIGNED NOT NULL,
	order_date DATETIME NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table tblStorage    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE storages(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	article_id INT UNSIGNED NOT NULL,
	storage_count INT UNSIGNED NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table tblTag    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE tags(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	label VARCHAR(50) NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table tblUser    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE users(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	password VARCHAR(50) NOT NULL,
	name VARCHAR(50) NULL,
	surname VARCHAR(50) NULL,
	adress VARCHAR(50) NULL,
	postal_code INT UNSIGNED NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

ALTER TABLE userarticles  ADD  CONSTRAINT FOREIGN KEY (article_id)
REFERENCES articles (id);

ALTER TABLE userarticles  ADD  CONSTRAINT FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE articles ADD  CONSTRAINT FOREIGN KEY (status_id)
REFERENCES orderstatus (id);
ALTER TABLE articles ADD  CONSTRAINT FOREIGN KEY (category_id)
REFERENCES categories (id);

ALTER TABLE lineorders  ADD  CONSTRAINT FOREIGN KEY (order_id)
REFERENCES orders (id);

ALTER TABLE orders  ADD  CONSTRAINT FOREIGN KEY (status_id)
REFERENCES orderstatus (id);

ALTER TABLE orders  ADD  CONSTRAINT FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE storages  ADD  CONSTRAINT FOREIGN KEY (article_id)
REFERENCES articles (id);
