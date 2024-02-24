-- Populate Supplier table
INSERT INTO Supplier (Supplier_ID, Supplier_Name, Phone_Number) VALUES
(1, 'Supplier1', '123-456-7890'),
(2, 'Supplier2', '987-654-3210'),
(3, 'Supplier3', '555-555-5555'),
(4, 'Supplier4', '111-222-3333'),
(5, 'Supplier5', '444-444-4444');

-- Populate Company table
INSERT INTO Company (Company_ID, Company_Name, Join_Date, No_Of_Helmets, No_Of_Employees, Cloud_Storage_Renew_Date) VALUES
(1, 'Company1', '2023-01-01', 100, 50, '2024-01-01'),
(2, 'Company2', '2023-02-01', 80, 40, '2024-02-01'),
(3, 'Company3', '2023-03-01', 120, 60, '2024-03-01'),
(4, 'Company4', '2023-04-01', 150, 70, '2024-04-01'),
(5, 'Company5', '2023-05-01', 200, 100, '2024-05-01');

-- Populate Employee table
INSERT INTO Employee (Employee_ID, Name, Position, Authorization_Level, Telephone_No, Company_ID) VALUES
(1, 'Employee1', 'Manager', 3, '111-111-1111', 1),
(2, 'Employee2', 'Supervisor', 2, '222-222-2222', 1),
(3, 'Employee3', 'Worker', 1, '333-333-3333', 2),
(4, 'Employee4', 'Worker', 1, '444-444-4444', 2),
(5, 'Employee5', 'Worker', 1, '555-555-5555', 3);

-- Populate Helmet table
INSERT INTO Helmet (Helmet_ID, Location, Helmet_Unique_Code, Employee_ID) VALUES
(1, 'Location1', 'ABC123', 1),
(2, 'Location2', 'DEF456', 2),
(3, 'Location3', 'GHI789', 3),
(4, 'Location4', 'JKL012', 4),
(5, 'Location5', 'MNO345', 5);

-- Populate Time Log table
INSERT INTO Time_Log (Log_ID, Employee_ID, Start_Time, End_Time) VALUES
(1, 1, '2023-01-01 08:00:00', '2023-01-01 17:00:00'),
(2, 2, '2023-01-01 09:00:00', '2023-01-01 18:00:00'),
(3, 3, '2023-01-01 08:30:00', '2023-01-01 16:30:00'),
(4, 4, '2023-01-01 07:00:00', '2023-01-01 15:00:00'),
(5, 5, '2023-01-01 10:00:00', '2023-01-01 19:00:00');

-- Populate Salary Calculation table
INSERT INTO Salary_Calculation (Calculation_ID, Employee_ID, Total_Hours, Hourly_Rate, Total_Salary) VALUES
(1, 1, 8, 15.00, 120.00),
(2, 2, 9, 14.00, 126.00),
(3, 3, 8, 12.00, 96.00),
(4, 4, 8, 11.00, 88.00),
(5, 5, 9, 13.00, 117.00);

-- Populate Emergency Alarm System table
INSERT INTO Emergency_Alarm_System (Alarm_ID, Type, Location, Helmet_ID, Employee_ID) VALUES
(1, 'Fire', 'Location1', 1, 1),
(2, 'Gas Leak', 'Location2', 2, 2),
(3, 'Fall', 'Location3', 3, 3),
(4, 'Injury', 'Location4', 4, 4),
(5, 'Fire', 'Location5', 5, 5);

-- Populate Employee Management System table
INSERT INTO Employee_Management_System (User_ID, Access_Level, Username, Password, Email_Address, Employee_ID, Company_ID) VALUES
(1, 3, 'user1', 'password1', 'user1@example.com', 1, 1),
(2, 2, 'user2', 'password2', 'user2@example.com', 2, 1),
(3, 1, 'user3', 'password3', 'user3@example.com', 3, 2),
(4, 1, 'user4', 'password4', 'user4@example.com', 4, 2),
(5, 1, 'user5', 'password5', 'user5@example.com', 5, 3);

-- Populate Fall Detection Event table
INSERT INTO Fall_Detection_Event (Fall_Detection_Event_ID, Location, Time_Stamp, Employee_ID, Helmet_ID) VALUES
(1, 'Location1', '2023-01-01 10:00:00', 1, 1),
(2, 'Location2', '2023-01-01 11:00:00', 2, 2),
(3, 'Location3', '2023-01-01 12:00:00', 3, 3),
(4, 'Location4', '2023-01-01 13:00:00', 4, 4),
(5, 'Location5', '2023-01-01 14:00:00', 5, 5);

-- Populate Gas Detection Event table
INSERT INTO Gas_Detection_Event (Gas_Detection_Event_ID, Location, Timestamp, Helmet_ID) VALUES
(1, 'Location1', '2023-01-01 10:30:00', 1),
(2, 'Location2', '2023-01-01 11:30:00', 2),
(3, 'Location3', '2023-01-01 12:30:00', 3),
(4, 'Location4', '2023-01-01 13:30:00', 4),
(5, 'Location5', '2023-01-01 14:30:00', 5);

-- Populate Construction Site table
INSERT INTO Construction_Site (Site_ID, Location, Company_ID) VALUES
(1, 'ConstructionSite1', 1),
(2, 'ConstructionSite2', 1),
(3, 'ConstructionSite3', 2),
(4, 'ConstructionSite4', 2),
(5, 'ConstructionSite5', 3);

-- Populate Materials table
INSERT INTO Materials (Material_ID, Type, Quantity, Supplier, Supplier_ID) VALUES
(1, 'Material1', 100, 'Supplier1', 1),
(2, 'Material2', 200, 'Supplier2', 2),
(3, 'Material3', 150, 'Supplier3', 3),
(4, 'Material4', 300, 'Supplier4', 4),
(5, 'Material5', 250, 'Supplier5', 5);

-- Populate Leaving table
INSERT INTO Leaving (Leaving_ID, Reason, Start_Date, End_Date) VALUES
(1, 'Vacation', '2023-01-01', '2023-01-10'),
(2, 'Sick Leave', '2023-02-01', '2023-02-05'),
(3, 'Maternity Leave', '2023-03-01', '2023-06-01'),
(4, 'Paternity Leave', '2023-04-01', '2023-04-10'),
(5, 'Personal Leave', '2023-05-01', '2023-05-02');


INSERT INTO Health_Monitoring_System (Vital_Sign, Heart_Rate, Helmet_ID)
VALUES 
    ('Normal', 75, 1),
    ('Normal', 70, 2),
    ('High', 90, 3),
    ('Normal', 80, 4),
    ('Low', 65, 5);
