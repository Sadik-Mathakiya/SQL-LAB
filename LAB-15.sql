--From the table PUBLISHER, AUTHOR and BOOK perform the following queries:  
--Part – A: 
--1. List all books with their authors.

	SELECT TITLE,AUTHORNAME FROM BOOK
	INNER JOIN AUTHOR
	ON BOOK.AUTHORID=AUTHOR.AUTHORID

--2. List all books with their publishers. 

	SELECT TITLE , PUBLISHERNAME FROM BOOK
	INNER JOIN PUBLISHER
	ON BOOK.PUBLISHERID=PUBLISHER.PUBLISHERID

--3. List all books with their authors and publishers. 

	SELECT TITLE , PUBLISHERNAME,AUTHORNAME FROM BOOK
	INNER JOIN AUTHOR
	ON BOOK.AUTHORID=AUTHOR.AUTHORID
	INNER JOIN PUBLISHER
	ON BOOK.PUBLISHERID=PUBLISHER.PUBLISHERID

--4. List all books published after 2010 with their authors and publisher and price.

	SELECT TITLE , PUBLISHERNAME,AUTHORNAME,PRICE FROM BOOK
	INNER JOIN AUTHOR
	ON BOOK.AUTHORID=AUTHOR.AUTHORID
	INNER JOIN PUBLISHER
	ON BOOK.PUBLISHERID=PUBLISHER.PUBLISHERID
	WHERE BOOK.PUBLICATIONYEAR>2010

--5. List all authors and the number of books they have written. 

	SELECT AUTHOR.AUTHORNAME , COUNT(BOOKID) FROM AUTHOR
	INNER JOIN BOOK
	ON BOOK.AUTHORID=AUTHOR.AUTHORID
	GROUP BY AUTHORNAME

--6. List all publishers and the total price of books they have published. 

    SELECT PUBLISHERNAME, SUM(PRICE) FROM BOOK
	INNER JOIN PUBLISHER
	ON BOOK.PUBLISHERID=PUBLISHER.PUBLISHERID
	GROUP BY PUBLISHERNAME

--7. List authors who have not written any books. 

	SELECT AUTHORNAME FROM BOOK
	INNER JOIN AUTHOR
	ON AUTHOR.AUTHORID=BOOK.AUTHORID
	GROUP BY AUTHORNAME
	HAVING COUNT(BOOKID) = 0

--8. Display the total number of books written by each author along with the average price of their books. 

	SELECT AUTHOR.AUTHORNAME , COUNT(BOOKID) AS TOTAL_BOOK,AVG(PRICE) AS AVG_PRICE FROM AUTHOR
	INNER JOIN BOOK
	ON BOOK.AUTHORID=AUTHOR.AUTHORID
	GROUP BY AUTHORNAME 

--9. lists each publisher along with the total number of books they have published, sorted from highest to 
--lowest. 

	SELECT PUBLISHERNAME, COUNT(BOOKID) FROM BOOK
	INNER JOIN PUBLISHER
	ON BOOK.PUBLISHERID=PUBLISHER.PUBLISHERID
	GROUP BY PUBLISHERNAME 
	ORDER BY COUNT(BOOKID) DESC

--10. Display number of books published each year.

	SELECT PUBLICATIONYEAR,COUNT(BOOKID) FROM BOOK
	INNER JOIN PUBLISHER
	ON BOOK.PUBLISHERID=PUBLISHER.PUBLISHERID
	GROUP BY PUBLICATIONYEAR

--Part – B:
--11. List the publishers whose total book prices exceed 500, ordered by the total price. 

	SELECT PUBLISHERNAME,SUM(PRICE) FROM BOOK
	INNER JOIN PUBLISHER
	ON PUBLISHER.PUBLISHERID=BOOK.PUBLISHERID
	GROUP BY PUBLISHERNAME
	HAVING SUM(PRICE) > 500
	ORDER BY SUM(PRICE) 

--12. List most expensive book for each author, sort it with the highest price. 

	SELECT AUTHORNAME,MAX(PRICE) FROM BOOK
	INNER JOIN AUTHOR
	ON BOOK.AUTHORID=AUTHOR.AUTHORID
	GROUP BY AUTHORNAME
	ORDER BY MAX(PRICE) DESC

--13. Display publisher name and difference between maximum and minimum book price. 

	SELECT PUBLISHERNAME ,DIFFERENCE(MAX(PRICE),MIN(PRICE)) FROM BOOK
	INNER JOIN PUBLISHER
	ON PUBLISHER.PUBLISHERID=BOOK.PUBLISHERID
	GROUP BY PUBLISHERNAME

--14. List publisher name and total price of books published each year. 

	SELECT PUBLICATIONYEAR,PUBLISHER.PUBLISHERNAME,SUM(PRICE) FROM BOOK
	INNER JOIN PUBLISHER
	ON PUBLISHER.PUBLISHERID=BOOK.PUBLISHERID
	GROUP BY PUBLICATIONYEAR,PUBLISHERNAME

--15. Display author name and total price of books sorted by highest total price.

	SELECT PUBLISHER.PUBLISHERNAME,SUM(PRICE) FROM BOOK
	INNER JOIN PUBLISHER
	ON PUBLISHER.PUBLISHERID=BOOK.PUBLISHERID
	GROUP BY PUBLISHERNAME
	ORDER BY SUM(PRICE) DESC


--	From the above table EMPLOYEE_MASTER perform the following queries:  

	CREATE TABLE EMPLOYEE_MASTER(
	EmployeeNo VARCHAR(3),
	Name VARCHAR(20),
	ManagerNo VARCHAR(3)
	)
	INSERT INTO EMPLOYEE_MASTER VALUES
	('E01','Tarun',NULL),
	('E02','Rohan','E02'),
	('E03','Priya','E01'),
	('E04','Milan','E03'),
	('E05','Jay','E01'),
	('E06','Anjana','E04')

--Part – C: 
--16. Retrieve the names of employee along with their manager’s name from the Employee table. 

	SELECT EMPLOYEE_MASTER.Name, EMPLOYEE_MASTER.Name FROM EMPLOYEE_MASTER
	SELF JOIN EMPLOYEE_MASTER
	ON EMPLOYEE_MASTER.EmployeeNo=EMPLOYEE_MASTER.ManagerNo

--17. Display employees who are managers. 

	

--18. Display number of employees working under each manager. 
--19. Display the employee’s name along with their manager’s name and senior manager name. 
--20. Display managers and count of employees under them in descending order. 