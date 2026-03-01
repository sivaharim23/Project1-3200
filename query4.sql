-- Query 4: Find all unpaid splits over $50 in Rent or Utilities category
-- This query uses multiple conditions with logical connectors
-- to find significant unpaid expenses in key categories

SELECT 
    u.name AS user,
    e.title AS expense,
    c.name AS category,
    es.splitAmount,
    e.datePaid
FROM ExpenseSplit es
JOIN User u ON es.userID = u.userID
JOIN Expense e ON es.expenseID = e.expenseID
JOIN Category c ON e.categoryID = c.categoryID
WHERE es.isPaid = 0
AND es.splitAmount > 50
AND (c.name = 'Rent' OR c.name = 'Utilities')
ORDER BY es.splitAmount DESC;

-- EXAMPLE OUTPUT:
-- user        expense        category  splitAmount  datePaid
-- James Lee   January Rent   Rent      800.0        2024-01-01
-- Priya Nair  February Rent  Rent      700.0        2024-02-01
