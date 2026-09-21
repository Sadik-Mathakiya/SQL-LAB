-- 1. Return "Welcome to DBMS Lab"
CREATE FUNCTION dbo.fn_Welcome()
RETURNS VARCHAR(50)
AS
BEGIN
    RETURN 'Welcome to DBMS Lab';
END;

SELECT dbo.fn_Welcome() AS Message;


-- 2. Calculate Simple Interest
-- Formula: SI = (P * R * T) / 100
CREATE FUNCTION dbo.fn_SimpleInterest
(
    @P DECIMAL(18,2),
    @R DECIMAL(18,2),
    @T DECIMAL(18,2)
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    RETURN (@P * @R * @T) / 100;
END;

SELECT dbo.fn_SimpleInterest(10000, 5, 2) AS SimpleInterest;


-- 3. Difference in days between two dates
CREATE FUNCTION dbo.fn_DaysDifference
(
    @Date1 DATE,
    @Date2 DATE
)
RETURNS INT
AS
BEGIN
    RETURN ABS(DATEDIFF(DAY, @Date1, @Date2));
END;

SELECT dbo.fn_DaysDifference('2026-09-01', '2026-09-11') AS DifferenceInDays;


-- 4. Check Odd or Even
CREATE FUNCTION dbo.fn_OddEven
(
    @N INT
)
RETURNS VARCHAR(10)
AS
BEGIN
    IF @N % 2 = 0
        RETURN 'Even';

    RETURN 'Odd';
END;

SELECT dbo.fn_OddEven(10) AS Result;


-- 5. Print numbers from 1 to N
CREATE FUNCTION dbo.fn_Numbers1ToN
(
    @N INT
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @i INT = 1;
    DECLARE @Result VARCHAR(MAX) = '';

    WHILE @i <= @N
    BEGIN
        SET @Result = @Result + CAST(@i AS VARCHAR(20)) + ' ';
        SET @i = @i + 1;
    END;

    RETURN RTRIM(@Result);
END;

SELECT dbo.fn_Numbers1ToN(10) AS Numbers;


-- 6. Calculate Factorial
CREATE FUNCTION dbo.fn_Factorial
(
    @N INT
)
RETURNS BIGINT
AS
BEGIN
    DECLARE @i INT = 1;
    DECLARE @Fact BIGINT = 1;

    IF @N < 0
        RETURN NULL;

    WHILE @i <= @N
    BEGIN
        SET @Fact = @Fact * @i;
        SET @i = @i + 1;
    END;

    RETURN @Fact;
END;

SELECT dbo.fn_Factorial(5) AS Factorial;


-- 7. Check Palindrome Number
CREATE FUNCTION dbo.fn_Palindrome
(
    @N INT
)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Original INT = @N;
    DECLARE @Reverse BIGINT = 0;
    DECLARE @Remainder INT;

    IF @N < 0
        RETURN 'Not Palindrome';

    WHILE @N > 0
    BEGIN
        SET @Remainder = @N % 10;
        SET @Reverse = (@Reverse * 10) + @Remainder;
        SET @N = @N / 10;
    END;

    IF @Original = @Reverse
        RETURN 'Palindrome';

    RETURN 'Not Palindrome';
END;

SELECT dbo.fn_Palindrome(121) AS Result;


-- 8. Find Maximum of Three Numbers
CREATE FUNCTION dbo.fn_MaxOfThree
(
    @A INT,
    @B INT,
    @C INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Max INT;

    SET @Max = @A;

    IF @B > @Max
        SET @Max = @B;

    IF @C > @Max
        SET @Max = @C;

    RETURN @Max;
END;

SELECT dbo.fn_MaxOfThree(10, 25, 15) AS MaximumNumber;


-- 9. Calculate Square and Cube
CREATE FUNCTION dbo.fn_SquareCube
(
    @N INT
)
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN 'Square = ' + CAST(@N * @N AS VARCHAR(20))
         + ', Cube = ' + CAST(@N * @N * @N AS VARCHAR(20));
END;

SELECT dbo.fn_SquareCube(5) AS Result;