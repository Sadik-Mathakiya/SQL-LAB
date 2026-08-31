-- ============================================
-- STORED PROCEDURE SOLUTION
-- Part A: STUDENT and DEPOSIT
-- Part B: EMPLOYEE
-- SQL Server / T-SQL
-- ============================================

-- NOTE:
-- This solution assumes these columns:
-- STUDENT(STDID, SNAME, CITY, SPI, BRANCH)
-- DEPOSIT(ACTNO, CNAME, BNAME, AMOUNT, ADATE)
-- EMPLOYEE has a department column named DEPT.
-- If your EMPLOYEE table uses DEPARTMENT instead of DEPT,
-- replace DEPT with DEPARTMENT in Procedure 8.

-- ============================================
-- 1. INSERT PROCEDURE FOR STUDENT
-- ============================================

CREATE OR ALTER PROCEDURE SP_INSERT_STUDENT
    @STDID INT,
    @SNAME VARCHAR(50),
    @CITY VARCHAR(50),
    @SPI DECIMAL(5,2),
    @BRANCH VARCHAR(50)
AS
BEGIN
    INSERT INTO STUDENT (STDID, SNAME, CITY, SPI, BRANCH)
    VALUES (@STDID, @SNAME, @CITY, @SPI, @BRANCH);
END;
GO

-- Insert given records
EXEC SP_INSERT_STUDENT 115, 'PUSHTI', 'RAJKOT', 9.48, 'COMPUTER';
EXEC SP_INSERT_STUDENT 116, 'NIKUNJ', 'SURAT', 8.80, 'CHEMICAL';
GO


-- ============================================
-- 2. INSERT PROCEDURE FOR DEPOSIT
-- ============================================

CREATE OR ALTER PROCEDURE SP_INSERT_DEPOSIT
    @ACTNO INT,
    @CNAME VARCHAR(50),
    @BNAME VARCHAR(50),
    @AMOUNT DECIMAL(12,2),
    @ADATE DATE
AS
BEGIN
    INSERT INTO DEPOSIT (ACTNO, CNAME, BNAME, AMOUNT, ADATE)
    VALUES (@ACTNO, @CNAME, @BNAME, @AMOUNT, @ADATE);
END;
GO

-- Insert given records
EXEC SP_INSERT_DEPOSIT 118, 'HEMENT', 'BEDI', 16000, '2025-05-05';
EXEC SP_INSERT_DEPOSIT 119, 'RAVI', 'MAVDI', 24000, '2024-07-09';
GO


-- ============================================
-- 3. UPDATE PROCEDURE FOR STUDENT
-- Update Branch using Student ID
-- ============================================

CREATE OR ALTER PROCEDURE SP_UPDATE_STUDENT
    @STDID INT,
    @BRANCH VARCHAR(50)
AS
BEGIN
    UPDATE STUDENT
    SET BRANCH = @BRANCH
    WHERE STDID = @STDID;
END;
GO

-- Given values from the question
EXEC SP_UPDATE_STUDENT 115, 'ELECTRICAL';
EXEC SP_UPDATE_STUDENT 116, 'MECHANICAL';
GO


-- ============================================
-- 4. DELETE PROCEDURE FOR STUDENT
-- Delete student whose name is RAVI
-- ============================================

CREATE OR ALTER PROCEDURE SP_DELETE_STUDENT
AS
BEGIN
    DELETE FROM STUDENT
    WHERE SNAME = 'RAVI';
END;
GO

-- Execute procedure
EXEC SP_DELETE_STUDENT;
GO


-- ============================================
-- 5. SELECT BY PRIMARY KEY
-- Select student by STDID and display all columns
-- ============================================

CREATE OR ALTER PROCEDURE SP_SELECT_STUDENT_BY_ID
    @STDID INT
AS
BEGIN
    SELECT *
    FROM STUDENT
    WHERE STDID = @STDID;
END;
GO

-- Example
EXEC SP_SELECT_STUDENT_BY_ID 115;
GO


-- ============================================
-- 6. TOP 5 STUDENTS ORDERED BY SPI
-- Highest SPI first
-- ============================================

CREATE OR ALTER PROCEDURE SP_TOP5_STUDENT
AS
BEGIN
    SELECT TOP 5 *
    FROM STUDENT
    ORDER BY SPI DESC;
END;
GO

-- Execute procedure
EXEC SP_TOP5_STUDENT;
GO


-- ============================================
-- PART B: EMPLOYEE
-- ============================================

-- ============================================
-- 7. DISPLAY ALL EMPLOYEE DETAILS
-- ============================================

CREATE OR ALTER PROCEDURE SP_SELECT_ALL_EMPLOYEE
AS
BEGIN
    SELECT *
    FROM EMPLOYEE;
END;
GO

-- Execute procedure
EXEC SP_SELECT_ALL_EMPLOYEE;
GO


-- ============================================
-- 8. SELECT EMPLOYEES BY DEPARTMENT
-- Takes department name as input
-- ============================================

CREATE OR ALTER PROCEDURE SP_SELECT_EMPLOYEE_BY_DEPT
    @DEPT VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM EMPLOYEE
    WHERE DEPT = @DEPT;
END;
GO

-- Example
EXEC SP_SELECT_EMPLOYEE_BY_DEPT 'SALES';
GO
