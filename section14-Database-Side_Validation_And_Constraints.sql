/**************************************************/
/***           NOT NULL Exercise                ***/
/**************************************************/

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name varchar(50),
	department varchar(50),
	price integer,
	weight integer
);

INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Clothes', 20, 1);

INSERT INTO products (name, department, weight)
VALUES ('Pants', 'Clothes', 3);

ALTER TABLE products
ALTER COLUMN price
SET NOT NULL;

-- ERROR:  column "price" of relation "products" contains null values

-- Find all rows with a value of NULL and set them to 999
UPDATE products SET price = 999 WHERE price IS NULL;

ALTER TABLE products
ALTER COLUMN price
SET NOT NULL;

-- Query returned successfully in 197 msec.

INSERT INTO products (name, department, weight)
VALUES ('Shoes', 'Clothes', 5);

-- ERROR:  null value in column "price" of relation "products" violates not-null
-- constraint
