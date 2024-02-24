-- Select all records from the Gas_Sensor table
SELECT * FROM Gas_Sensor;


-- Insert a new record into the Gas_Sensor table
INSERT INTO Gas_Sensor (Gas_Type, Detection_Range) VALUES ('Propane', '0-5000 ppm');


-- Update the detection range of a gas sensor record
UPDATE Gas_Sensor SET Detection_Range = '0-1000 ppm' WHERE Sensor_ID = 1;


-- Delete a record from the Gas_Sensor table
DELETE FROM Gas_Sensor WHERE Sensor_ID = 3;


-- Retrieve the Employee's name, Company name, and the number of helmets they have
SELECT Employee.Name, Company.Company_Name, Company.No_Of_Helmets
FROM Employee
INNER JOIN Company ON Employee.Company_ID = Company.Company_ID;


-- Calculate the average hourly rate of all employees
SELECT AVG(Hourly_Rate) AS Average_Hourly_Rate FROM Salary_Calculation;


-- Find the employee(s) with the highest total salary
SELECT Employee_ID, Total_Salary
FROM Salary_Calculation
WHERE Total_Salary = (SELECT MAX(Total_Salary) FROM Salary_Calculation);


-- Retrieve employees who have helmets and their corresponding helmet location
SELECT Employee.Name, Helmet.Location
FROM Employee
INNER JOIN Helmet ON Employee.Helmet_ID = Helmet.Helmet_ID;

-- Identify employees with passwords containing special characters
SELECT User_Name, Pass_Word
FROM Employee_Management_System
WHERE Pass_Word REGEXP '[^a-zA-Z0-9 ]';


-- Count the number of employees in each position and filter for positions with more than 1 employee
SELECT Position, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Position
HAVING COUNT(*) > 1;


-- Retrieve employees along with their company name, position, and total hours worked
SELECT Employee.Name, Company.Company_Name, Employee.Position, SUM(Salary_Calculation.Total_Hours) AS Total_Hours_Worked
FROM Employee
INNER JOIN Company ON Employee.Company_ID = Company.Company_ID
INNER JOIN Salary_Calculation ON Employee.Employee_ID = Salary_Calculation.Employee_ID
GROUP BY Employee.Employee_ID;


-- Retrieve all employees ordered by their name in ascending order
SELECT * FROM Employee ORDER BY Name ASC;


-- Retrieve the first 5 employees in the Employee table
SELECT * FROM Employee LIMIT 5;


-- Retrieve all distinct positions held by employees
SELECT DISTINCT Position FROM Employee;


-- Calculate the total number of helmets owned by each company
SELECT Company.Company_Name, COUNT(Employee.Helmet_ID) AS Total_Helmets
FROM Company
LEFT JOIN Employee ON Company.Company_ID = Employee.Company_ID
GROUP BY Company.Company_Name;


-- Increase the hourly rate by 10% for employees whose positions are 'Manager'
UPDATE Salary_Calculation
SET Hourly_Rate = Hourly_Rate * 1.10
WHERE Employee_ID IN (SELECT Employee_ID FROM Employee WHERE Position = 'Manager');


-- Retrieve employees and their associated company names where the company name starts with 'A'
SELECT Employee.Name, Company.Company_Name
FROM Employee
INNER JOIN Company ON Employee.Company_ID = Company.Company_ID
WHERE Company.Company_Name LIKE 'A%';


-- Retrieve employees who do not have assigned helmets
SELECT Employee.Name
FROM Employee
LEFT JOIN Helmet ON Employee.Helmet_ID = Helmet.Helmet_ID
WHERE Helmet.Helmet_ID IS NULL;


-- Retrieve employees who have logged their time for work
SELECT Name
FROM Employee
WHERE EXISTS (
    SELECT 1
    FROM Time_Log
    WHERE Employee.Employee_ID = Time_Log.Employee_ID
);


-- Calculate the total number of hours worked by each employee and their hourly rate
WITH Total_Work_Hours AS (
    SELECT Employee_ID, SUM(Total_Hours) AS Total_Hours
    FROM Salary_Calculation
    GROUP BY Employee_ID
)
SELECT Employee.Employee_ID, Employee.Name, Total_Work_Hours.Total_Hours, Salary_Calculation.Hourly_Rate
FROM Employee
INNER JOIN Total_Work_Hours ON Employee.Employee_ID = Total_Work_Hours.Employee_ID
INNER JOIN Salary_Calculation ON Employee.Employee_ID = Salary_Calculation.Employee_ID;


-- Rank employees based on their total salary in descending order
SELECT Name, Total_Salary,
       ROW_NUMBER() OVER (ORDER BY Total_Salary DESC) AS Salary_Rank
FROM (
    SELECT Employee.Name, SUM(Total_Salary) AS Total_Salary
    FROM Salary_Calculation
    INNER JOIN Employee ON Salary_Calculation.Employee_ID = Employee.Employee_ID
    GROUP BY Employee.Name
) AS Total_Salaries;


-- Calculate the total number of employees in each position and classify them as 'Senior' if they have more than 5 employees, otherwise 'Junior'
SELECT Position,
       CASE WHEN COUNT(*) > 5 THEN 'Senior' ELSE 'Junior' END AS Employee_Level,
       COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Position;


