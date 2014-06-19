-- In case there is already a bank_homework database, drop it
DROP DATABASE if exists bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework

-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  -- need DATETIME instead? Couldn't find in documentation
  created_at DATE,
  amount NUMERIC (30, 2),
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);


-- Alter the payments table, add the column of `zipcode` to specify where the transaction was made
ALTER TABLE payments ADD zipcode INTEGER;


-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.

INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES
('2004-06-03', 100.99, 'John Smith', 'Bank of America', 'Deposit', 02110),
('2011-11-11', 500.01, 'Caitlin Sherman', 'Citibank', 'Deposit', 02110),
('2012-09-09', 250.78, 'Dean Libet', 'TD Ameritrade', 'Deposit', 11234),
('2008-01-02', 1800.00, 'Ana Johnson', 'Cindy Lou', 'Utilities', 11455),
('1999-05-23', 3600.00, 'Duncan Martin', 'Bob Phillips', 'Rent', 56783),
('1987-06-23', 140.50, 'Grady Smith', 'Bank of America', 'Withdrawal', 09987),
('2007-10-16', 70.00, 'Christina Vix', 'Shoprite', 'Groceries', 45633),
('2004-05-31', 4500.00, 'Joanna Guard', 'Car Town', 'Used Car', 11145),
('2001-04-18', 20000.00, 'Kate Nicks', 'Joe Shmoe', 'Down Payment', 87788),
('2006-07-08', 567.89, 'Edith Jones', 'Vacation Central', 'Bungalow', 45678),
('2014-01-22', 2875.00, 'John Doe', 'GA', 'WDI Course', 02446),
('2014-02-22', 2875.00, 'John Doe', 'GA', 'WDI Course', 02446),
('2014-03-22', 2875.00, 'John Doe', 'GA', 'WDI Course', 02446),
('2014-04-22', 2875.00, 'John Doe', 'GA', 'WDI Course', 02446),
('2014-01-22', 875.00, 'Jane Doe', 'GA', 'UX Course', 11123),
('2014-02-22', 875.00, 'Jane Doe', 'GA', 'UX Course', 11123),
('2014-03-22', 875.00, 'Jane Doe', 'GA', 'UX Course', 11123),
('2002-12-22', 1.00, 'Mom', 'Son', 'Lost Tooth', 06877),
('2013-09-14', 51.00, 'Cody Sperry', 'Peter Sperry', 'Cell Phone', 90877),
('2000-03-14', 24.99, 'Veronica Lewis', 'H&M', 'New Shirt', 90210),
('2014-04-22', 2875, 'Jane Doe', 'GA', 'UX Course', 45677);



-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected

UPDATE payments SET amount = '20010.00' WHERE id = 9;


-- Delete all payments with an amount under $2

DELETE FROM payments WHERE amount < '2.00';


-- Select all entries from the payments table

SELECT * FROM payments;


-- In a single query, output all payments ordered from the largest to the smallest

SELECT * FROM payments ORDER BY price DESC;


-- In a single query, output the names of all distinct recipients

SELECT DISTINCT recipient_name FROM payments;


-- In a single query, select all payments created in the past week


-- In a single query, select all payments with a blank description
SELECT * FROM payments WHERE description is NULL;

-- In a single query, select all payments matching the name of one of the payers (choose any single one)

-- why does 'ILIKE' work? Documentation says 'LIKE'
SElECT * FROM payments WHERE payer_name ILIKE 'John Doe';
