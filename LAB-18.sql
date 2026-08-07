--From the table STUDENT perform the following queries:  
--Part – A: 
--1. Display the details of students whose SPI is greater than the average SPI. 

	SELECT * FROM STUDENT
	WHERE SPI>(SELECT AVG(SPI) FROM STUDENT)

--2. Display the names of students whose SPI is less than the average SPI. 

	SELECT SNAME FROM STUDENT
	WHERE SPI<(SELECT AVG(SPI) FROM STUDENT)

--3. Display the student details who has the highest SPI.

	SELECT * FROM STUDENT
	WHERE SPI = (SELECT MAX(SPI) FROM STUDENT)

--4. Display the student details who has the lowest SPI. 

	SELECT * FROM STUDENT
	WHERE SPI = (SELECT MAX(SPI) FROM STUDENT)

--5. Display the students whose SPI is greater than SPI of student DHARMIK. 

	SELECT * FROM STUDENT
	WHERE SPI > (SELECT SPI FROM STUDENT
	WHERE SNAME='DHARMIK')

--6. Display the students whose SPI is less than SPI of student RIYA. 

	SELECT * FROM STUDENT
	WHERE SPI < (SELECT SPI FROM STUDENT
	WHERE SNAME='RIYA')

--7. Display the students who belong to the same branch as KRUNAL. 

	SELECT * FROM STUDENT
	WHERE BRANCH = (SELECT BRANCH FROM STUDENT
	WHERE SNAME='KRUNAL')

--8. Display the students whose branch is different from HETVI. 

	SELECT * FROM STUDENT
	WHERE BRANCH != (SELECT BRANCH FROM STUDENT
	WHERE SNAME='HETVI')

--9. Display the second highest SPI from RESULT table.  

	SELECT * FROM RESULT
	WHERE SPI < (SELECT MAX(SPI) FROM RESULT)

--10. Display the second lowest SPI from RESULT table. 

	SELECT * FROM RESULT
	WHERE SPI > (SELECT MIN(SPI) FROM RESULT)

--11. Display the names of students whose SPI is above branch-wise average SPI.  

	SELECT SNAME,BRANCH FROM STUDENT
	WHERE SPI > (SELECT AVG(SPI) FROM STUDENT)
	GROUP BY BRANCH,SNAME

--12. Display the branch having maximum average SPI.  

	SELECT BRANCH FROM STUDENT
	WHERE SPI >= ALL(SELECT AVG(SPI) FROM STUDENT
	GROUP BY BRANCH)

--13. Display the branch having minimum average SPI.  

	SELECT BRANCH FROM STUDENT
	WHERE SPI <= ALL(SELECT AVG(SPI) FROM STUDENT
	GROUP BY BRANCH)

--From the table STUDENT_INFO and RESULT perform the following queries:  
--Part – B: 
--14. Display the students whose SPI is greater than all students of ME branch.

	SELECT * FROM STUDENT
	WHERE SPI > ALL (SELECT SPI FROM STUDENT
	WHERE BRANCH='MECHANICAL')

--15. Display the students whose SPI is less than any student of ME branch.  

	SELECT * FROM STUDENT
	WHERE SPI < ALL (SELECT SPI FROM STUDENT
	WHERE BRANCH='MECHANICAL')

--16. Display the student details whose SPI is not equal to any SPI of EC branch students.  

	SELECT * FROM STUDENT
	WHERE SPI NOT IN (
    SELECT SPI 
    FROM STUDENT 
    WHERE BRANCH = 'ELECTRICAL')

--17. Display the names of students who scored higher SPI than student of RNO 103. 

	SELECT SNAME FROM STUDENT 
	WHERE SPI > (
    SELECT SPI 
    FROM STUDENT 
    WHERE STDID = 103)

--18. Display the students whose SPI is greater than average SPI of their own branch.  

SELECT * FROM STUDENT s1
WHERE SPI > (
    SELECT AVG(SPI)
    FROM STUDENT s2
    WHERE s1.branch = s2.branch)

--19. Display the students whose SPI is greater than the average SPI of CE branch but greater than the 
--maximum SPI of ME branch.  

	SELECT * FROM STUDENT
	WHERE SPI > (SELECT AVG(SPI) FROM STUDENT 
	WHERE branch = 'COMPUTER') AND SPI > (SELECT MAX(SPI) FROM STUDENT 
    WHERE branch = 'MECHANICAL')

--20. Display the branch names whose average SPI is greater than the overall average SPI.

	SELECT BRANCH FROM STUDENT
	GROUP BY BRANCH
	HAVING AVG(SPI) > (SELECT AVG(SPI) FROM STUDENT)

--21. Display the students who have maximum SPI in their respective branch. 

	SELECT * FROM STUDENT s1
	WHERE SPI = (SELECT MAX(SPI) FROM STUDENT s2
    WHERE s1.BRANCH = s2.BRANCH)

--22. Display the students whose SPI is greater than their average SPI of their branch and greater than overall 
--average SPI. 

	SELECT * FROM STUDENT s1
	WHERE SPI > (SELECT AVG(SPI) FROM STUDENT s2
    WHERE s1.BRANCH = s2.BRANCH)
    AND SPI > (SELECT AVG(SPI) FROM STUDENT)

 
--Part – C: 
--23. Display the students whose SPI is greater than at least one student of every branch.  
--24. Display the students whose SPI is less than all students of CE branch.  
--25. Display the branch that contains the student with highest SPI.  
--26. Display the students whose SPI is less than the SPI of every student in CE branch and greater than every 
--student in ME branch. 