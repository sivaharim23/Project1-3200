-- Query 3: Show households where total expenses exceed $500
-- This query groups expenses by household and filters
-- only those where the total spending is over $500

SELECT 
    h.name AS household,
    COUNT(e.expenseID) AS totalExpenses,
    SUM(e.totalAmount) AS totalSpent
FROM Household h
JOIN Expense e ON h.householdID = e.householdID
GROUP BY h.householdID, h.name
HAVING SUM(e.totalAmount) > 500
ORDER BY totalSpent DESC;

-- EXAMPLE OUTPUT:
-- household          totalExpenses  totalSpent
-- Sunset Apartment   6              2880.0
-- Maple House        4              2448.0
