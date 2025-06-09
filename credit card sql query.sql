CREATE DATABASE creditcard;
USE creditcard

SELECT * FROM credit_card
SELECT * FROM customer

SELECT DISTINCT 
	PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Income) over()  AS p25,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Income) OVER() AS p50,
	PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Income) OVER() AS p75,
	PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY Income) OVER() AS p90
FROM customer

COPY credit_card
FROM 'E:\Mustafa\PowerBI\Rishabh Mishra\cc_add.csv'
DELIMITER ','
CSV HEADER;

BULK INSERT credit_card
FROM 'E:\Mustafa\PowerBI\Rishabh Mishra\cc_add.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,  -- skip header row
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

sp_help credit_card;

SELECT count(*) FROM credit_card

SELECT MAX(Total_Trans_Amt) FROM credit_card

ALTER TABLE credit_card
ALTER COLUMN Qtr VARCHAR(50)

ALTER TABLE credit_card
ALTER COLUMN total_trans_amt INT;

SELECT COUNT(*) FROM credit_card WHERE Week_Start_Date = '2023-12-31';

SELECT * FROM credit_card ORDER BY Week_Start_Date DESC;

DELETE FROM credit_card
WHERE Week_Start_Date = '2023-12-31'

BULK INSERT CUSTOMER
FROM 'E:\Mustafa\PowerBI\Rishabh Mishra\cust_add.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,  -- skip header row
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

sp_help customer;

ALTER TABLE CUSTOMER
ALTER COLUMN CAR_OWNER VARCHAR(50)

ALTER TABLE CUSTOMER
ALTER COLUMN HOUSE_OWNER VARCHAR(50)

ALTER TABLE CUSTOMER
ALTER COLUMN PERSONAL_LOAN VARCHAR(50);

SELECT * FROM customer;

SELECT * FROM credit_card