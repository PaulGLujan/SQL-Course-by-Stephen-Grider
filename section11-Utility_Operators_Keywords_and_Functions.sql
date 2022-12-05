SELECT GREATEST(10, 20, 40);

-- Compute the cost to ship each item.
-- Shipping is the maximum of (weight * $2) or $30
SELECT name, GREATEST(weight * 2, 20) AS shipping_cost FROM products;

-- All products are on sale!
-- Price is the least of the products price * 0.5 or $400
SELECT name, LEAST(400, price * 0.5) AS discount_price from products;

-- Print each product and its price. Also print a description of the price.
-- If price > 600 then 'high'
-- If price > 300 then 'medium'
-- else print 'cheap'
SELECT
  name,
  price,
  CASE
    WHEN price > 600 THEN 'high'
    WHEN price > 300 THEN 'medium'
    ELSE 'cheap'
  END
  FROM products;