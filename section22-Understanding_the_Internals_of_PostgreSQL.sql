-- Create an index on username
CREATE INDEX ON users(username);

-- Drop index
DROP INDEX users_username_idx;

-- With index: 0.075ms
-- Without index: 1.2ms
EXPLAIN ANALYZE SELECT * FROM users WHERE username = 'Emil30';

-- Get space requirements of users table
SELECT pg_size_pretty(pg_relation_size('users'));
-- 872 kb

-- Get the space requirements of username index
SELECT pg_size_pretty(pg_relation_size('users_username_idx'));
-- 184 kb

-- Get all primary key indexes
SELECT relname, relkind FROM pg_class WHERE relkind = 'i';