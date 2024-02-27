-- Populate Supplier table
INSERT INTO Supplier (Supplier_ID, Supplier_Name, Phone_Number)
VALUES
    (1, 'Safety Gear Inc.', '123-456-7890'),
    (2, 'Protective Equipment Ltd.', '987-654-3210'),
    (3, 'Head Protection Supply Co.', '456-789-0123'),
    (4, 'Safety First Suppliers', '789-012-3456'),
    (5, 'Secure Helmets LLC', '321-654-9870');


-- Populate Company table
INSERT INTO Company (Company_ID, Company_Name, Join_Date, No_Of_Helmets, No_Of_Employees, Cloud_Storage_Renew_Date)
VALUES
    (1, 'Construction Co.', '2023-01-15', 100, 50, '2024-06-30'),
    (2, 'Building Solutions Ltd.', '2023-03-20', 150, 75, '2024-08-15'),
    (3, 'Safety Contractors Inc.', '2022-11-10', 80, 40, '2024-05-20'),
    (4, 'Worksite Innovations LLC', '2023-05-05', 120, 60, '2024-10-10'),
    (5, 'Hard Hat Builders', '2023-07-01', 200, 100, '2024-12-31');


-- Populate Helmet table
INSERT INTO Helmet (Helmet_ID, Location, Start_Time, End_Time, Total_Hours, Helmet_Unique_Code, Company_ID)
VALUES
    (1, 'Construction Site A', '2024-02-25 08:00:00', '2024-02-25 16:00:00', 8, 'ABC123', 1),
    (2, 'Construction Site B', '2024-02-26 07:30:00', '2024-02-26 15:30:00', 8, 'DEF456', 2),
    (3, 'Construction Site C', '2024-02-27 09:00:00', '2024-02-27 17:00:00', 8, 'GHI789', 3),
    (4, 'Construction Site D', '2024-02-25 08:30:00', '2024-02-25 16:30:00', 8, 'JKL012', 4),
    (5, 'Construction Site E', '2024-02-26 09:30:00', '2024-02-26 17:30:00', 8, 'MNO345', 5);


-- Populate Employee table
INSERT INTO Employee (Employee_ID, Employee_Name, Hourly_Rate, Position, Email, Telephone_No, Join_Date, Helmet_ID, Company_ID)
VALUES
    (1, 'John Smith', 15.00, 'Foreman', 'john.smith@example.com', '123-456-7891', '2023-01-20', 1, 1),
    (2, 'Emily Johnson', 12.50, 'Carpenter', 'emily.johnson@example.com', '234-567-8912', '2023-03-25', 2, 2),
    (3, 'Michael Williams', 13.75, 'Electrician', 'michael.williams@example.com', '345-678-9123', '2022-11-15', 3, 3),
    (4, 'Emma Brown', 11.25, 'Laborer', 'emma.brown@example.com', '456-789-1234', '2023-05-10', 4, 4),
    (5, 'James Davis', 14.00, 'Plumber', 'james.davis@example.com', '567-891-2345', '2023-07-05', 5, 5);


-- Populate Salary_Calculation table
INSERT INTO Salary_Calculation (Calculation_ID, Total_Salary, Employee_ID, Helmet_ID)
VALUES
    (1, 1200.00, 1, 1),
    (2, 1000.00, 2, 2),
    (3, 1100.00, 3, 3),
    (4, 900.00, 4, 4),
    (5, 1120.00, 5, 5);

-- Populate Emergency_Alarm_System table
INSERT INTO Emergency_Alarm_System (Alarm_ID, Type, Location, Helmet_ID, Employee_ID)
VALUES
    (1, 'Fire Alarm', 'Site A Building 1', 1, 1),
    (2, 'Gas Leak Alarm', 'Site B Basement', 2, 2),
    (3, 'Medical Emergency', 'Site C Roof', 3, 3),
    (4, 'Fall Alarm', 'Site D Scaffold', 4, 4),
    (5, 'Intruder Alarm', 'Site E Gate', 5, 5);

-- Populate Fall_Detection_Event table
INSERT INTO Fall_Detection_Event (Fall_Detection_Event_ID, Location, Time_Stamp, Date, Employee_ID, Helmet_ID)
VALUES
    (1, 'Site A Roof', '08:15:00', '2024-02-25', 1, 1),
    (2, 'Site B Scaffold', '09:20:00', '2024-02-26', 2, 2),
    (3, 'Site C Ladder', '10:30:00', '2024-02-27', 3, 3),
    (4, 'Site D Stairs', '08:45:00', '2024-02-25', 4, 4),
    (5, 'Site E Trench', '11:00:00', '2024-02-26', 5, 5);

