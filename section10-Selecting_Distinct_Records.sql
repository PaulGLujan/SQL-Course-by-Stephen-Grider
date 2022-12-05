SELECT DISTINCT department FROM products;

-- DISTINCT with COUNT
SELECT COUNT(DISTINCT(department)) FROM products;

-- Find unique combinations of department and name
SELECT DISTINCT department, name FROM products;