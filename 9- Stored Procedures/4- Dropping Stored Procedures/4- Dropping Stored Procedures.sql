USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_clients;
DELIMITER $$;
CREATE PROCEDURE ge_clients()
BEGIN
    SELECT *
    FROM clients;
END$$;

DELIMITER ;