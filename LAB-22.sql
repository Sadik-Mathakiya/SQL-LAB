
CREATE TABLE CUSTOMER (
    ORDERID INT PRIMARY KEY,
    CNAME VARCHAR(50),
    PRODUCT VARCHAR(50),
    CATEGORY VARCHAR(50),
    AMOUNT INT,
    ORDERYEAR INT,
    CITY VARCHAR(50)
)

INSERT INTO CUSTOMER (ORDERID, CNAME, PRODUCT, CATEGORY, AMOUNT, ORDERYEAR, CITY) VALUES
(101, 'RAHUL', 'LAPTOP', 'ELECTRONICS', 65000, 2024, 'RAJKOT'),
(102, 'PRIYA', 'MOBILE', 'ELECTRONICS', 25000, 2023, 'SURAT'),
(103, 'AMIT', 'TABLE', 'FURNITURE', 12000, 2022, 'AHMEDABAD'),
(104, 'NEHA', 'CHAIR', 'FURNITURE', 8000, 2024, 'BARODA'),
(105, 'VISHAL', 'TV', 'ELECTRONICS', 45000, 2025, 'MORBI'),
(106, 'RIYA', 'SOFA', 'FURNITURE', 30000, 2023, 'SURAT'),
(107, 'MEHUL', 'AC', 'ELECTRONICS', 40000, 2022, 'RAJKOT'),
(108, 'KRUNAL', 'BED', 'FURNITURE', 40000, 2025, 'JAMNAGAR')
--Part – A: 
--1. Display top 3 highest amount orders. 

    WITH RankedOrders AS (
    SELECT *, DENSE_RANK() OVER(ORDER BY AMOUNT DESC) as [Rank]
    FROM CUSTOMER
    )
    SELECT * FROM RankedOrders WHERE [Rank] <= 3

--2. Display second highest order amount. 

    WITH RankedAmount AS (
    SELECT AMOUNT, DENSE_RANK() OVER(ORDER BY AMOUNT DESC) as [Rank]
    FROM CUSTOMER
    )
    SELECT DISTINCT AMOUNT FROM RankedAmount WHERE [Rank] = 2

--3. Display customers whose order amount is greater than category average amount. 

    WITH CategoryAvg AS (
    SELECT CATEGORY, AVG(AMOUNT) as avg_amt
    FROM CUSTOMER
    GROUP BY CATEGORY
    )
    SELECT c.CNAME, c.PRODUCT, c.AMOUNT, c.CATEGORY
    FROM CUSTOMER c
    JOIN CategoryAvg a ON c.CATEGORY = a.CATEGORY
    WHERE c.AMOUNT > a.avg_amt

--4. Display categories having average amount greater than 30000. 

    WITH CategoryAvg AS (
    SELECT CATEGORY, AVG(AMOUNT) as avg_amt
    FROM CUSTOMER
    GROUP BY CATEGORY
    )
    SELECT CATEGORY, avg_amt FROM CategoryAvg WHERE avg_amt > 30000

--5. Display highest amount order from each category. 

    WITH CategoryMax AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY CATEGORY ORDER BY AMOUNT DESC) as [Rank]
    FROM CUSTOMER
    )
    SELECT * FROM CategoryMax WHERE [Rank] = 1

--6. Display lowest amount order from each category. 

    WITH CategoryMin AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY CATEGORY ORDER BY AMOUNT ASC) as [Rank]
    FROM CUSTOMER
    )
    SELECT * FROM CategoryMin WHERE [Rank] = 1

--7. Display categories having more than 3 orders. 

    WITH CategoryCount AS (
    SELECT CATEGORY, COUNT(ORDERID) as order_count
    FROM CUSTOMER
    GROUP BY CATEGORY
    )
    SELECT CATEGORY FROM CategoryCount WHERE order_count > 3

--8. Display city-wise total order amount. 

    WITH CityTotals AS (
    SELECT CITY, SUM(AMOUNT) as total_amt
    FROM CUSTOMER
    GROUP BY CITY
    )
    SELECT * FROM CityTotals

--9. Display category having highest average order amount. 

    WITH CategoryAvg AS (
    SELECT CATEGORY, AVG(AMOUNT) as avg_amt
    FROM CUSTOMER
    GROUP BY CATEGORY
    ),
    RankedAvg AS (
    SELECT CATEGORY, avg_amt, DENSE_RANK() OVER(ORDER BY avg_amt DESC) as [Rank]
    FROM CategoryAvg
    )
    SELECT CATEGORY FROM RankedAvg WHERE [Rank] = 1

--10. Display cumulative order amount in ascending order of amount. 

    WITH CumulativeAmt AS (
    SELECT ORDERID, CNAME, AMOUNT, 
           SUM(AMOUNT) OVER(ORDER BY AMOUNT ASC) as cumulative_amount
    FROM CUSTOMER
    )
    SELECT * FROM CumulativeAmt

 
