-- Query 5: Show total spending per category per household
-- This query gives a breakdown of how much each household
-- has spent in each category, useful for budgeting analysis

SELECT 
    h.name AS household,
    c.name AS category,
    COUNT(e.expenseID) AS numberOfExpenses,
    SUM(e.totalAmount) AS totalSpent,
    AVG(e.totalAmount) AS avgExpense
FROM Household h
JOIN Expense e ON h.householdID = e.householdID
JOIN Category c ON e.categoryID = c.categoryID
GROUP BY h.householdID, h.name, c.categoryID, c.name
ORDER BY h.name, totalSpent DESC;


-- EXAMPLE OUTPUT:
-- household          category       numberOfExpenses  totalSpent  avgExpense
-- Maple House        Rent           1                 2100.0      2100.0
-- Maple House        Groceries      1                 240.0       240.0
-- Maple House        Utilities      1                 90.0        90.0
-- Maple House        Entertainment  1                 18.0        18.0
-- Sunset Apartment   Rent           1                 2400.0      2400.0
-- Sunset Apartment   Utilities      2                 195.0       97.5
-- Sunset Apartment   Groceries      1                 180.0       180.0
-- Sunset Apartment   Internet       1                 60.0        60.0
-- Sunset Apartment   Cleaning       1                 45.0        45.0
