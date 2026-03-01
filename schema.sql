-- 1. User
CREATE TABLE User (
    userID      INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT    NOT NULL,
    email       TEXT    NOT NULL UNIQUE,
    passwordHash TEXT   NOT NULL,
    createdAt   DATE    NOT NULL
);

-- 2. Household
CREATE TABLE Household (
    householdID INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT    NOT NULL,
    address     TEXT    NOT NULL,
    createdAt   DATE    NOT NULL
);

-- 3. HouseholdMembership
CREATE TABLE HouseholdMembership (
    membershipID  INTEGER PRIMARY KEY AUTOINCREMENT,
    userID        INTEGER NOT NULL,
    householdID   INTEGER NOT NULL,
    role          TEXT    NOT NULL,
    joinDate      DATE    NOT NULL,
    leaveDate     DATE,
    FOREIGN KEY (userID)      REFERENCES User(userID),
    FOREIGN KEY (householdID) REFERENCES Household(householdID)
);

-- 4. Lease
CREATE TABLE Lease (
    leaseID       INTEGER PRIMARY KEY AUTOINCREMENT,
    householdID   INTEGER NOT NULL,
    startDate     DATE    NOT NULL,
    endDate       DATE    NOT NULL,
    monthlyRent   REAL    NOT NULL,
    depositAmount REAL    NOT NULL,
    FOREIGN KEY (householdID) REFERENCES Household(householdID)
);

-- 5. Category
CREATE TABLE Category (
    categoryID  INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT    NOT NULL UNIQUE,
    description TEXT
);

-- 6. Expense
CREATE TABLE Expense (
    expenseID     INTEGER PRIMARY KEY AUTOINCREMENT,
    householdID   INTEGER NOT NULL,
    categoryID    INTEGER,
    paidByUserID  INTEGER NOT NULL,
    title         TEXT    NOT NULL,
    totalAmount   REAL    NOT NULL,
    datePaid      DATE    NOT NULL,
    notes         TEXT,
    FOREIGN KEY (householdID)  REFERENCES Household(householdID),
    FOREIGN KEY (categoryID)   REFERENCES Category(categoryID),
    FOREIGN KEY (paidByUserID) REFERENCES User(userID)
);

-- 7. ExpenseSplit
CREATE TABLE ExpenseSplit (
    splitID     INTEGER PRIMARY KEY AUTOINCREMENT,
    expenseID   INTEGER NOT NULL,
    userID      INTEGER NOT NULL,
    splitAmount REAL    NOT NULL,
    isPaid      INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (expenseID) REFERENCES Expense(expenseID),
    FOREIGN KEY (userID)    REFERENCES User(userID)
);

-- 8. Settlement
CREATE TABLE Settlement (
    settlementID  INTEGER PRIMARY KEY AUTOINCREMENT,
    payerUserID   INTEGER NOT NULL,
    payeeUserID   INTEGER NOT NULL,
    householdID   INTEGER NOT NULL,
    amount        REAL    NOT NULL,
    date          DATE    NOT NULL,
    notes         TEXT,
    FOREIGN KEY (payerUserID)  REFERENCES User(userID),
    FOREIGN KEY (payeeUserID)  REFERENCES User(userID),
    FOREIGN KEY (householdID)  REFERENCES Household(householdID)
);

-- 9. RecurringExpense
CREATE TABLE RecurringExpense (
    recurringID  INTEGER PRIMARY KEY AUTOINCREMENT,
    householdID  INTEGER NOT NULL,
    categoryID   INTEGER,
    title        TEXT    NOT NULL,
    amount       REAL    NOT NULL,
    frequency    TEXT    NOT NULL,
    FOREIGN KEY (householdID) REFERENCES Household(householdID),
    FOREIGN KEY (categoryID)  REFERENCES Category(categoryID)
);

-- 10. Notification
CREATE TABLE Notification (
    notificationID INTEGER PRIMARY KEY AUTOINCREMENT,
    userID         INTEGER NOT NULL,
    message        TEXT    NOT NULL,
    isRead         INTEGER NOT NULL DEFAULT 0,
    createdAt      DATE    NOT NULL,
    FOREIGN KEY (userID) REFERENCES User(userID)
);

-- 11. Tag
CREATE TABLE Tag (
    tagID INTEGER PRIMARY KEY AUTOINCREMENT,
    name  TEXT  NOT NULL UNIQUE
);

-- 12. ExpenseTag
CREATE TABLE ExpenseTag (
    expenseID INTEGER NOT NULL,
    tagID     INTEGER NOT NULL,
    PRIMARY KEY (expenseID, tagID),
    FOREIGN KEY (expenseID) REFERENCES Expense(expenseID),
    FOREIGN KEY (tagID)     REFERENCES Tag(tagID)
);