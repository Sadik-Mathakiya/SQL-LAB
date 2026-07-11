--Lab 10 Implement SQL In-Built Functions for Mathematical and String Operations 
--Math functions 
--Part – A: 
--1. Display the result of 5 multiply by 30. 

	SELECT 5 * 30 AS MultiplicationResult

--2. Find out the absolute value of -25, 25, -50 and 50. 

	SELECT ABS(-25) AS Abs1, ABS(25) AS Abs2, ABS(-50) AS Abs3, ABS(50) AS Abs4

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 

	SELECT CEILING(25.2) AS Ceil1, CEILING(25.7) AS Ceil2, CEILING(-25.2) AS Ceil3

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 

	SELECT FLOOR(25.2) AS Floor1, FLOOR(25.7) AS Floor2, FLOOR(-25.2) AS Floor3

--5. Find out remainder of 5 divided 2 and 5 divided by 3. 

	SELECT 5 % 2 AS Remainder1, 5 % 3 AS Remainder2

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.

	SELECT POWER(3, 2) AS Power1, POWER(4, 3) AS Power2

--7. Find out the square root of 25, 30 and 50. 

	SELECT SQRT(25) AS Sqrt1, SQRT(30) AS Sqrt2, SQRT(50) AS Sqrt3

--8. Find out the square of 5, 15, and 25. 

	SELECT SQUARE(5) AS Sqr1, SQUARE(15) AS Sqr2, SQUARE(25) AS Sqr3

--9. Find out the value of PI. 

	SELECT PI() AS PiValue

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.

	SELECT ROUND(157.732, 2) AS Round2Dec, ROUND(157.732, 0) AS Round0Dec, ROUND(157.732, -2) AS RoundMinus2Dec

--11. Find out exponential value of 2 and 3. 

	SELECT EXP(2) AS Exp1, EXP(3) AS Exp2

--12. Find out logarithm having base e of 10 and 2. 

	SELECT LOG(10) AS LogE1, LOG(2) AS LogE2

--13. Find logarithm base 10 of 5 and 100

	SELECT LOG10(5) AS Log10_1, LOG10(100) AS Log10_2

--14. Find sine, cosine and tangent of 3.1415. 

	SELECT SIN(3.1415) AS SineVal, COS(3.1415) AS CosineVal, TAN(3.1415) AS TangentVal;

--15. Find sign of -25, 0 and 25. 

	SELECT SIGN(-25) AS Sign1, SIGN(0) AS Sign2, SIGN(25) AS Sign3

--16. Generate random number using function. 
	SELECT RAND() AS RandomNumber

--String functions 
--Part – A: 
--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 

	SELECT LEN(NULL) AS LengthNull, LEN('   hello     ') AS LengthHello, LEN('') AS LengthBlank

--2. Display your name in lower & upper case. 

	SELECT LOWER('SADIK') AS LowerName, UPPER('sadik') AS UpperName

--3. Display first three characters of your name. 

	SELECT LEFT('Sadik', 3) AS FirstThreeChars

--4. Display 3rd to 10th character of your name. 

SELECT SUBSTRING('SadikMathakiya', 3, 8) AS SubstringName

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 

	SELECT REPLACE('abc123efg', '123', 'XYZ') AS Replace1, REPLACE('abcabcabc', 'c', '5') AS Replace2

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.

	SELECT ASCII('a') AS a_asc, ASCII('A') AS A_asc, ASCII('z') AS z_asc, ASCII('Z') AS Z_asc, ASCII('0') AS zero_asc, ASCII('9') AS nine_asc

--7. Write a query to display character based on number 97, 65,122,90,48,57. 

	SELECT CHAR(97) AS C97, CHAR(65) AS C65, CHAR(122) AS C122, CHAR(90) AS C90, CHAR(48) AS C48, CHAR(57) AS C57

--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘.

	SELECT LTRIM(' hello world  ') AS LtrimResult

--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘. 

	SELECT RTRIM(' hello world  ') AS RtrimResult

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.

	SELECT LEFT('SQL Server', 4) AS First4, RIGHT('SQL Server', 5) AS Last5

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 

	SELECT CAST('1234.56' AS FLOAT) AS CastResult, CONVERT(FLOAT, '1234.56') AS ConvertResult

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).

	SELECT CAST(10.58 AS INT) AS CastIntResult, CONVERT(INT, 10.58) AS ConvertIntResult

--13. Put 10 space before your name using function. 

	SELECT SPACE(10) + 'Sadik' AS SpacedName

--14. Combine two strings using + sign as well as CONCAT (). 

	SELECT 'Hello' + 'World' AS PlusOperator, CONCAT('Hello', 'World') AS ConcatFunction


--15. Find reverse of “Darshan”. 

	SELECT REVERSE('Darshan') AS ReversedString

--16. Repeat your name 3 times. 

	SELECT REPLICATE('Sadik', 3) AS RepeatedName

 
--Part – B: Perform following queries on EMPLOYEE table. 
--17. Display FIRSTNAME and LASTNAME in lowercase and uppercase. 

	SELECT LOWER(FIRSTNAME) AS LowerFirst, UPPER(FIRSTNAME) AS UpperFirst, 
       LOWER(LASTNAME) AS LowerLast, UPPER(LASTNAME) AS UpperLast 
	FROM EMPLOYEE

--18. Display full name by combining FIRSTNAME and LASTNAME. 

	SELECT CONCAT(FIRSTNAME, ' ', LASTNAME) AS FullName 
	FROM EMPLOYEE

-- 19. Display FIRSTNAME with first 3 characters only.

	SELECT LEFT(FIRSTNAME, 3) AS First3Name 
	FROM EMPLOYEE

-- 20. Display LASTNAME with last 2 characters only.

	SELECT RIGHT(LASTNAME, 2) AS Last2Name 
	FROM EMPLOYEE

-- 21. Display length of each employee’s FIRSTNAME.

	SELECT FIRSTNAME, LEN(FIRSTNAME) AS FirstNameLength 
	FROM EMPLOYEE

-- 22. Display FIRSTNAME after replacing ‘A’ with ‘@’.

	SELECT REPLACE(FIRSTNAME, 'A', '@') AS ReplacedName 
	FROM EMPLOYEE

-- 23. Display FIRSTNAME and LASTNAME with - between them using CONCAT.

	SELECT CONCAT(FIRSTNAME, '-', LASTNAME) AS HyphenatedName 
	FROM EMPLOYEE

-- 24. Display FIRSTNAME without first and last character.

	SELECT SUBSTRING(FIRSTNAME, 2, LEN(FIRSTNAME) - 2) AS TrimmedName 
	FROM EMPLOYEE 
	WHERE LEN(FIRSTNAME) > 2             

-- 25. Display FIRSTNAME after replacing vowels with '*'.\

	SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(FIRSTNAME, 'a', '*'), 'e', '*'), 'i', '*'), 'o', '*'), 'u', '*') AS NoVowelName 
	FROM EMPLOYEE

-- 26. Display employees where combined length of FIRSTNAME and LASTNAME is greater than 10.

	SELECT * FROM EMPLOYEE 
	WHERE (LEN(FIRSTNAME) + LEN(LASTNAME)) > 10

-- 27. Display FIRSTNAME and its reverse.

	SELECT FIRSTNAME, REVERSE(FIRSTNAME) AS ReversedName 
	FROM EMPLOYEE

-- 28. Display employees whose FIRSTNAME and LASTNAME start with same character using LEFT()

	SELECT * FROM EMPLOYEE 
	WHERE LEFT(FIRSTNAME, 1) = LEFT(LASTNAME, 1)