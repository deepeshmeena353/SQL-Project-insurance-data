-- Import data in mysql 
-- 1. left click onn table.
-- 2. Table data import wizard.
-- 3. select import data and browse data and next.
-- 4. give new table name and  click next.
-- 5. check field type and click next.
-- 6. and click on next, and again next and finish.

SELECT * FROM insurance_data;

-- Show records of 'male' patient from 'southwest' region.
select* from insurance_data
where gender = 'Male' and region = "southwest";

-- Show all records having bmi in range 30 to 45 both inclusive.
SELECT * FROM insurance_data WHERE bmi BETWEEN  30 AND 45;

-- Show minimum and maximum bloodpressure of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively.
select max(bloodpressure) as maxBP, min(bloodpressure) as MinBP 
from insurance_data
where diabetic = "yes" and smoker = "yes";
-- second code
SELECT MIN(bloodpressure) AS Min_BP, MAX(bloodpressure) AS Max_BP 
FROM insurance_data 
WHERE smoker="yes";

-- Find no of unique patients who are not from southwest region. 
select count(distinct(PatientID)) from insurance_data
WHERE region <> "SOUTHWEST";
-- second option 
SELECT COUNT(DISTINCT(PatientID)) FROM insurance_data WHERE region NOT IN ("southwest");

-- Total claim amount from male smoker.
select sum(claim) from insurance_data
where gender = "male" and smoker = "Yes";

-- Select all records of south region.
select * from insurance_data
where region like 'south%';

-- No of patient having normal blood pressure. Normal range[90-120]
select count(PatientID) from insurance_data
where bloodpressure >= 90 and bloodpressure <= 120;
-- second option 
SELECT count(PatientID) FROM insurance_data WHERE bloodpressure BETWEEN 90 AND 120;

-- No of pateint belo 17 years of age having normal blood pressure as per below formula -
-- 1) BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)
-- 2) Note: Formula taken just for practice, don't take in real sense.
SELECT COUNT(*)
FROM insurance_data
WHERE age < 17
AND bloodpressure BETWEEN (80 + (age * 2)) AND (100 + (age * 2));
-- same ans
SELECT * FROM insurance_data WHERE age < 17 AND bloodpressure BETWEEN 80 AND 100;


-- What is the average claim amount for non-smoking female patients who are diabetic?
select avg(claim) from insurance_data
where gender = "female" and smoker = "no" AND diabetic ="YES";

-- Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.
UPDATE insurance_data
SET claim = 5000
WHERE PatientID =1234;

UPDATE INSURANCE SET CLAIM = 5000 WHERE PATIENTID =1234;
-- Check update 
select * from insurance_data
where PatientID = 1234;

-- Write a SQL query to delete all records for patients who are smokers and have no children.
delete from insurance_data where smoker = 'yes' and children = 0;

-- Done 









