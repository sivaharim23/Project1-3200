# Project1-3200
# HouseTab — Roommate Expense Tracker

HouseTab is a relational database system designed to manage shared household 
expenses among roommates. It tracks who paid what, splits costs among household 
members, records settlements, and categorizes spending over the lifecycle of a 
shared lease.

## Team Members
- Sivahari Mohanraj
- Hasith Kadiyala

## Project Tasks

### Task 1 — Requirements Document (10 pts)
Describes the rules of the database in problem domain language, identifying 
nouns and actions. See `requirements.pdf`.

### Task 2 — UML Conceptual Model (15 pts)
UML Class Diagram with 6 classes, multiplicity constraints, and labeled 
relationships. See `uml.png`.

### Task 3 — ERD Logical Model (10 pts)
Entity Relationship Diagram in crow's foot notation with no many-to-many 
relationships. See `erd.png`.
LucidChart URL: https://lucid.app/lucidchart/536c2dd4-6749-4e85-9281-50948c17c38d/edit?invitationId=inv_b18754aa-c728-4bc3-8d5a-d475608205c5&page=0_0#


### Task 4 — Relational Schema & BCNF (15 pts)
12 relations defined with functional dependencies and BCNF proof. 
See `relational_schema.md`.

### Task 5 — SQL Table Definitions (10 pts)
CREATE TABLE statements for all 12 tables executed in SQLite3 via DB Browser. 
See `schema.sql`.

### Task 6 — Test Data (10 pts)
INSERT statements populating all 12 tables with realistic roommate data. 
See `data.sql`.

### Task 7 — Queries (10 pts)
Five queries demonstrating database functionality:
- `query1.sql` — 3-table join: All expenses with user who paid and category
- `query2.sql` — Subquery: Users who owe more than the average split amount
- `query3.sql` — GROUP BY with HAVING: Households where total expenses exceed $500
- `query4.sql` — Complex search: Unpaid splits over $50 in Rent or Utilities
- `query5.sql` — Summary: Total spending per category per household

## How to Run
1. Install SQLite3 or DB Browser for SQLite
2. Create a new database called `housetab.db`
3. Run `schema.sql` to create all tables
4. Run `data.sql` to populate with test data
5. Run any query file to see results
