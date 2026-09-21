--		From the table STUDENT perform the following queries:  
--Part – A: 
--1. Create a table valued function to display all student records. 

	CREATE OR ALTER FUNCTION FN_ALL_STUDENT()
	RETURNS TABLE 
	AS
	RETURN (
	SELECT * FROM STUDENT
	)

--2. Create a table valued function that accepts CITY and returns all students from that city. 

	CREATE OR ALTER FUNCTION FN_CITY_STUDENT(@CITY VARCHAR(50))
	RETURNS TABLE 
	AS
	RETURN (
	SELECT * FROM STUDENT
	WHERE CITY=@CITY
	)

--3. Create a table valued function that accepts BRANCH and returns all students of that branch. 

	CREATE OR ALTER FUNCTION FN_BRANCH_STUDENT(@BRANCH VARCHAR(50))
	RETURNS TABLE 
	AS
	RETURN (
	SELECT * FROM STUDENT
	WHERE BRANCH=@BRANCH
	)

--4. Create a table valued function that accepts SPI and returns students whose SPI is greater than entered 
--SPI. 

	CREATE OR ALTER FUNCTION FN_SPI_STUDENT(@SPI DECIMAL(4,2))
	RETURNS TABLE 
	AS
	RETURN (
	SELECT * FROM STUDENT
	WHERE SPI>@SPI
	)

--5. Create a table valued function that accepts MIN_SPI and MAX_SPI and returns students whose SPI lies 
--between given range.


	CREATE OR ALTER FUNCTION FN_RANGE_STUDENT(@MIN_SPI DECIMAL(4,2) ,@MAX_SPI DECIMAL(4,2))
	RETURNS TABLE 
	AS
	RETURN (
	SELECT * FROM STUDENT
	WHERE SPI BETWEEN @MIN_SPI AND @MAX_SPI
	)
 
--Part – B:  
--6. Create a table valued function that accepts STDID and returns details of that student. 

	CREATE OR ALTER FUNCTION FN_STDID_STUDENT(@STDID INT)
	RETURNS TABLE 
	AS
	RETURN (
	SELECT * FROM STUDENT
	WHERE STDID = @STDID
	)

--7. Create a table valued function that accepts CITY and returns students whose SPI is greater than 7 from 
--that city. 

	CREATE OR ALTER FUNCTION FN_CITY_SPI_STUDENT(@CITY VARCHAR(50))
	RETURNS TABLE 
	AS
	RETURN (
	SELECT * FROM STUDENT
	WHERE SPI>7 AND CITY=@CITY
	)

--8. Create a table valued function that accepts BRANCH and returns students whose SPI is less than 8 from 
--that branch. 

	CREATE OR ALTER FUNCTION FN_BRANCH_SPI_STUDENT(@BRANCH VARCHAR(50))
	RETURNS TABLE 
	AS
	RETURN (
	SELECT * FROM STUDENT
	WHERE SPI<8 AND BRANCH = @BRANCH
	)

--9. Create a table valued function that accepts TOPN and returns top N students based on SPI. 

	CREATE OR ALTER FUNCTION FN_TOPN_STUDENT(@TOPN INT)
	RETURNS TABLE 
	AS
	RETURN (
	SELECT TOP (@TOPN) * FROM STUDENT
	ORDER BY SPI DESC
	)

--10. Create a table valued function that accepts BRANCH and returns highest SPI student from that branch. 
 
 	CREATE OR ALTER FUNCTION FN_BRANCH_HSPI_STUDENT(@BRANCH VARCHAR(50))
	RETURNS TABLE 
	AS
	RETURN (
	SELECT TOP 1 * FROM STUDENT
	WHERE BRANCH = @BRANCH
	ORDER BY SPI DESC
	)

--Part – C:  
--11. Create a table valued function that accepts CITY and returns total students from that city. 

	

--12. Create a table valued function that accepts BRANCH and returns students ordered by SPI in descending 
--order. 
--13. Create a table valued function that accepts CITY and returns top 3 student from that city based on SPI. 
--14. Create a table valued function that accepts STDID and returns student rank based on SPI (RANK). 
--15. Create a table valued function that accepts BRANCH and returns students having second highest SPI 
--from that branch.