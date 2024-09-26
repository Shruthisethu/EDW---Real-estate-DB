DELIMITER $$

CREATE PROCEDURE GetLeasesExpiringInNext3Months()
BEGIN
    SELECT P.address, L.end_date, C.`First name` AS tenant_name
    FROM Lease L
    JOIN Property P ON L.property_id = P.property_id
    JOIN Client C ON L.client_id = C.client_id
    WHERE L.end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 3 MONTH);
END$$

DELIMITER ;

CALL GetLeasesExpiringInNext3Months();