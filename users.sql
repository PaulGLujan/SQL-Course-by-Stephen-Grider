CREATE TABLE
  users (id SERIAL PRIMARY KEY, username varchar(50));

INSERT INTO
  users (username)
VALUES
  ('pterodactylPaul'),
  ('eclipsemilk'),
  ('postyogurt'),
  ('yellowfish');

SELECT
  *
FROM
  users;