CREATE DATABASE hr_analytics;

USE hr_analytics;

-- Total Employees

SELECT COUNT(*) AS Total_Employees
FROM employees;

-- Employees by Department

SELECT Department,
COUNT(*) AS Total_Employees
FROM employees
GROUP BY Department
ORDER BY Total_Employees DESC;

-- Recruitment Source Analysis

SELECT RecruitmentSource,
       COUNT(*) AS Total_Hires
FROM employees
GROUP BY RecruitmentSource
ORDER BY Total_Hires DESC;

-- Average Salary by Department

SELECT Department,
       ROUND(AVG(Salary),2) AS Average_Salary
FROM employees
GROUP BY Department
ORDER BY Average_Salary DESC;

-- Recruitment Source vs Employee Engagement

SELECT RecruitmentSource,
       ROUND(AVG(EngagementSurvey),2) AS Avg_Engagement
FROM employees
GROUP BY RecruitmentSource
ORDER BY Avg_Engagement DESC;

-- Manager Performance

SELECT ManagerName,
       ROUND(AVG(EngagementSurvey),2) AS Avg_Engagement,
       COUNT(*) AS Team_Size
FROM employees
WHERE ManagerName IS NOT NULL
GROUP BY ManagerName
HAVING COUNT(*) >= 5
ORDER BY Avg_Engagement DESC;

-- Department-wise Employee Turnover

SELECT Department,
       COUNT(*) AS Employees_Left
FROM employees
WHERE EmploymentStatus LIKE '%Terminated%'
GROUP BY Department
ORDER BY Employees_Left DESC;

-- Department-wise Employee Satisfaction

SELECT Department,
       ROUND(AVG(EmpSatisfaction),2) AS Avg_Satisfaction
FROM employees
GROUP BY Department
ORDER BY Avg_Satisfaction DESC;

-- Performance Score Distribution

SELECT PerformanceScore,
       COUNT(*) AS Employee_Count
FROM employees
GROUP BY PerformanceScore
ORDER BY Employee_Count DESC;

-- Average Absences by Department

SELECT Department,
       ROUND(AVG(Absences),2) AS Avg_Absences
FROM employees
GROUP BY Department
ORDER BY Avg_Absences DESC;

-- Top 10 Highest Paid Employees

SELECT Employee_Name,
       Position,
       Department,
       Salary
FROM employees
ORDER BY Salary DESC
LIMIT 10;

-- Average Salary by Gender

SELECT Sex,
       ROUND(AVG(Salary),2) AS Average_Salary
FROM employees
GROUP BY Sex
ORDER BY Average_Salary DESC;

-- Employees by Marital Status

SELECT MaritalDesc,
       COUNT(*) AS Total_Employees
FROM employees
GROUP BY MaritalDesc
ORDER BY Total_Employees DESC;

-- Employees by Job Position

SELECT Position,
       COUNT(*) AS Employee_Count
FROM employees
GROUP BY Position
ORDER BY Employee_Count DESC;

-- Department-wise Performance

SELECT Department,
       ROUND(AVG(EngagementSurvey),2) AS Avg_Engagement,
       ROUND(AVG(EmpSatisfaction),2) AS Avg_Satisfaction
FROM employees
GROUP BY Department
ORDER BY Avg_Engagement DESC;
