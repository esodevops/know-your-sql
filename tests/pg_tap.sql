-- Example pgTAP test suite for PostgreSQL
-- Install pgTAP in your test database before running these tests
BEGIN;

SELECT
    plan(2);

-- Example: Check if table exists
SELECT
    has_table('public', 'users'),
    'users table exists';

-- Example: Check if column exists
SELECT
    col_type_is('public', 'users', 'email', 'text'),
    'users.email is text';

SELECT
    *
FROM
    finish();

ROLLBACK;