--Part – B: 
--11. Display category-wise top 2 highest amount orders. 

    WITH CategoryRanked AS (
    SELECT *, DENSE_RANK() OVER(PARTITION BY CATEGORY ORDER BY AMOUNT DESC) as [Rank]
    FROM CUSTOMER
    )
    SELECT * FROM CategoryRanked WHERE [Rank] <= 2

--12. Display customers whose amount is closest to category average amount.

    WITH CatAvg AS (
    SELECT CATEGORY, AVG(AMOUNT) as avg_amt
    FROM CUSTOMER
    GROUP BY CATEGORY
    ),
    DiffCalc AS (
    SELECT c.*, a.avg_amt, ABS(c.AMOUNT - a.avg_amt) as diff,
           ROW_NUMBER() OVER(PARTITION BY c.CATEGORY ORDER BY ABS(c.AMOUNT - a.avg_amt) ASC) as [Rank]
    FROM CUSTOMER c
    JOIN CatAvg a ON c.CATEGORY = a.CATEGORY
    )
    SELECT * FROM DiffCalc WHERE [Rank] = 1

--13. Display previous, current and next order amount together. 

    WITH LagLeadAmt AS (
    SELECT ORDERID, CNAME, 
           LAG(AMOUNT) OVER(ORDER BY ORDERID) as previous_amount,
           AMOUNT as current_amount,
           LEAD(AMOUNT) OVER(ORDER BY ORDERID) as next_amount
    FROM CUSTOMER
    )
    SELECT * FROM LagLeadAmt

--14. Display customers whose amount is greater than previous customer's amount.

    WITH PrevAmount AS (
    SELECT CNAME, AMOUNT, LAG(AMOUNT) OVER(ORDER BY ORDERID) as prev_amt
    FROM CUSTOMER
    )
    SELECT CNAME, AMOUNT, prev_amt FROM PrevAmount WHERE AMOUNT > prev_amt

--15. Display customers whose rank and dense rank are different. 

    WITH RankComparison AS (
    SELECT CNAME, AMOUNT, 
           RANK() OVER(ORDER BY AMOUNT DESC) as [Rank],
           DENSE_RANK() OVER(ORDER BY AMOUNT DESC) as [DRank]
    FROM CUSTOMER
    )
    SELECT CNAME, AMOUNT, [Rank], [DRank] FROM RankComparison WHERE [Rank] <> [DRank]

 
--Part – C: 
--16. Display orders whose amount is neither highest nor lowest in their category. 

    WITH Extremes AS (
    SELECT CATEGORY, MAX(AMOUNT) as max_amt, MIN(AMOUNT) as min_amt
    FROM CUSTOMER
    GROUP BY CATEGORY
    )
    SELECT c.*
    FROM CUSTOMER c
    JOIN Extremes e ON c.CATEGORY = e.CATEGORY
    WHERE c.AMOUNT > e.min_amt AND c.AMOUNT < e.max_amt

--17. Display category-wise difference between highest and lowest amount. 

    WITH MinMax AS (
    SELECT CATEGORY, MAX(AMOUNT) as max_amt, MIN(AMOUNT) as min_amt
    FROM CUSTOMER
    GROUP BY CATEGORY
    )
    SELECT CATEGORY, (max_amt - min_amt) as amount_difference
    FROM MinMax

--18. Display customers whose amount is greater than all FURNITURE category orders. 

    WITH MaxFurniture AS (
    SELECT MAX(AMOUNT) as max_f_amt
    FROM CUSTOMER
    WHERE CATEGORY = 'FURNITURE'
    )
    SELECT c.*
    FROM CUSTOMER c
    CROSS JOIN MaxFurniture m
    WHERE c.AMOUNT > m.max_f_amt

--19. Display categories where all orders are above 10000.

    WITH CatMinAmount AS (
    SELECT CATEGORY, MIN(AMOUNT) as min_amt
    FROM CUSTOMER
    GROUP BY CATEGORY
    )
    SELECT CATEGORY FROM CatMinAmount WHERE min_amt > 10000

--20. Display customers whose amount difference from category topper is minimum.

    WITH CatMax AS (
    SELECT CATEGORY, MAX(AMOUNT) as max_amt
    FROM CUSTOMER
    GROUP BY CATEGORY
    ),
    DiffFromTop AS (
    SELECT c.CNAME, c.CATEGORY, c.AMOUNT, (m.max_amt - c.AMOUNT) as diff,
           DENSE_RANK() OVER(PARTITION BY c.CATEGORY ORDER BY (m.max_amt - c.AMOUNT) ASC) as [DRank]
    FROM CUSTOMER c
    JOIN CatMax m ON c.CATEGORY = m.CATEGORY
    WHERE c.AMOUNT < m.max_amt 
    )
    SELECT CNAME, CATEGORY, AMOUNT, diff
    FROM DiffFromTop
    WHERE [DRank] = 1
