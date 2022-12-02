-- Select the highest price in the toy department.
SELECT price FROM products WHERE department = 'Toys' ORDER BY price DESC LIMIT 1;

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

SELECT name, price, 
  ( 
    SELECT name 
    FROM products 
    WHERE id = 1
  ) 
FROM products;