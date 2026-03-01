-- Query 2: Find users who owe more than the average split amount
-- This query calculates the average split amount
-- and returns users whose total owed exceeds that average

SELECT 
    u.name,
    SUM(es.splitAmount) AS totalOwed
FROM User u
JOIN ExpenseSplit es ON u.userID = es.userID
WHERE es.isPaid = 0
GROUP BY u.userID, u.name
HAVING SUM(es.splitAmount) > (
    SELECT AVG(splitAmount) FROM ExpenseSplit WHERE isPaid = 0
);

-- EXAMPLE OUTPUT:
-- name        totalOwed
-- James Lee   960.0
-- Priya Nair  816.0
