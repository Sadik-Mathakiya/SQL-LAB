--Perform SQL Queries Using Aggregate Functions with GROUP BY Clause (Without HAVING) 
-- From the tables EMPLOYEE perform the following queries 
--Part – A: 
--1. Display the Highest, Lowest Salary and Label the columns Maximum, Minimum respectively. 

	SELECT MAX(SALARY) AS Maximum, 
	MIN(SALARY) AS Minimum 
	FROM EMPLOYEE
	
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, 
--respectively. 

	SELECT SUM(SALARY) AS Total_Sal,AVG(SALARY) AS Average_Sal FROM EMPLOYEE

--3. Find total number of employees of EMPLOYEE table. 

	SELECT COUNT(*) FROM EMPLOYEE

--4. Find highest salary from Rajkot city. 

	SELECT MAX(SALARY) AS Highest_Salary
    FROM EMPLOYEE
	WHERE CITY = 'Rajkot'

--5. Give maximum salary from IT department. 

	SELECT MAX(SALARY) AS Highest_Salary
	FROM EMPLOYEE
	WHERE DEPARTMENT = 'IT'

--6. Count employee department is HR. 

	SELECT COUNT(*) AS HR_Employees
	FROM EMPLOYEE
	WHERE DEPARTMENT = 'HR'

--7. Display average salary of Admin department. 

	SELECT AVG(SALARY) AS Average_Salary
	FROM EMPLOYEE
	WHERE DEPARTMENT = 'Admin'

--8. Display total salary of HR department. 

	SELECT SUM(SALARY) AS Total_Salary
	FROM EMPLOYEE
	WHERE DEPARTMENT = 'HR'

--9. Count total number of cities of employee without duplication. 

	SELECT COUNT(DISTINCT CITY) AS Total_Cities
	FROM EMPLOYEE

--10. Count unique departments. 

	SELECT COUNT(DISTINCT DEPARTMENT) AS Total_Departments
	FROM EMPLOYEE

--11. Display minimum salary of employee who belongs to Ahmedabad. 

	SELECT MIN(SALARY) FROM EMPLOYEE
	WHERE CITY = 'AHMEDABAD' 

--12. Find city wise highest salary. 

	SELECT CITY,
    MAX(SALARY) AS Highest_Salary
	FROM EMPLOYEE
	GROUP BY CITY;

--13. Find department wise lowest salary. 

	SELECT MIN(SALARY),DEPARTMENT FROM EMPLOYEE
	GROUP BY DEPARTMENT

--14. Display minimum salary in each city. 

	SELECT MIN(SALARY),CITY FROM EMPLOYEE
	GROUP BY CITY

--15. Display average salary of employees from Surat. 

	SELECT AVG(SALARY) AS Average_Salary
	FROM EMPLOYEE
	WHERE CITY = 'Surat'

--16. Display total salary of female employees. 

	SELECT SUM(SALARY) AS Total_Salary
	FROM EMPLOYEE
	WHERE GENDER = 'Female'

--17. Count number of male employees. 

	SELECT COUNT(*) AS Male_Employees
	FROM EMPLOYEE
	WHERE GENDER = 'Male'

--18. Display city with the total number of employees belonging to each city. 

	SELECT CITY,
    COUNT(*) AS Total_Employees
	FROM EMPLOYEE
	GROUP BY CITY

--19. Count number of employees in each city where gender is MALE. 

	SELECT CITY,
    COUNT(*) AS Male_Employees	
	FROM EMPLOYEE
	WHERE GENDER = 'Male'
	GROUP BY CITY

--20. Display maximum salary in each department where city is not Ahmedabad.

	SELECT DEPARTMENT,
    MAX(SALARY) AS Maximum_Salary
	FROM EMPLOYEE
	WHERE CITY <> 'Ahmedabad'
	GROUP BY DEPARTMENT

 
--Part – B: 
--21. Display minimum salary in each city where gender is FEMALE. 

	SELECT MIN(SALARY) , CITY FROM EMPLOYEE
	WHERE GENDER = 'FEMALE'
	GROUP BY CITY

--22. Give total salary of each department of EMPLOYEE table. 

	SELECT SUM(SALARY) , DEPARTMENT FROM EMPLOYEE
	GROUP BY DEPARTMENT

--23. Give average salary of each department of EMPLOYEE table without displaying the respective 
--department name. 

	SELECT AVG(SALARY)  FROM EMPLOYEE
	GROUP BY DEPARTMENT

--24. Count the number of employees for each department in every city. 

	SELECT COUNT(*) , DEPARTMENT , CITY FROM EMPLOYEE
	GROUP BY DEPARTMENT,CITY

--25. Calculate the total salary distributed to male and female employees. 

	SELECT SUM(SALARY) , GENDER FROM EMPLOYEE
	GROUP BY GENDER

 
--Part – C: 
--26. Give city wise maximum and minimum salary of female employees. 

	SELECT MAX(SALARY) , MIN(SALARY),CITY FROM EMPLOYEE
	GROUP BY CITY

--27. Calculate department, city, and gender wise average salary. 

	SELECT AVG(SALARY), CITY , DEPARTMENT , GENDER FROM EMPLOYEE
	GROUP BY GENDER , CITY , DEPARTMENT

--28. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 

	SELECT MAX(SALARY)-MIN(SALARY) AS DIFFERENCE FROM EMPLOYEE

--29. Display sum of salaries of department wise where department name consist 5 letter. 

	SELECT SUM(SALARY)  FROM EMPLOYEE
	WHERE DEPARTMENT LIKE '_____'
	GROUP BY DEPARTMENT

--30. Find the Maximum salary department & city wise in which city name starts with ‘R’.

	SELECT DEPARTMENT , CITY , MAX(SALARY) FROM EMPLOYEE
	WHERE CITY LIKE 'R%'
	GROUP BY CITY,DEPARTMENT
