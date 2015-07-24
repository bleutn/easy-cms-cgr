USE easycmsdb;

INSERT INTO categories (label, created) VALUES ('Catégorie produit 1', NOW());
INSERT INTO categories (label, created) VALUES ('Catégorie produit 2', NOW());
INSERT INTO categories (label, created) VALUES ('Catégorie produit 3', NOW());

INSERT INTO orderstatus (label, created) VALUES ('En attente', NOW());
INSERT INTO orderstatus (label, created) VALUES ('Commandé', NOW());
INSERT INTO orderstatus (label, created) VALUES ('Non Commandé', NOW());


INSERT INTO articles (
	category_id,
	label,
	description,
	is_ordered,
	is_sale,
	status_id,
	published,
  rating_cache,
  rating_count,
  name,
  pricing,
  short_description,
  long_description,
  icon_link,
  img_link,
	created
	)
VALUES (1,
        'Produit 1',
        'Description produit 1',
        0,
        1,
        1,
        1,
        3.0,
        2,
        'Produit 1',
        11.99,
        'Short description',
        'Long description',
        '/images/icons/produit1_ico.png',
        '/images/produit1.png',
        NOW());
