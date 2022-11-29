CREATE TABLE
  users (id SERIAL PRIMARY KEY, username varchar(50));

CREATE TABLE
  photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users (id)
  );

INSERT INTO
  users (username)
VALUES
  ('pterodactylPaul'),
  ('eclipsemilk'),
  ('postyogurt'),
  ('yellowfish');

INSERT INTO
  photos (url, user_id)
VALUES
  ('http://one.jpg', 4);

INSERT INTO
  photos (url, user_id)
VALUES
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

SELECT
  url,
  username
FROM
  photos
  JOIN users ON users.id = photos.user_id;