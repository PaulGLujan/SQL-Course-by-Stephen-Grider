/**************************************************/
/***           Subqueries                       ***/
/**************************************************/
-- Select the highest price in the toy department.
SELECT price 
FROM products 
WHERE department = 'Toys' 
ORDER BY price DESC LIMIT 1;

-- Select name and price of all products more expensive than most expensive toy.
SELECT name, price 
FROM products 
WHERE price > 
  ( 
    SELECT price 
    FROM products 
    WHERE department = 'Toys' 
    ORDER BY price 
    DESC LIMIT 1
  );

SELECT name FROM products WHERE id = 1;


/**************************************************/
/***           Subqueries in a SELECT           ***/
/**************************************************/

-- Example of a subquery that returns a single value.
-- Used in the SELECT fields section.
SELECT name, price, 
  ( 
    SELECT MAX(price) FROM products
  ) AS "Max Price"
FROM products;

-- Subqueries can be used for calculations..
SELECT name, price,
    price / (SELECT MAX(price) FROM phones)
    AS price_ratio
FROM PHONES;

/**************************************************/
/***           Subqueries in a FROM             ***/
/**************************************************/

-- Note: subquery must have an alias.
SELECT name, price_weight_ratio
FROM (
  	SELECT name, price / weight AS price_weight_ratio
		FROM products
	) AS p;

-- FROM-Select queries can just return a single value.
SELECT *
FROM (SELECT MAX(price) FROM products) as p;

-- Find the average number of order for all users
SELECT AVG(count)
FROM (
	  SELECT COUNT(*)
	  FROM orders
	  GROUP BY user_id
	) AS p;

-- Calculate the average price of phones for each manufacturer.
-- Print the highest average price.
SELECT MAX(avg_price) as max_average_price
FROM (
    SELECT AVG(price) as avg_price
    FROM phones
    GROUP BY manufacturer
  ) as a;

/**************************************************/
/***           Subqueries in a JOIN             ***/
/**************************************************/

-- The fields in the subquery must work with the ON clause.
SELECT first_name
FROM users
JOIN 
	(
    SELECT user_id FROM orders WHERE product_id = 3
  ) as p ON p.user_id = users.id; 

/**************************************************/
/***           Subqueries in a WHERE            ***/
/**************************************************/

-- Show the id of orders that involve a price/weight ratio greater than 5.
-- Note: this could have been accomplished with a JOIN..
SELECT id
FROM orders
WHERE product_id IN (
		SELECT id
		FROM products
		WHERE price / weight > 5
	);

-- Show the name of all products with a price greater than the average product
-- price.
SELECT name 
FROM products
WHERE price > (
		SELECT AVG(price) AS avg_product_price
		FROM products
	);

-- Write a query that prints out the name and price of phones that have a price 
-- greater than the Samsung S5620 Monte.
SELECT name, price
FROM phones
WHERE price > (
    SELECT price FROM phones WHERE name = 'S5620 Monte'
  );
  
-- Show the name of all products that are not in the same department as products
-- with a price less than 100
SELECT name FROM products
WHERE department NOT IN (
    -- List of departments with price < 100
    SELECT department FROM products WHERE price < 100 GROUP BY department
  );

-- Show the name, department, and price of products that are more expensive than
-- all products in the industrial department
SELECT name, department, price FROM products
WHERE price > ALL(
    -- All prices of industrial department
    SELECT price FROM products WHERE department = 'Industrial'
  );

-- Show the name of products that are more expensive than at least one product
-- in the 'Industrial' department
SELECT name FROM products WHERE
price > SOME(
    -- All prices of industrial department
    SELECT price FROM products WHERE department = 'Industrial'
  );

/**************************************************/
/***           Correlated Subqueries            ***/
/**************************************************/

-- Show the name, department, and price of the most expensive product in each
-- department
SELECT name, department, price FROM products AS p1
WHERE p1.price = (
    SELECT MAX(price) FROM products AS p2 WHERE p1.department = p2.department
  );

-- Without using a join or a group by, print the number of orders for each 
-- product
SELECT name, (
    SELECT COUNT(*) FROM orders AS o 
    WHERE p.id = o.product_id
  )
FROM products AS p;

-- Example of parent query without FROM
SELECT (
  SELECT MAX(price) FROM products
) / (
  SELECT AVG(price) FROM products
);