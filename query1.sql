-- Query 1: Show all expenses with the user who paid and the category name
-- This query joins Expense, Users, and Category to show a full expense report

SELECT 
    e.expenseID,
    e.title,
    e.totalAmount,
    e.datePaid,
    u.name AS paidBy,
    c.name AS category
FROM Expense e
JOIN User u ON e.paidByUserID = u.userID
JOIN Category c ON e.categoryID = c.categoryID
ORDER BY e.datePaid;

-- EXAMPLE OUTPUT:
-- expenseID  title              totalAmount  datePaid    paidBy       category
-- 1          January Rent       2400.0       2024-01-01  Alex Johnson  Rent
-- 4          Internet Bill      60.0         2024-01-05  Alex Johnson  Internet
-- 2          Electric Bill      120.0        2024-01-15  Maria Garcia  Utilities
-- 3          Grocery Run        180.0        2024-01-20  James Lee     Groceries
-- 5          February Rent      2100.0       2024-02-01  Sofia Patel   Rent
-- 8          Cleaning Supplies  45.0         2024-02-01  Maria Garcia  Cleaning
-- 9          Netflix            18.0         2024-02-01  Sofia Patel   Entertainment
-- 10         Gas Bill           75.0         2024-02-05  Alex Johnson  Utilities
-- 6          Water Bill         90.0         2024-02-10  Chris Wong    Utilities
-- 7          Costco Run         240.0        2024-02-15  Priya Nair    Groceries
