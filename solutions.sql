-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects ORDER BY subject ASC;
-- 2. Find all subjects sorted by location
SELECT subject, location FROM subjects ORDER BY location ASC;
-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python';

-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject ASC;


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title FROM books INNER JOIN subjects ON subjects.id = books.subject_id WHERE subjects.id = 4;

-- 7. Find all books and display a result table with ONLY the following columns
SELECT books.title, authors.first_name, authors.last_name, subjects.subject
FROM books INNER JOIN authors ON books.author_id = authors.id
INNER JOIN subjects ON books.subject_id = subjects.id;
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject

-- 8. Find all books that are listed in the stock table
SELECT books.title, stock.retail FROM books INNER JOIN editions ON books.id = editions.book_id INNER JOIN stock ON stock.isbn = editions.isbn ORDER BY stock.retail DESC;
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
-- 9. Find the book "Dune" and display ONLY the following columns

-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title 
FROM customers
INNER JOIN shipments 
ON customers.id = shipments.customer_id 
INNER JOIN editions 
ON editions.isbn = shipments.isbn 
INNER JOIN books 
ON books.id = editions.book_id 
ORDER BY shipments.ship_date;

-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location), location FROM subjects GROUP BY location
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT b.title, COUNT(e.book_id) AS editions
FROM books b
JOIN editions e
ON b.id = e.book_id
GROUP BY b.title; ON editions.book_id = books.id 
GROUP BY books.id, books.title, editions.edition;