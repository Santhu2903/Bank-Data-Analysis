select * from loan;

#1. Total Loan Amount Funded

SELECT SUM(`Funded Amount`) AS Total_Loan_Amount_Funded 
FROM loan;

#2. Total Loans

SELECT COUNT(*) AS Total_Loans 
FROM loan;

#3. Total Collection

SELECT SUM(`Loan Amount`) AS Total_Collection 
FROM loan;

#4. Total Interest

SELECT SUM(`Total Rrec int`) AS Total_Interest 
FROM loan;

#5. Branch-Wise (Interest, Fees, Total Revenue)

SELECT `Branch Name`, 
       SUM(`Total Rrec int`) AS Total_Interest, 
       SUM(`Total Fees`) AS Total_Fees, 
       SUM( `Total Rrec int`+ `Total Fees`) AS Total_Revenue 
FROM loan
GROUP BY `Branch Name`;

#6. State-Wise Loan

SELECT `State Name`, SUM(`Loan Amount`) AS Total_Loan_Amount 
FROM loan
GROUP BY `State Name`;

#7. Religion-Wise Loan

SELECT Religion, SUM(`Loan Amount`) AS Total_Loan_Amount 
FROM loan
Group by Religion;


#8. Product Group-Wise Loan

SELECT `Purpose Category`, SUM(`Loan Amount`) AS Total_Loan_Amount 
FROM loan
GROUP BY `Purpose Category`;

#9. Disbursement Trend

SELECT `Disbursement Date (Years)` AS Year,
       SUM(`Loan Amount`) AS Total_Loan_Amount 
FROM loan
GROUP BY Year
ORDER By Year;

#10. Grade-Wise Loan

SELECT Grrade, COUNT(*) AS Total_Loans, 
       SUM(`Loan Amount`) AS Total_Loan_Amount 
FROM loan
GROUP BY Grrade;

#11. Count of Default Loan

SELECT COUNT(*) AS `Is Default Loan`
FROM loan
WHERE `Is Default Loan` = 'Y';

#12. Count of Delinquent Clients

SELECT COUNT(*) AS `Is Delinquent Loan`
FROM loan
WHERE `Is Delinquent Loan` = 'Y';

#13. Delinquent Loans Rate

SELECT (COUNT(*) / (SELECT COUNT(*) FROM loan)) * 100 AS Delinquent_Loan_Rate
FROM loan
WHERE `Is Delinquent Loan` = 'Y';

#14. Default Loan Rate

SELECT (COUNT(*) / (SELECT COUNT(*) FROM loan)) * 100 AS Default_Loan_Rate 
FROM loan
WHERE `Is Default Loan` = 'Y';

#15. Loan Status-Wise Loan

SELECT `Loan Status`, COUNT(*) AS Loan_Count, SUM(`Loan Amount`) AS Total_Loan_Amount 
FROM loan
GROUP BY `Loan Status`;

#16. Age Group-Wise Loan

SELECT Age, 
       COUNT(*) AS `Loan Amount`, 
       SUM(`Loan Amount`) AS Total_Loan_Amount 
FROM loan
GROUP BY Age;
