-- Visualy Select a query and Run with the appropriate engine to see result
----------------
-- POSTGRESQL
DROP SCHEMA tata CASCADE;

CREATE SCHEMA tata;

CREATE TABLE IF NOT EXISTS tata.titi (inside BOOLEAN, description TEXT);

-- FIXME: fix the quoting for later
INSERT INTO tata.titi (inside, description) VALUES (true, '\'this is a test\'');
INSERT INTO tata.titi (inside, description) VALUES (false, '\'bingo gindo\'');

SELECT * FROM tata.titi;

DELETE FROM tata.titi WHERE 1=1;
