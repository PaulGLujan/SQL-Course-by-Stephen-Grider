SELECT
  user_id
FROM
  comments
GROUP BY
  user_id;

SELECT
  COUNT(*)
FROM
  comments;

SELECT
  user_id,
  COUNT(id)
FROM
  comments
GROUP BY
  user_id;

SELECT
  url,
  COUNT(*)
FROM
  photos
  RIGHT JOIN COMMENTS ON photos.id = comments.photo_id
GROUP BY
  photos.id;

SELECT
  photo_id,
  COUNT(*)
FROM
  comments
GROUP BY
  photo_id
HAVING
  COUNT(*) > 2
  AND photo_id < 3;

SELECT
  user_id,
  COUNT(*)
FROM
  comments
WHERE
  photo_id < 50
GROUP BY
  user_id
HAVING
  COUNT(*) > 20;