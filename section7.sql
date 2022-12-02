SELECT
  *
FROM
  products
ORDER BY
  name;

SELECT
  *
FROM
  products
ORDER BY
  price,
  weight;

SELECT
  COUNT(*)
FROM
  users;

SELECT
  *
FROM
  users
OFFSET
  40;

SELECT
  *
FROM
  users
LIMIT
  5;

SELECT
  *
FROM
  products
ORDER BY
  price
LIMIT
  5;

SELECT
  *
FROM
  products
ORDER BY
  price DESC
LIMIT
  5;

SELECT
  *
FROM
  products
ORDER BY
  price DESC
LIMIT
  5
OFFSET
  1;