--From the table EMPLOYEE perform the following queries:  
--Part – A:  
--1. Create a stored procedure to generate department-wise salary statistics like total salary, average 
--salary, minimum salary, and maximum salary. (User enter only department name) 

CREATE PROCEDURE sp_GetDeptSalaryStats
    @DeptName VARCHAR(100)
AS
BEGIN
    SELECT 
        Department, 
        SUM(Salary) AS TotalSalary, 
        AVG(Salary) AS AvgSalary, 
        MIN(Salary) AS MinSalary, 
        MAX(Salary) AS MaxSalary
    FROM EMPLOYEE
    WHERE Department = @DeptName
    GROUP BY Department
END

--2. Create a stored procedure that accepts a joining year and displays employees who joined that year.

CREATE PROCEDURE sp_GetEmpByJoinYear
    @JoinYear INT
AS
BEGIN
    SELECT * 
    FROM EMPLOYEE
    WHERE YEAR(JOININGYEAR) = @JoinYear
END

--3. Create a stored procedure for dynamic employee search using parameters (User may enter partial city 
--name). 

CREATE PROCEDURE sp_SearchEmployeeByCity
    @CityName VARCHAR(50)
AS
BEGIN
    SELECT * 
    FROM EMPLOYEE 
    WHERE City LIKE '%' + @CityName + '%'
END

--4. Create a stored procedure that accepts a salary amount and displays employees earning more than the 
--entered salary. 

CREATE PROCEDURE sp_EmployeesAboveSalary
    @SalaryAmount DECIMAL(10,2)
AS
BEGIN
    SELECT * 
    FROM EMPLOYEE 
    WHERE Salary > @SalaryAmount
END

--5. Create a stored procedure to display top N highest paid employees from each department (Value of N 
--is entered by user). 

CREATE PROCEDURE sp_TopNPaidPerDept
    @N INT
AS
BEGIN
    WITH RankedEmployees AS (
        SELECT *, 
               ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Salary DESC) as RankNum
        FROM EMPLOYEE
    )
    SELECT * 
    FROM RankedEmployees 
    WHERE RankNum <= @N
END

--6. Create a stored procedure to increase salary department-wise by a given percentage. (User Enter 
--Department Name and %, e.g. Computer 10). 

CREATE PROCEDURE sp_IncreaseSalaryByDept
    @DeptName VARCHAR(50),
    @Percentage DECIMAL(5,2)
AS
BEGIN
    UPDATE EMPLOYEE
    SET Salary = Salary + (Salary * @Percentage / 100.0)
    WHERE Department = @DeptName;
    
    PRINT 'Salaries updated successfully for ' + @DeptName
END

--7. Create a stored procedure to display employees having experience greater than or equal to the entered 
--years. 

CREATE PROCEDURE sp_FilterByExperience
    @Years INT
AS
BEGIN
    SELECT *, (YEAR(GETDATE()) - JoiningYear) AS ExperienceYears
    FROM EMPLOYEE
    WHERE (YEAR(GETDATE()) - JoiningYear) >= @Years
END

--8. Create a stored procedure that accepts a number as input and displays details of the last N employees 
--who joined the organization. 

CREATE PROCEDURE sp_LastNJoined
    @N INT
AS
BEGIN
    SELECT TOP (@N) *
    FROM EMPLOYEE
    ORDER BY JoiningYear DESC, EID DESC
END
 
--From the table AUTHOR, PUBLISHER and BOOK perform the following queries:  
--Part – B:  
--9. Create a stored procedure that accepts an author name and displays all books written by that author. 
--10. Create a stored procedure that accepts a publication year and displays books published after that year. 
--11. Create a stored procedure that accepts a country name and displays all authors from that country with 
--their books. 
--12. Create a stored procedure that accepts a number as input and displays the top N most expensive books 
--with author and publisher details. 
 
--Part – C:  
--13. Create a stored procedure that accepts a publisher name and displays the total number of books 
--published by that publisher. 
--14. Create a stored procedure that accepts a price range (Min Price Max Price) and displays books whose 
--prices fall within that range. 
--15. Create a stored procedure that accepts an author ID and deletes all books written by that author. 