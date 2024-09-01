CREATE DATABASE IF NOT EXISTS play;
use play;

CREATE TABLE first (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    roll INT UNIQUE,
    age INT NOT NULL
);

SELECT * FROM first;
INSERT INTO first
(id, name, roll, age)
VALUES
(1, "Anurag", 230, 21),
(2, "Rishi", 231, 21),
(3, "Avra", 232, 20);

INSERT INTO first VALUES(4, "Anurag", 234, 22);
INSERT INTO first VALUES(5, "Shivam", 235, 22);
INSERT INTO first VALUES(6, "Kanishk", 236, 24);
INSERT INTO first VALUES(7, "Anil", 237, 22);
INSERT INTO first VALUES(8, "Sejal", 238, 22);


SELECT id, name FROM first;
SELECT * FROM first WHERE name="Anurag";

SELECT id, name FROM first
WHERE name = "Anurag";

SELECT * FROM first WHERE age < 21;

SELECT * FROM first ORDER BY age DESC;

SELECT * FROM first WHERE age > 20 AND name LIKE 'A%';

SELECT * FROM first 
WHERE age = 22 AND ((name LIKE 'A%' AND roll > 235) OR (name LIKE 'S%' AND roll > 234)); 

ALTER TABLE first
ADD country VARCHAR(50);

UPDATE first 
SET country = "India"
WHERE id > 1;

UPDATE first
SET country = "Spain"
WHERE id = 6;

#joins: 

#creating two tables to perform join

CREATE TABLE categories (
	category_id INT PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(50)
);

CREATE TABLE products (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    category_id INT,
    price INT NOT NULL,
    
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

#entering values into both tables
SELECT * FROM categories;
INSERT INTO categories
(category_id, name, description)
VALUES
(1, "Energy Drink", "Electrolytes energy drink"),
(2, "Soft Drink", "Caffeine based soft drink"),
(3, "Fruit Juice", "Organic fruit juice");

INSERT INTO categories VALUES (4, "Hard Drink", NULL);
INSERT INTO categories VALUES (11, "Kerosene", NULL);



SELECT * FROM products;
INSERT INTO products
(id, name, category_id, price)
VALUES
(1, "Red Bull", 1, 250),
(2, "Prime", 1, 230),
(3, "Thumbs Up", 2, 100),
(4, "Coke", 2, 100),
(5, "Pepsi", 2, 100),
(6, "Real", 3, 200);

INSERT INTO products VALUES (7, "Red Label", 4, 500);
INSERT INTO products VALUES (8, NULL, 4, 800);
INSERT INTO products VALUES (9, "Water", NULL, 10);


ALTER TABLE categories
RENAME COLUMN name TO category_name;
ALTER TABLE products
RENAME COLUMN name TO product_name;

INSERT INTO products (id, product_name, category_id, price)
VALUES (10, "Monster Energy", 2, 150);


#performing Joins

#inner join(common elements between two tables
SELECT id, product_name, category_name, price, description
FROM products
INNER JOIN categories ON products.category_id = categories.category_id; 

#left join
SELECT id, product_name, category_name, price, description
FROM products
LEFT JOIN categories ON products.category_id = categories.category_id;

#right join
SELECT id, product_name, category_name, price, description
FROM products
RIGHT JOIN categories ON products.category_id = categories.category_id