-- Find employees who have the same position as another employee
SELECT DISTINCT e1.Name AS Employee1, e2.Name AS Employee2, e1.Position
FROM Employee e1
JOIN Employee e2 ON e1.Position = e2.Position
WHERE e1.Employee_ID < e2.Employee_ID;


-- Calculate the average total hours worked by employees, classified by their positions
SELECT Position,
       AVG(CASE WHEN Total_Hours > 0 THEN Total_Hours ELSE 0 END) AS Avg_Total_Hours
FROM Salary_Calculation
JOIN Employee ON Salary_Calculation.Employee_ID = Employee.Employee_ID
GROUP BY Position;


-- Find employees who have logged more than 20 hours of work
SELECT Name
FROM Employee
WHERE Employee_ID IN (
    SELECT Employee_ID
    FROM Salary_Calculation
    WHERE Total_Hours > 20
);


-- Find access levels with more than 3 employees assigned to them
SELECT Access_Level, COUNT(*) AS Employee_Count
FROM Employee_Management_System
GROUP BY Access_Level
HAVING COUNT(*) > 3;


-- Retrieve employees who do not have access level 'Admin'
SELECT * 
FROM Employee_Management_System 
WHERE User_Name NOT IN (SELECT User_Name FROM Employee_Management_System WHERE Access_Level = 'Admin');


-- Find employees with similar usernames
SELECT e1.User_Name, e2.User_Name AS Similar_User_Name
FROM Employee_Management_System e1
JOIN Employee_Management_System e2 ON e1.User_Name LIKE CONCAT('%', e2.User_Name, '%') AND e1.Management_ID <> e2.Management_ID;

-- Calculate the percentage of employees with full access
SELECT (COUNT(CASE WHEN Access_Level = 'Full access' THEN 1 END) / COUNT(*)) * 100 AS Percentage_Full_Access
FROM Employee_Management_System;

-- Find the latest joined employees
SELECT User_Name, Access_Level, Control
FROM Employee_Management_System
ORDER BY Management_ID DESC
LIMIT 5;


-- Identify employees with the highest level of control
SELECT User_Name, Access_Level, Control
FROM Employee_Management_System
WHERE Control = (SELECT MAX(Control) FROM Employee_Management_System);

-- Find employees who have the same password
SELECT Pass_Word, COUNT(*) AS Employees_Sharing_Password
FROM Employee_Management_System
GROUP BY Pass_Word
HAVING COUNT(*) > 1;


-- Calculate average password length by access level
SELECT Access_Level, AVG(LENGTH(Pass_Word)) AS Avg_Password_Length
FROM Employee_Management_System
GROUP BY Access_Level;

-- Find employees with expired passwords (for demonstration purpose, let's assume passwords are expired if they are shorter than 6 characters)
SELECT User_Name, Pass_Word
FROM Employee_Management_System
WHERE LENGTH(Pass_Word) < 6;

-- Identify employees with null passwords
SELECT User_Name
FROM Employee_Management_System
WHERE Pass_Word IS NULL;


-- Calculate the ratio of employees to control level
SELECT Control, COUNT(*) AS Employee_Count,
       COUNT(*) / (SELECT COUNT(*) FROM Employee_Management_System) AS Ratio
FROM Employee_Management_System
GROUP BY Control;

-- Find employees who share the same access level and control
SELECT Access_Level, Control, COUNT(*) AS Employee_Count
FROM Employee_Management_System
GROUP BY Access_Level, Control
HAVING COUNT(*) > 1;

-- Check if primary keys exist and are unique in Employee_Management_System table
SELECT COUNT(Management_ID) AS Total_Records, COUNT(DISTINCT Management_ID) AS Unique_Records
FROM Employee_Management_System;

-- Check for employees with empty access levels
SELECT *
FROM Employee_Management_System
WHERE Access_Level = '';

-- Identify employees with weak passwords (less than 8 characters)
SELECT User_Name, Pass_Word
FROM Employee_Management_System
WHERE LENGTH(Pass_Word) < 8;

-- Identify employees with the same control and access level
SELECT Access_Level, Control, COUNT(*) AS Employee_Count
FROM Employee_Management_System
GROUP BY Access_Level, Control
HAVING COUNT(*) > 1;

-- Find employees with the highest total salary
SELECT e.User_Name, e.Access_Level, e.Control, SUM(sc.Total_Salary) AS Total_Salary
FROM Employee_Management_System e
JOIN Salary_Calculation sc ON e.Management_ID = sc.Employee_ID
GROUP BY e.User_Name, e.Access_Level, e.Control
ORDER BY Total_Salary DESC
LIMIT 1;

-- Calculate the percentage of employees with numeric passwords
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Employee_Management_System) AS Percentage_Numeric_Passwords
FROM Employee_Management_System
WHERE Pass_Word REGEXP '^[0-9]+$';

-- Find employees with the longest access levels
SELECT User_Name, Access_Level
FROM Employee_Management_System
ORDER BY LENGTH(Access_Level) DESC
LIMIT 5;

-- Identify employees with the highest total salary using aliases
SELECT e.User_Name, e.Access_Level, e.Control, SUM(sc.Total_Salary) AS Total_Salary
FROM Employee_Management_System e
JOIN Salary_Calculation sc ON e.Management_ID = sc.Employee_ID
GROUP BY e.User_Name, e.Access_Level, e.Control
ORDER BY Total_Salary DESC
LIMIT 1;


