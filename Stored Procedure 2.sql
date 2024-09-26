DELIMITER $$
CREATE PROCEDURE GetAgentTransactionSummaryWithBonus(IN bonus_percentage DECIMAL(5, 2))
BEGIN
    SELECT 
        A.`First name` AS agent_name, 
        COUNT(T.transaction_id) AS total_transactions, 
        SUM(T.amount) AS total_sales, 
        SUM(T.amount) * (bonus_percentage / 100) AS bonus
    FROM 
        Agent A
    JOIN 
        Transaction T ON A.agent_id = T.agent_id
    GROUP BY 
        A.`First name`;
END$$
DELIMITER ;

CALL GetAgentTransactionSummaryWithBonus(7.00);