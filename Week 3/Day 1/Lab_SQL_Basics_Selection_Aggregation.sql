-- Review the tables in the database.
show tables;
-- Explore tables by selecting all columns from each table or using the in built review features for your client.
show full tables;
-- Select one column from a table. Get film titles.
select * from film_text;
select title from film_text;
-- Select one column from a table and alias it. 
select title from sakila.Film as Movie;
select * from city;
select city from city as location;
-- Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select * from language;
select distinct name as language from sakila.language;
-- Find out how many stores does the company have?
select distinct store_id from sakila.store;
-- Find out how many employees staff does the company have?
select distinct manager_staff_id from sakila.store;
select distinct fk_store_staff from sakila.Foreign_Keys;

-- Get the id values of the first 5 clients from district_id with a value equals to 1.
select client_id from bank.client where district_id =1 limit 5;

-- In the client table, get an id value of the last client where the district_id equals to 72.
select client_id from bank.client where district_id=72 order by client_id desc limit 1;

-- Get the 3 lowest amounts in the loan table.
select amount from bank.loan order by amount limit 3;

-- What are the possible values for status, ordered alphabetically in ascending order in the loan table?
select distinct status status from bank.loan order by status;

-- What is the loan_id of the highest payment received in the loan table?
SELECT loan_id FROM bank.loan ORDER BY amount DESC LIMIT 1;
SELECT loan_id, amount FROM bank.loan WHERE amount = ( SELECT MAX(amount) FROM bank.loan );

-- What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT amount, account_id FROM bank.loan ORDER BY account_id LIMIT 5;

-- What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
select account_id from bank.loan where duration = 60 order by amount limit 5;

-- What are the unique values of k_symbol in the order table?
-- Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. You have to use backticks to escape the order table name.
select distinct k_symbol from bank.order;

-- In the order table, what are the order_ids of the client with the account_id 34?
select order_id from bank.order where account_id=34;

-- In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
select distinct account_id from bank.order where order_id between 29540 and 29560;

-- In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
select distinct amount from bank.order where account_to=(30067122);

-- In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
select trans_id, date, type, amount from bank.trans where account_id = 793 order by date desc limit 10;

-- In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
select distinct district_id, count(client_id) from bank.client where district_id <10 group by district_id;

-- In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
SELECT type, COUNT(card_id) AS magnitude FROM bank.card GROUP BY type ORDER BY magnitude DESC;

-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
select account_id, sum(amount) as Sum_amount from bank.loan group by account_id order by Sum_amount desc limit 10;

-- In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.