-- Populate Gas_Detection_Event table
INSERT INTO Gas_Detection_Event (Gas_Detection_Event_ID, Location, Timestamp, Date, Helmet_ID)
VALUES
    (1, 'Site A Basement', '08:30:00', '2024-02-25', 1),
    (2, 'Site B Boiler Room', '09:45:00', '2024-02-26', 2),
    (3, 'Site C Workshop', '10:00:00', '2024-02-27', 3),
    (4, 'Site D Warehouse', '09:00:00', '2024-02-25', 4),
    (5, 'Site E Generator Room', '11:30:00', '2024-02-26', 5);

-- Populate Construction_Site table
INSERT INTO Construction_Site (Site_ID, Location, Company_ID)
VALUES
    (1, '123 Main Street', 1),
    (2, '456 Oak Avenue', 2),
    (3, '789 Pine Road', 3),
    (4, '321 Elm Boulevard', 4),
    (5, '654 Maple Lane', 5);

-- Populate Materials table
INSERT INTO Materials (Material_ID, Type, Quantity, Supplier, Supplier_ID)
VALUES
    (1, 'Concrete', 100, 'Supplier A', 1),
    (2, 'Steel Beams', 50, 'Supplier B', 2),
    (3, 'Bricks', 2000, 'Supplier C', 3),
    (4, 'Pipes', 150, 'Supplier D', 4),
    (5, 'Electrical Wiring', 500, 'Supplier E', 5);

-- Populate Leave table
INSERT INTO `Leave` (Leaving_ID, Reason, Start_Date, End_Date, Employee_ID)
VALUES
    (1, 'Vacation', '2024-02-25', '2024-03-01', 1),
    (2, 'Family Emergency', '2024-02-26', '2024-02-28', 2),
    (3, 'Personal Reasons', '2024-02-27', '2024-03-02', 3),
    (4, 'Sick Leave', '2024-02-25', '2024-02-28', 4),
    (5, 'Training Seminar', '2024-02-26', '2024-03-01', 5);

-- Populate Health_Monitoring_System table
INSERT INTO Health_Monitoring_System (Health_status_ID, Vital_Sign, Heart_Rate, Helmet_ID)
VALUES
    (1, 'Normal', 75, 1),
    (2, 'Normal', 80, 2),
    (3, 'Elevated', 90, 3),
    (4, 'Normal', 70, 4),
    (5, 'High', 100, 5);

-- Populate Bank_Account table
INSERT INTO Bank_Account (Account_Number, Bank, Branch, Employee_ID)
VALUES
    ('1234567890', 'Bank A', 'Main Branch', 1),
    ('2345678901', 'Bank B', 'Downtown Branch', 2),
    ('3456789012', 'Bank C', 'City Center Branch', 3),
    ('4567890123', 'Bank D', 'Industrial Zone Branch', 4),
    ('5678901234', 'Bank E', 'Suburban Branch', 5);

-- Populate Login table
INSERT INTO Login (Login_ID, Access_Level, Username, Password, Company_ID)
VALUES
    (1, 1, 'john_smith', 'password123', 1),
    (2, 2, 'emily_johnson', 'securepass456', 2),
    (3, 1, 'michael_williams', 'strongpassword789', 3),
    (4, 1, 'emma_brown', 'password321', 4),
    (5, 2, 'james_davis', 'safepass789', 5);


-- Populate Material_Request table
INSERT INTO Material_Request (Request_ID, Quantity_Requested, Receiving_Date, Supervisor_Name, Material_ID)
VALUES
    (1, 50, '2024-02-28', 'John Doe', 1),
    (2, 20, '2024-03-01', 'Jane Smith', 2),
    (3, 100, '2024-03-02', 'David Johnson', 3),
    (4, 30, '2024-02-29', 'Emily Brown', 4),
    (5, 80, '2024-03-03', 'Michael Davis', 5);


-- Populate Alert_History table
INSERT INTO Alert_History (Alert_ID, Alert_Type, Date, Time, Employee_Name, Helmet_ID, Employee_ID)
VALUES
    (1, 'Gas Leak', '2024-02-25', '08:35:00', 'John Smith', 1, 1),
    (2, 'Fall Detection', '2024-02-26', '09:25:00', 'Emily Johnson', 2, 2),
    (3, 'Health Alert', '2024-02-27', '10:35:00', 'Michael Williams', 3, 3),
    (4, 'Emergency', '2024-02-25', '09:00:00', 'Emma Brown', 4, 4),
    (5, 'Intruder Alert', '2024-02-26', '11:15:00', 'James Davis', 5, 5);
