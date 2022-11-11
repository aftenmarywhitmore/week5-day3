-- 1. List all customers who live in Texas (useJOINs)
-- Question 1 Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
SELECT first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
-- Question 2 Answer: 1406 payments above $6.99
SELECT first_name, last_name, amount
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175 (use subqueries)
-- Question 3 Answer: 6 customers have made payments over $175 SELECT customer_id, first_name, last_name
SELECT customer_id
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	group by customer_id
	having count(customer_id) > 175.00
	order by customer_id
);


-- 4. List all customers that live in Nepal (use the city table)
-- Question 4 Answer: 1 customer lives in Nepal
SELECT first_name, last_name, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


-- 5. Which staff member (first/last name) had the most transactions?
-- Question 5 Answer: Jon Stephens with 7304 transactions
--I'm not totally sure how to JUST get Jon Stephens and my total number of transactions is 16008
SELECT first_name, last_name, SUM(rental.staff_id)
FROM staff
JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id
ORDER BY SUM(rental.staff_id);


-- How many movies of each rating are there?
-- Question 6 Answer: G: 178, PG: 194, PG-13: 223, R: 195, NC-17:210
--I'm going to have to come back to correct this because I can't get it ARG


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
-- Question 7 Answer: 130 customers made a single payment over $6.99
--In the words of DJ Khaled...ANOTHA ONE. Dang it. 
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);


-- 8. How many free rentals did our stores give away?
-- Question 8 Answer: 24 Free Rentals









