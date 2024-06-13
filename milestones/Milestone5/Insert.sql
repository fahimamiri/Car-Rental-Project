USE carrental;
-- Booking Insert 
-- Delete all rows from the booking table
/*DELETE FROM booking WHERE booking_id > 0;*/

INSERT INTO booking(booking_id, booking_start_date, booking_end_date, payment, invoice_id)
VALUES
(1001, '2024-04-01', '2024-04-17', 'hold', 001),
(1002, '2024-05-10', '2024-05-15', 'paid',002),
(1003, '2024-06-20', '2024-06-25', 'hold',003),
(1004, '2024-07-03', '2024-07-10', 'pending',004),
(1005, '2024-08-15', '2024-08-20', 'paid',004);

-- Inserting values for customer 
INSERT INTO customer(customer_id, booking_id, invoice_id, reservation_id, feedback_id, vehicle_id, fullname, email, phone, address, dl)
VALUES(2001, 1001, 5001, 7001, 3001, 3001, 'John Doe', 'doe@example.com', '1234567890', '123 Main St,', 'DL123456'),
(2002, 1002, 5002, 7002, 9002, 3002, 'Jane Smith', 'smith@example.com', '1987654321', '456 Elm St',  'DL654321'),
(2004, 1004, 5004, 7004, 9004, 3004, 'Emily Brown', 'brown@example.com', '1555666777', '101 Pine St', 'DL456789'),
(2005, 1005, 5005, 7005, 9005, 3005, 'David Wilson', 'wilson@example.com', '1444333222', '202 Maple St', 'DL135790');


 -- Inserting values into feedback
 INSERT INTO feedback(feedback_id, vehicle_id, customer_id, Feedback_date, comments)
VALUES
    (9001, 3001, 2001, '2024-04-17', 'NA'),
    (9002, 3002, 2002, '2024-04-12', 'NA'),
    (9003, 3003, 2003, '2024-04-20', 'Hard time'),
    (9004, 3004, 2004, '2024-04-01', 'Easy'),
    (9005, 3005, 2005, '2024-04-04', 'Nice');

 -- Inserting values into Inspections
USE carrental;
INSERT INTO inspections(inspections_id, vehicle_id, inspection_date, inspection_comment)
VALUES
    (240401, 3001, '2024-01-22', 'pass'),
    (240402, 3002, '2024-02-10', 'pass'),
    (240403, 3003, '2024-05-11', 'pass'),
    (240404, 3004, '2024-04-11', 'pass'),
    (240405, 3005, '2024-05-10', 'pass');
    
    
     -- Inserting values into Insurance
    INSERT INTO insurance(insurance_id, vehicle_id, insurance_name, policy_num, start_date, exp_date, user_id, customer_id)
VALUES
    (1001, 3001, 'AAA', 'CAAC123456789', '2024-01-10', '2026-01-01', 1010, 2001),
    (1002, 3002, 'Farmers', 'FAM123456789', '2024-05-10', '2026-05-01', 1011, 2002),
    (1003, 3003, 'Freeway', 'FREE123456789', '2024-03-10', '2026-03-01', 1012, 2003),
    (1004, 3004, 'ABC', 'ABEAC123456789', '2024-04-10', '2026-04-01', 1013, 2004),
    (1005, 3005, 'AAA', 'CAAC123456189', '2024-07-10', '2026-07-01', 1014, 2005);
    
    
 -- Inserting values into Insurance
INSERT INTO invoice(invoice_id, vehcile_id, customer_id, reservation_id, invoice_date, total, paymentstatus)
VALUES
    (001, 3001, 2001, 7001, '2024-04-12', 582, 'confirm'),
    (002, 3002, 2002, 7002, '2024-06-12', 802, 'confirm'),
    (003, 3003, 2003, 7003, '2024-05-12', 545, 'confirm'),
    (004, 3004, 2004, 7004, '2024-03-11', 4582, 'confirm'),
    (005, 3005, 2005, 7005, '2024-05-12', 423, 'confirm');
    
    
     -- Inserting values into reservations
    
    USE carrental;

INSERT INTO reservation(reservation_id, customer_id, vehicle_id, start_date, end_date, location, total, status)
VALUES
(240401, 2001, 3001, '2024-04-12', '2024-06-06', 'Location A', 2587, 'confirmed'),
(240402, 2002, 3002, '2024-05-15', '2024-06-20', 'Location B', 1800, 'confirmed'),
(240403, 2003, 3003, '2024-06-25', '2024-07-05', 'Location C', 1200, 'pending'),
(240404, 2004, 3004, '2024-07-10', '2024-07-20', 'Location D', 1500, 'confirmed'),
(240405, 2005, 3005, '2024-08-01', '2024-08-10', 'Location E', 900, 'confirmed');



 -- Inserting values into Insurance
INSERT INTO maintenance(maintenance_id, vehcile_id, user_id, maintenance_date, description, feedback_id, invoice_id)
VALUES 
    (5555, 3001, 1010, '2024-04-09', 'regular maintenance', 9001, 1),
    (5556, 3002, 1012, '2024-08-13', 'regular maintenance', 9002, 2),
    (5557, 3003, 1013, '2024-06-28', 'regular maintenance', 9003, 3),
    (5558, 3004, 1014, '2024-04-02', 'regular maintenance', 9004, 4),
    (5559, 3005, 1015, '2024-02-14', 'regular maintenance',  9005, 5);

 -- Inserting values into Inventories

INSERT INTO inventories(inventories_id, vehicle_id, make, model, year, vin, mileage, location, user_id)
VALUES
    (2001, 3001, 'Toyota', 'Camry', 2022, 'ABC123', 50000, 'Location A', 1010),
    (2002, 3002, 'Honda', 'Accord', 2020, 'DEF456', 60000, 'Location B', 1012),
    (2003, 3003, 'Ford', 'Fusion', 2019, 'GHI789', 45000, 'Location C', 1013),
    (2004, 3004, 'Chevrolet', 'Malibu', 2021, 'JKL012', 55000, 'Location D', 1014),
    (2005, 3005, 'Nissan', 'Altima', 2018, 'MNO345', 70000, 'Location E', 105);
    
 -- Inserting values into user
INSERT INTO user(user_id, username, password, email, phone)
VALUES
    (1010, 'fahimamiri', 'password1', 'fmiri@example.com', '1234567890'),
    (1011, 'joel', 'password2', 'joel@example.com', '1987654321'),
    (1012, 'john', 'password3', 'john@example.com', '1122334455'),
    (1013, 'smith', 'password4', 'smith@example.com', '1555666777'),
    (1014, 'kamal', 'password5', 'kamal@example.com', '1444333222');
    
 -- Inserting values into vehicle
INSERT INTO vehicle(vehicle_id, make, model, mileage, vin, year, inspections_id, insurance_id, inventories_id, invoice_id, maintenance_id, user_id)
VALUES
    (3001, 'Toyota', 'Camry', 50000, 'ABC123', 2022, 240401, 1001, 2001, 1, 5555, 1010),
    (3002, 'Honda', 'Accord', 60000, 'DEF456', 2020, 240402, 1002, 2002, 2, 5556, 1011),
    (3003, 'Ford', 'Fusion', 45000, 'GHI789', 2019, 240403, 1003, 2003, 3, 5557, 1012),
    (3004, 'Chevrolet', 'Malibu', 55000, 'JKL012', 2021, 240404, 1004, 2004, 4, 5558, 1013),
    (3005, 'Nissan', 'Altima', 70000, 'MNO345', 2018, 240405, 1005, 2005, 5, 5559, 1014);
   