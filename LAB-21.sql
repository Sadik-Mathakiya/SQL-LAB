--From the table STUDENT perform the following queries:  
--Part – A: 
--1. Display all students whose SPI is greater than 8. 

	WITH HIGHSPI AS(
	SELECT * FROM STUDENT
	WHERE SPI>8
	)
	SELECT * FROM HIGHSPI

--2. Display average SPI of all students. 

	WITH AVGSPI  AS(
	SELECT AVG(SPI) AS AVG_SPI FROM STUDENT
	)
	SELECT * FROM AVGSPI

--3. Display total number of students in each branch. 

	WITH TOTALSTUDENT AS(
	SELECT BRANCH,COUNT(*) AS TOTAL_STUDENT FROM STUDENT
	GROUP BY BRANCH
	)
	SELECT * FROM TOTALSTUDENT

--4. Display students who belong to RAJKOT city. 

	WITH RAJKOTSTUDENT AS(
	SELECT * FROM STUDENT
	WHERE CITY = 'RAJKOT'
	)
	SELECT * FROM RAJKOTSTUDENT

--5. Find branch names that appear more than once. 

	WITH BRANCHLIST AS(
	SELECT BRANCH,COUNT(BRANCH) AS APPEAR FROM STUDENT
	GROUP BY BRANCH 
	HAVING COUNT(BRANCH) > 1
	)
	SELECT * FROM BRANCHLIST

--6. Display row number for each student. 

	WITH ROWNUMBER AS(
	SELECT *,ROW_NUMBER() OVER (ORDER BY STDID ASC) AS [ROW_NUMBER] FROM STUDENT
	)
	SELECT * FROM ROWNUMBER

--7. Display top 3 students based on SPI. 

	WITH TOP3 AS(
	SELECT TOP 4 * ,DENSE_RANK() OVER (ORDER BY SPI DESC) AS [RANK] FROM STUDENT
	)
	SELECT * FROM TOP3

--8. Display students having maximum SPI. 

	 WITH MaxSpiCTE AS (
    SELECT MAX(SPI) AS MaxSPI 
    FROM STUDENT
	)
	SELECT * 
	FROM STUDENT 
	WHERE SPI = (SELECT MaxSPI FROM MaxSpiCTE)

--9. Display students having minimum SPI.

	WITH MinSpiCTE AS (
    SELECT MIN(SPI) AS MinSPI 
    FROM STUDENT
	)
	SELECT * 
	FROM STUDENT 
	WHERE SPI = (SELECT MinSPI FROM MinSpiCTE)

--10. Display branch -wise rank of students. 

	WITH RankedStudents AS (
    SELECT *, RANK() OVER(PARTITION BY BRANCH ORDER BY SPI DESC) AS BranchRank
    FROM STUDENT
	)
	SELECT * 
	FROM RankedStudents

 
--Part – B: 
--11. Display students SPI average belonging to Computer branch. 

	WITH ComputerStudents AS (
    SELECT SPI 
    FROM STUDENT 
    WHERE BRANCH = 'Computer'
	)
	SELECT AVG(SPI) AS ComputerAvgSPI 
	FROM ComputerStudents

--12. Display students whose SPI is greater than average SPI of his/her branch. 

	WITH BranchAvg AS (
    SELECT BRANCH, AVG(SPI) AS AvgSPI 
    FROM STUDENT 
    GROUP BY BRANCH
	)
	SELECT S.* 
	FROM STUDENT S
	JOIN BranchAvg B 
	ON S.BRANCH = B.BRANCH
	WHERE S.SPI > B.AvgSPI

--13. Display branch having more than 2 students. 

	WITH BranchCounts AS (
    SELECT BRANCH, COUNT(STDID) AS StudentCount 
    FROM STUDENT 
    GROUP BY BRANCH
	)
	SELECT BRANCH 
	FROM BranchCounts 
	WHERE StudentCount > 2

--14. Display branches having average SPI between 7 and 9

	WITH BranchAvg AS (
    SELECT BRANCH, AVG(SPI) AS AvgSPI 
    FROM STUDENT 
    GROUP BY BRANCH
	)
	SELECT BRANCH, AvgSPI 
	FROM BranchAvg
	WHERE AvgSPI BETWEEN 7 AND 9

--15. Display students whose SPI is lower than overall average SPI. 

	WITH OverallAvg AS (
    SELECT AVG(SPI) AS AvgSPI 
    FROM STUDENT
	)
	SELECT * 
	FROM STUDENT 
	WHERE SPI < (SELECT AvgSPI FROM OverallAvg)

--Part – C: 
--16. Display branches having exactly one student. 

	WITH BranchCounts AS (
    SELECT BRANCH, COUNT(STDID) AS StudentCount 
    FROM STUDENT 
    GROUP BY BRANCH
	)
	SELECT BRANCH 
	FROM BranchCounts 
	WHERE StudentCount = 1

--17. Display branch having highest average SPI. 
--18. Display branch having lowest average SPI. 
--19. Display students whose SPI is lower than branch average SPI. 
--20. Display branches having maximum number of students. 