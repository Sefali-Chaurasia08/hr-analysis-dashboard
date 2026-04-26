USE hr_analysis;
SELECT * FROM hrdata;

SELECT  YearsWithCurrManager FROM hrdata;

Select Count(EmpID) from hrdata;

Select temp_id from hrdata;

-- checking null values
SELECT YearsWithCurrManager FROM hrdata
WHERE YearsWithCurrManager IS NULL;

-- count null
SELECT COUNT(*) AS null_count
FROM hrdata
WHERE YearsWithCurrManager IS NULL;

UPDATE hrdata
SET YearsWithCurrManager = 0
WHERE YearsWithCurrManager IS NULL;

ALTER TABLE hrdata 
DROP COLUMN YearsWithCurrManager;

-- check duplicate
Select * from hrdata 
where EmpID in (Select EmpID
from hrdata
group by EmpID
having Count(EmpID)>1);

SELECT EmpID, COUNT(*) AS C
FROM hrdata
GROUP BY EmpID
HAVING COUNT(*) > 1;

SELECT COUNT(*) - COUNT(DISTINCT EmpID) AS duplicate_count
FROM hrdata;

SELECT * FROM hrdata;

-- duplicate delete another method
CREATE TABLE new_table AS
SELECT DISTINCT *
FROM hrdata;

Select count(EmpID) from new_table;

DROP TABLE hrdata;
RENAME TABLE new_table TO hrdata;

SELECT * FROM hrdata;

Select EmpID AS c
from hrdata
group by EmpID
Having c > 1;

SELECT COUNT(EmpID) FROM hrdata;

SELECT DISTINCT BusinessTravel FROM hrdata;
-- Replace specific value
UPDATE hrdata
SET BusinessTravel = 'Travel_Rarely'
WHERE BusinessTravel = 'TravelRarely';

SELECT BusinessTravel, Attrition, COUNT(*) AS travel_attrition
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY BusinessTravel, Attrition
ORDER BY travel_attrition DESC;

SELECT EmpID FROM hrdata
WHERE EmpID = 'RM1465';

SELECT * FROM hrdata
WHERE EmpID = 'RM1465';

DESCRIBE hrdata;

-- Total employee
SELECT COUNT(*) AS total_employee
FROM hrdata;

SELECT COUNT(EmpID) AS count_emp
FROM hrdata;

-- Attrition count
SELECT Attrition, COUNT(*) AS count
FROM hrdata
GROUP BY Attrition;

-- (Employees Left / Total Employees) × 100
SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM hrdata;

-- What percentage of employees are leaving the company?
-- Attrition Rate
SELECT 
		SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS attrition_rate
FROM hrdata;

-- In which department are most employees leaving?
SELECT DISTINCT Department FROM hrdata;

SELECT Department, Attrition, COUNT(*) AS department_attrition
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY Department, Attrition
ORDER BY department_attrition DESC;

-- average salary 
SELECT AVG(MonthlyIncome) AS avg_salary
FROM hrdata;

-- Which department pays higher salaries? 
SELECT Department, AVG(MonthlyIncome) AS avg_salary
FROM hrdata
GROUP BY  Department
ORDER BY avg_salary DESC;

SELECT AVG(Age) AS avg_age
FROM hrdata;

SELECT DISTINCT AgeGroup FROM hrdata;

SELECT AgeGroup, Attrition, COUNT(*) AS agegroup_attrition
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY AgeGroup, Attrition
ORDER BY agegroup_attrition DESC;

-- jobrole wise avg salary
SELECT JobRole, AVG(MonthlyIncome) AS avg_salary
FROM hrdata
GROUP BY JobRole
ORDER BY avg_salary DESC;

SELECT Gender, Attrition, COUNT(*) AS gender_attrition
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY Gender, Attrition
ORDER BY gender_attrition DESC;

-- Job role wise attrition
SELECT DISTINCT JobRole FROM hrdata;
-- Which roles are most at risk of employee turnover?
SELECT JobRole, Attrition, COUNT(*) AS jobrole_attrition
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY  JobRole, Attrition
ORDER BY jobrole_attrition DESC;

-- Attrition by Jobsatisfaction
SELECT JobSatisfaction , Attrition, COUNT(*) AS satifaction_attrition
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY  JobSatisfaction, Attrition
ORDER BY satifaction_attrition DESC;
 
SELECT DISTINCT JobSatisfaction FROM hrdata;

-- Are employees who work overtime more likely to resign?
-- Employees with overtime
SELECT OverTime, COUNT(*) AS count
FROM hrdata
GROUP BY OverTime;

-- Attrition vs Overtime
SELECT OverTime, Attrition, COUNT(*) AS count
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY OverTime, Attrition
ORDER BY count DESC;

-- Are employees with poor work-life balance more likely to leave?
SELECT WorkLifeBalance, Attrition, COUNT(*) AS count
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY WorkLifeBalance, Attrition;

-- total employees of educationfield
SELECT EducationField, COUNT(*) AS total_employees
FROM hrdata
GROUP BY EducationField;

-- Are employees who work overtime more likely to resign?
SELECT EducationField, Attrition, COUNT(*) AS total_employees
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY EducationField, Attrition
ORDER BY total_employees DESC;

SELECT DISTINCT SalarySlab FROM hrdata;
SELECT  AVG(YearsATCompany) FROM hrdata;
SELECT DISTINCT JobRole FROM hrdata;

SELECT SalarySlab , Attrition, COUNT(*) AS salary_slab_attrition
FROM hrdata
WHERE Attrition = 'Yes'
GROUP BY SalarySlab, Attrition
ORDER BY salary_slab_attrition DESC;

-- Does marital status affect attrition?
SELECT MaritalStatus, COUNT(*) AS marital_employees
FROM hrdata
GROUP BY  MaritalStatus
ORDER BY marital_employees DESC;

SELECT MaritalStatus, Attrition, COUNT(*) AS marital_attrition
FROM hrdata
WHERE Attrition = 'No'
GROUP BY  MaritalStatus, Attrition
ORDER BY marital_attrition DESC;

-- Which employees have the highest salary in the company?
-- Top 5 Highest paid Employee
SELECT EmployeeNumber, MonthlyIncome
FROM hrdata
ORDER BY MonthlyIncome DESC
LIMIT 5;

SELECT EmployeeNumber, JobRole, Department, MonthlyIncome
FROM hrdata
ORDER BY MonthlyIncome DESC
LIMIT 5;

