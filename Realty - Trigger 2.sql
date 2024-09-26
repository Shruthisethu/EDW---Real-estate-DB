DELIMITER $$
CREATE TRIGGER update_rent_payment_status
AFTER INSERT ON Payment
FOR EACH ROW
BEGIN
    UPDATE Lease
    SET payment_status = 'paid'
    WHERE Lease.lease_id = NEW.lease_id;
END$$
DELIMITER ;

-- Insert a new payment for lease_id = 2
INSERT INTO Payment (lease_id, payment_date, amount)
VALUES (19, '2024-09-24', 1800);
-- Check if payment_status has been updated in the Lease table
SELECT lease_id, payment_status FROM Lease WHERE lease_id = 19;
