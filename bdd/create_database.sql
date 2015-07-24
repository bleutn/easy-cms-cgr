/****** Object:  Database CMS    Script Date: 17/06/2015 15:21:26 ******/
CREATE DATABASE easycmsdb;

USE easycmsdb;

CREATE TABLE orderstatus(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	label VARCHAR(50) NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table userarticles    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE userarticles(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	article_id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table articles    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE articles(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	category_id INT UNSIGNED NOT NULL,
	label VARCHAR(100) NOT NULL,
	description TEXT NOT NULL,
	is_ordered TINYINT(1) UNSIGNED NOT NULL,
	is_sale TINYINT(1) UNSIGNED NOT NULL,
	status_id INT UNSIGNED NOT NULL,
	published TINYINT(1) NOT NULL DEFAULT '0',
  rating_cache FLOAT(2,1) UNSIGNED NOT NULL DEFAULT '3.0',
  rating_count INT(11) UNSIGNED NOT NULL DEFAULT '0',
  name VARCHAR(255) NOT NULL,
  pricing FLOAT(9,2) UNSIGNED NOT NULL DEFAULT '0.00',
  short_description VARCHAR(255) NOT NULL,
  long_description TEXT NOT NULL,
  icon_link VARCHAR(255) NOT NULL,
  img_link VARCHAR(255) NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/****** Object:  Table reviews    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE reviews (
  id INT(11) NOT NULL AUTO_INCREMENT,
  product_id INT(11) NOT NULL,
  user_id INT(11) NOT NULL,
  rating INT(11) NOT NULL,
  comment TEXT NOT NULL,
  approved TINYINT(1) UNSIGNED NOT NULL DEFAULT '1',
  spam TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/****** Object:  Table categories    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE categories(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	label VARCHAR(100) NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table comments    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE comments(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	content TEXT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table lineorders    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE lineorders(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	order_id INT UNSIGNED NOT NULL,
	article_id INT UNSIGNED NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table orders    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE orders(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	status_id INT UNSIGNED NOT NULL,
	order_date DATETIME NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table storages    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE storages(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	article_id INT UNSIGNED NOT NULL,
	storage_count INT UNSIGNED NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table tags    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE tags(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	label VARCHAR(50) NOT NULL,
	created DATETIME DEFAULT NULL,
  modified DATETIME DEFAULT NULL
);

/****** Object:  Table users    Script Date: 17/06/2015 15:21:26 ******/
CREATE TABLE users(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_type INT(10) UNSIGNED NOT NULL DEFAULT '0',
  email VARCHAR(128) NOT NULL,
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
