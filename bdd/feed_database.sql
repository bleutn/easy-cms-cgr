USE EasyCmsDB;

INSERT INTO categories (label, created) VALUES ('Cat�gorie produit 1', NOW());
INSERT INTO categories (label, created) VALUES ('Cat�gorie produit 2', NOW());
INSERT INTO categories (label, created) VALUES ('Cat�gorie produit 3', NOW());

INSERT INTO orderstatus (label, created) VALUES ('En attente', NOW());
INSERT INTO orderstatus (label, created) VALUES ('Command�', NOW());
INSERT INTO orderstatus (label, created) VALUES ('Non Command�', NOW());


INSERT INTO articles (category_id, price, label, description, is_ordered, is_sale, status_id, created)
VALUES (1, 12.53, 'Produit 1', 'Description produit 1', 0, 1, 1, NOW());
