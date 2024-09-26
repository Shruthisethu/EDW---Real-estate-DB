-- Query 1: Retrieve Available Properties Managed by a Specific Agent

SELECT P.address, P.price, A.`First name` AS agent_name
FROM Property P
JOIN Transaction T ON P.property_id = T.property_id
JOIN Agent A ON T.agent_id = A.agent_id
WHERE P.status = 'available' AND A.agent_id = 1;

-- Query 2: Retrieve All Clients Interested in a Particular Property

SELECT C.`First name`, C.contact_info
FROM Client C
JOIN Transaction T ON C.client_id = T.client_id
JOIN Property P ON T.property_id = P.property_id
WHERE P.address = '101 Maple St';

-- Query 3: Generate Monthly Transaction Report for All Agents

SELECT A.`First name`, COUNT(T.transaction_id) AS total_transactions, SUM(T.amount) AS total_sales
FROM Agent A
JOIN Transaction T ON A.agent_id = T.agent_id
WHERE MONTH(T.date) = MONTH(CURDATE())
GROUP BY A.agent_id;

-- Query 4: Retrieve Properties with Active Leases Expiring in the Next 3 Months

SELECT P.address, L.end_date, C.`First name` AS tenant_name
FROM Lease L
JOIN Property P ON L.property_id = P.property_id
JOIN Client C ON L.client_id = C.client_id
WHERE L.end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 3 MONTH);

-- Query 5: Calculate the Average Rent Amount by Property Type and Status

SELECT 
    type, 
    status, 
    AVG(L.rent_amount) AS average_rent
FROM 
    Property P
JOIN 
    Lease L ON P.property_id = L.property_id
GROUP BY 
    type, status;

-- Query 6: Calculate the Total Number of Transactions and Total Sales by Agent with a Bonus Calculation

SELECT 
    A.`First name` AS agent_name, 
    COUNT(T.transaction_id) AS total_transactions, 
    SUM(T.amount) AS total_sales, 
    SUM(T.amount) * 0.05 AS bonus
FROM 
    Agent A
JOIN 
    Transaction T ON A.agent_id = T.agent_id
GROUP BY 
    A.`First name`;