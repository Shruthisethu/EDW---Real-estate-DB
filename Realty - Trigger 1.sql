DELIMITER $$
CREATE TRIGGER update_property_status_after_transaction
AFTER INSERT ON Transaction
FOR EACH ROW
BEGIN
    UPDATE Property
    SET status = 'sold'
    WHERE Property.property_id = NEW.property_id;
END$$
DELIMITER ;

INSERT INTO Transaction (property_id, agent_id, client_id, date, amount)
VALUES (15, 1, 1, '2024-09-24', 320000);

SELECT * FROM Property WHERE property_id = 15;


