-- Supplier Table
CREATE TABLE Supplier (
    Supplier_ID INT AUTO_INCREMENT PRIMARY KEY,
    Supplier_Name VARCHAR(255),
    Phone_Number VARCHAR(20)
);
-- Company Table
CREATE TABLE Company (
    Company_ID INT AUTO_INCREMENT PRIMARY KEY,
    Company_Name VARCHAR(255),
    Join_Date DATETIME,
    No_Of_Helmets INT,
    No_Of_Employees INT,
    Cloud_Storage_Renew_Date DATE
);

-- Employee Table
CREATE TABLE Employee (
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Position VARCHAR(255),
    Authorization_Level INT,
    Telephone_No VARCHAR(20),
    Company_ID INT,
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID)
);

-- Helmet Table
CREATE TABLE Helmet (
    Helmet_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(255),
    Helmet_Unique_Code VARCHAR(255),
    Employee_ID INT,
    UNIQUE (Helmet_Unique_Code),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Time Log Table
CREATE TABLE Time_Log (
    Log_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT,
    Start_Time DATETIME,
    End_Time DATETIME,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Salary Calculation Table
CREATE TABLE Salary_Calculation (
    Calculation_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT,
    Total_Hours INT,
    Hourly_Rate DECIMAL(10, 2),
    Total_Salary DECIMAL(10, 2),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Emergency Alarm System Table
CREATE TABLE Emergency_Alarm_System (
    Alarm_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(255),
    Location VARCHAR(255),
    Helmet_ID INT,
    Employee_ID INT,
    FOREIGN KEY (Helmet_ID) REFERENCES Helmet(Helmet_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Employee Management System Table
CREATE TABLE Employee_Management_System (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Access_Level INT,
    Username VARCHAR(255),
    Password VARCHAR(255),
    Email_Address VARCHAR(255) UNIQUE,
    Employee_ID INT,
    Company_ID INT,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID)
);

-- Fall Detection Event Table
CREATE TABLE Fall_Detection_Event (
    Fall_Detection_Event_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(255),
    Time_Stamp DATETIME,
    Employee_ID INT,
    Helmet_ID INT,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Helmet_ID) REFERENCES Helmet(Helmet_ID)
);

-- Gas Detection Event Table
CREATE TABLE Gas_Detection_Event (
    Gas_Detection_Event_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(255),
    Timestamp DATETIME,
    Helmet_ID INT,
    FOREIGN KEY (Helmet_ID) REFERENCES Helmet(Helmet_ID)
);

-- Construction Site Table
CREATE TABLE Construction_Site (
    Site_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(255),
    Company_ID INT,
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID)
);

-- Materials Table
CREATE TABLE Materials (
    Material_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(255),
    Quantity INT,
    Supplier VARCHAR(255),
    Supplier_ID INT,
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

-- Leaving Table
CREATE TABLE Leaving (
    Leaving_ID INT AUTO_INCREMENT PRIMARY KEY,
    Reason VARCHAR(255),
    Start_Date DATE,
    End_Date DATE
);


ALTER TABLE Leaving
ADD COLUMN Employee_ID INT,
ADD CONSTRAINT fk_Employee_ID FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID);

ALTER TABLE Fall_Detection_Event
ADD COLUMN `Date` DATE AFTER Time_Stamp;

ALTER TABLE Gas_Detection_Event
ADD COLUMN `Date` DATE AFTER Timestamp;


CREATE TABLE Health_Monitoring_System (
    Health_Status_ID INT AUTO_INCREMENT PRIMARY KEY,
    Vital_Sign VARCHAR(255),
    Heart_Rate INT,
    Helmet_ID INT,
    FOREIGN KEY (Helmet_ID) REFERENCES Helmet(Helmet_ID)
);


-- Adding Company_ID column to Time_Log table
ALTER TABLE Time_Log
ADD COLUMN Company_ID INT;

-- Adding FOREIGN KEY constraint to Company_ID column
ALTER TABLE Time_Log
ADD CONSTRAINT fk_Company_ID FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID);

-- Adding Helmet_ID column to Time_Log table
ALTER TABLE Time_Log
ADD COLUMN Helmet_ID INT;

-- Adding FOREIGN KEY constraint to Helmet_ID column
ALTER TABLE Time_Log
ADD CONSTRAINT fk_Helmet_ID FOREIGN KEY (Helmet_ID) REFERENCES Helmet(Helmet_ID);

CREATE TABLE Bank_Account (
    Account_Number INT PRIMARY KEY,
    Bank VARCHAR(255),
    Branch VARCHAR(255),
    Employee_ID INT,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);
