Relational Schema Definitions: 


User(userID: INTEGER PK, name: TEXT, email: TEXT, passwordHash: TEXT, createdAt: DATE) FDs: userID -> name, email, passwordHash, createdAt BCNF: userID is the superkey. All attributes depend only on userID. 

Household(householdID: INTEGER PK, name: TEXT, address: TEXT, createdAt: DATE) FDs: householdID -> name, address, createdAt BCNF: householdID is the superkey. All attributes depend only on householdID. 

HouseholdMembership(membershipID: INTEGER PK, userID: INTEGER FK, householdID: INTEGER FK, role: TEXT, joinDate: DATE, leaveDate: DATE) FDs: membershipID -> userID, householdID, role, joinDate, leaveDate BCNF: membershipID is the superkey. All attributes depend only on membershipID. 

Lease(leaseID: INTEGER PK, householdID: INTEGER FK, startDate: DATE, endDate: DATE, monthlyRent: REAL, depositAmount: REAL) FDs: leaseID -> householdID, startDate, endDate, monthlyRent, depositAmount BCNF: leaseID is the superkey. All attributes depend only on leaseID. 

Category(categoryID: INTEGER PK, name: TEXT, description: TEXT) FDs: categoryID -> name, description BCNF: categoryID is the superkey. All attributes depend only on categoryID. 

Expense(expenseID: INTEGER PK, householdID: INTEGER FK, categoryID: INTEGER FK, paidByUserID: INTEGER FK, title: TEXT, totalAmount: REAL, datePaid: DATE, notes: TEXT) FDs: expenseID -> householdID, categoryID, paidByUserID, title, totalAmount, datePaid, notes BCNF: expenseID is the superkey. All attributes depend only on expenseID. 

ExpenseSplit(splitID: INTEGER PK, expenseID: INTEGER FK, userID: INTEGER FK, splitAmount: REAL, isPaid: BOOLEAN) FDs: splitID → expenseID, userID, splitAmount, isPaid BCNF: splitID is the superkey. All attributes depend only on splitID. 

Settlement(settlementID: INTEGER PK, payerUserID: INTEGER FK, payeeUserID: INTEGER FK, householdID: INTEGER FK, amount: REAL, date: DATE, notes: TEXT) FDs: settlementID → payerUserID, payeeUserID, householdID, amount, date, notes BCNF: settlementID is the superkey. All attributes depend only on settlementID. 

RecurringExpense(recurringID: INTEGER PK, householdID: INTEGER FK, categoryID: INTEGER FK, title: TEXT, amount: REAL, frequency: TEXT) FDs: recurringID → householdID, categoryID, title, amount, frequency BCNF: recurringID is the superkey. All attributes depend only on recurringID.

Notification(notificationID: INTEGER PK, userID: INTEGER FK, message: TEXT, isRead: BOOLEAN, createdAt: DATE) FDs: notificationID → userID, message, isRead, createdAt BCNF: notificationID is the superkey. All attributes depend only on notificationID. 

Tag(tagID: INTEGER PK, name: TEXT) FDs: tagID → name BCNF: tagID is the superkey. All attributes depend only on tagID. 

ExpenseTag(expenseID: INTEGER PK FK, tagID: INTEGER PK FK) FDs: (expenseID, tagID) → (no other attributes) BCNF: The composite key (expenseID, tagID) is the superkey. No non-key attributes exist to violate BCNF. 
