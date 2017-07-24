-- Steven Han - steven.han@nbcuni.com
-- Week 1 Assignment: SQL Select and Aggregations

-- Question 1. Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.

SELECT
origin AS 'Origin',
dest AS 'Destination',
AVG(distance) as 'Average Distance'
FROM flights
GROUP BY origin, dest
ORDER BY AVG(distance) DESC
LIMIT 1

-- Question 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result.

-- Display the number of engine types
SELECT
DISTINCT
engines AS 'Engine Types'
FROM planes
ORDER BY engines

-- Display ranking of seats for Engine Type 1
SELECT
DISTINCT
engines AS 'Engine Type',
model AS 'Airplane Model',
seats AS 'Max Number of Seats'
FROM planes
WHERE engines = '1'
ORDER BY seats DESC

-- Display ranking of seats for Engine Type 2
SELECT
DISTINCT
engines AS 'Engine Type',
model AS 'Airplane Model',
seats AS 'Max Number of Seats'
FROM planes
WHERE engines = '2'
ORDER BY seats DESC

-- Display ranking of seats for Engine Type 3
SELECT
DISTINCT
engines AS 'Engine Type',
model AS 'Airplane Model',
seats AS 'Max Number of Seats'
FROM planes
WHERE engines = '3'
ORDER BY seats DESC

-- Display ranking of seats for Engine Type 4
SELECT
DISTINCT
engines AS 'Engine Type',
model AS 'Airplane Model',
seats AS 'Max Number of Seats'
FROM planes
WHERE engines = '4'
ORDER BY seats DESC


-- Question 3. Show the total number of flights.

SELECT
COUNT(*) AS 'Total Number of Flights'
FROM flights

-- Question 4. Show the total number of flights by airline (carrier).

SELECT
carrier AS 'Airline',
COUNT(*) AS 'Flights by Airline'
FROM flights
GROUP BY carrier
ORDER BY carrier

-- Question 5. Show all of the airlines, ordered by number of flights in descending order.

SELECT
carrier AS 'Airline',
COUNT(*) AS 'Top Airlines by Number of Flights'
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC

-- Question 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

SELECT
carrier AS 'Airline',
COUNT(*) AS 'Top 5 Airlines by Number of Flights'
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5

-- Question 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.

SELECT
carrier AS 'Airline',
COUNT(*) AS 'Top 5 Airlines with Flights 1,000 Miles or Greater'
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5

-- Question 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.

-- Which airline (carrier) flew the most distance in 2013?

SELECT
year AS 'Year',
carrier AS 'Airline',
SUM(distance) AS 'Total Distance'
FROM flights
GROUP BY year, carrier
ORDER BY SUM(distance) DESC
LIMIT 1