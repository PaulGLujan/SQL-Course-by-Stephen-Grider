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

/**************************************************/
/***           DEFAULT Column Exercise          ***/
/**************************************************/

ALTER TABLE products
ALTER COLUMN price
SET DEFAULT 999;

-- Query returned successfully in 64 msec.

INSERT INTO products (name, department, weight)
VALUES ('Shoes', 'Clothes', 5);

-- Query returned successfully in 55 msec.

/**************************************************/
/***           UNIQUE Constraint Exercise       ***/
/**************************************************/

ALTER TABLE products
ADD UNIQUE (name);

-- Query returned successfully in 273 msec.

INSERT INTO products (name, department, weight)
VALUES ('Shoes', 'Clothes', 5);

-- ERROR:  duplicate key value violates unique constraint "products_name_key"
-- DETAIL:  Key (name)=(Shoes) already exists.

/**************************************************/
/***      Multi Column Uniqueness Exercise      ***/
/**************************************************/

ALTER TABLE products
DROP CONSTRAINT products_name_key;

ALTER TABLE products
ADD UNIQUE (name, department);

INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Housewares', 24, 1);

-- Note a "Shirt" in the "Clothes" department already exists
INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Clothes', 24, 1);

-- ERROR:  duplicate key value violates unique constraint "products_name_department_key"
-- DETAIL:  Key (name, department)=(Shirt, Clothes) already exists.

/**************************************************/
/***      Validation Check Exercise             ***/
/**************************************************/

ALTER TABLE products
ADD CHECK (price > 0);

INSERT INTO products (name, department, price, weight)
VALUES ('Belt', 'House', -99, 1);

-- ERROR:  new row for relation "products" violates check constraint "products_price_check"
-- DETAIL:  Failing row contains (9, Belt, House, -99, 1).

/**************************************************/
/***   Checks Over Multiple Columns Exercise    ***/
/**************************************************/

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  est_delivery TIMESTAMP NOT NULL,
  CHECK (created_at < est_delivery)
);

INSERT INTO orders (name, created_at, est_delivery)
VALUES ('Shirt', '2000-NOV-20 01:00AM', '2000-NOV-25 01:00AM');

INSERT INTO orders (name, created_at, est_delivery)
VALUES ('Shirt', '2000-NOV-20 01:00AM', '2000-NOV-10 01:00AM');

-- ERROR:  new row for relation "orders" violates check constraint "orders_check"