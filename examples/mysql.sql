-- Visualy Select a query and Run with the appropriate engine to see result
---------
-- MYSQL
DROP TABLE titi;

CREATE TABLE IF NOT EXISTS titi (id INT, name VARCHAR(10));

INSERT INTO titi (id, name) VALUES(12, "baba"), (1, "zik"), (12, "zok");

SELECT * FROM titi;

UPDATE titi
SET name = "DOUMBA"
WHERE id = 12;

DELETE FROM titi WHERE id = 12;
