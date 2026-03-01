
INSERT INTO User (name, email, passwordHash, createdAt) VALUES
('Alex Johnson', 'alex@email.com', 'hash1234', '2024-01-01'),
('Maria Garcia', 'maria@email.com', 'hash5678', '2024-01-01'),
('James Lee', 'james@email.com', 'hash9012', '2024-01-15'),
('Sofia Patel', 'sofia@email.com', 'hash3456', '2024-01-15'),
('Chris Wong', 'chris@email.com', 'hash7890', '2024-02-01'),
('Priya Nair', 'priya@email.com', 'hash2345', '2024-02-01');


INSERT INTO Household (name, address, createdAt) VALUES
('Sunset Apartment', '123 Sunset Blvd, Albany, NY', '2024-01-01'),
('Maple House', '456 Maple Street, Albany, NY', '2024-02-01');


INSERT INTO HouseholdMembership (userID, householdID, role, joinDate, leaveDate) VALUES
(1, 1, 'admin', '2024-01-01', NULL),
(2, 1, 'member', '2024-01-01', NULL),
(3, 1, 'member', '2024-01-15', NULL),
(4, 2, 'admin', '2024-02-01', NULL),
(5, 2, 'member', '2024-02-01', NULL),
(6, 2, 'member', '2024-02-01', NULL);


INSERT INTO Lease (householdID, startDate, endDate, monthlyRent, depositAmount) VALUES
(1, '2024-01-01', '2024-12-31', 2400.00, 2400.00),
(2, '2024-02-01', '2025-01-31', 2100.00, 2100.00);


INSERT INTO Category (name, description) VALUES
('Rent', 'Monthly rent payments'),
('Utilities', 'Electricity, water, gas bills'),
('Groceries', 'Food and household supplies'),
('Internet', 'Monthly internet bill'),
('Cleaning', 'Cleaning supplies and services'),
('Entertainment', 'Streaming services and activities');


INSERT INTO Expense (householdID, categoryID, paidByUserID, title, totalAmount, datePaid, notes) VALUES
(1, 1, 1, 'January Rent', 2400.00, '2024-01-01', 'Split 3 ways'),
(1, 2, 2, 'Electric Bill', 120.00, '2024-01-15', 'Higher due to heating'),
(1, 3, 3, 'Grocery Run', 180.00, '2024-01-20', 'Weekly groceries'),
(1, 4, 1, 'Internet Bill', 60.00, '2024-01-05', 'Monthly internet'),
(2, 1, 4, 'February Rent', 2100.00, '2024-02-01', 'Split 3 ways'),
(2, 2, 5, 'Water Bill', 90.00, '2024-02-10', 'Monthly water'),
(2, 3, 6, 'Costco Run', 240.00, '2024-02-15', 'Bulk grocery shopping'),
(1, 5, 2, 'Cleaning Supplies', 45.00, '2024-02-01', 'Mop, bleach, sponges'),
(2, 6, 4, 'Netflix', 18.00, '2024-02-01', 'Shared Netflix plan'),
(1, 2, 1, 'Gas Bill', 75.00, '2024-02-05', 'February gas');


INSERT INTO ExpenseSplit (expenseID, userID, splitAmount, isPaid) VALUES
-- January Rent split 3 ways (800 each)
(1, 1, 800.00, 1),
(1, 2, 800.00, 1),
(1, 3, 800.00, 0),
-- Electric Bill split 3 ways (40 each)
(2, 1, 40.00, 1),
(2, 2, 40.00, 1),
(2, 3, 40.00, 0),
-- Grocery Run split 3 ways (60 each)
(3, 1, 60.00, 1),
(3, 2, 60.00, 0),
(3, 3, 60.00, 0),
-- Internet Bill split 3 ways (20 each)
(4, 1, 20.00, 1),
(4, 2, 20.00, 0),
(4, 3, 20.00, 0),
-- February Rent split 3 ways (700 each)
(5, 4, 700.00, 1),
(5, 5, 700.00, 1),
(5, 6, 700.00, 0),
-- Water Bill split 3 ways (30 each)
(6, 4, 30.00, 1),
(6, 5, 30.00, 1),
(6, 6, 30.00, 0),
-- Costco Run split 3 ways (80 each)
(7, 4, 80.00, 1),
(7, 5, 80.00, 0),
(7, 6, 80.00, 0),
-- Cleaning Supplies split 3 ways (15 each)
(8, 1, 15.00, 1),
(8, 2, 15.00, 0),
(8, 3, 15.00, 0),
-- Netflix split 3 ways (6 each)
(9, 4, 6.00, 1),
(9, 5, 6.00, 0),
(9, 6, 6.00, 0),
-- Gas Bill split 3 ways (25 each)
(10, 1, 25.00, 1),
(10, 2, 25.00, 0),
(10, 3, 25.00, 0);


INSERT INTO Settlement (payerUserID, payeeUserID, householdID, amount, date, notes) VALUES
(3, 1, 1, 800.00, '2024-01-20', 'James paying Alex back for rent'),
(2, 1, 1, 40.00, '2024-01-25', 'Maria paying Alex back for electric'),
(6, 4, 2, 700.00, '2024-02-15', 'Priya paying Sofia back for rent'),
(5, 4, 2, 30.00, '2024-02-20', 'Chris paying Sofia back for water');


INSERT INTO RecurringExpense (householdID, categoryID, title, amount, frequency) VALUES
(1, 1, 'Monthly Rent', 2400.00, 'monthly'),
(1, 4, 'Internet', 60.00, 'monthly'),
(2, 1, 'Monthly Rent', 2100.00, 'monthly'),
(2, 6, 'Netflix', 18.00, 'monthly');


INSERT INTO Notification (userID, message, isRead, createdAt) VALUES
(3, 'You owe $800.00 for January Rent', 0, '2024-01-01'),
(2, 'You owe $60.00 for Grocery Run', 1, '2024-01-20'),
(6, 'You owe $700.00 for February Rent', 0, '2024-02-01'),
(5, 'You owe $80.00 for Costco Run', 0, '2024-02-15'),
(3, 'You owe $40.00 for Electric Bill', 0, '2024-01-15'),
(2, 'You owe $15.00 for Cleaning Supplies', 0, '2024-02-01');


INSERT INTO Tag (name) VALUES
('urgent'),
('shared'),
('reimbursed'),
('monthly'),
('one-time');


INSERT INTO ExpenseTag (expenseID, tagID) VALUES
(1, 2),
(1, 4),
(2, 2),
(3, 2),
(4, 4),
(5, 2),
(5, 4),
(6, 2),
(7, 1),
(8, 5),
(9, 4),
(10, 2);
