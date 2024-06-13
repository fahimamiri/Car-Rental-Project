USE carrental;

/*INSERT INTO `carrental`.`VehicleInventory` (`vehicleInventory_id`, `make`, `Model`, `year`, `color`, `mileage`, `RegistrationExpires`, `price`, `fuel_tyep`, `transmission`, `VIN`, `loc_id`)
VALUES
  (1001, 'Toyota', 'Corolla', 2021, 'Red', 20000, '2024-09-30', '51523', 'GAS', 'AUTO', 'XYZ789ABC123', 1),
  (1002, 'Honda', 'Civic', 2020, 'Blue', 15000, '2024-11-15', '25823', 'EV', 'AUTO', 'DEF456GHI789', 2),
  (1003, 'Ford', 'Mustang', 2023, 'Black', 1000, '2025-02-28', '45123', 'GAS', 'AUTO', 'LMN123OPQ456', 3),
  (1004, 'Landrover', 'Discovery', 2021, 'Red', 20000, '2024-09-30', '35123', 'GAS', 'AUTO', 'XYZ789ABC123', 4),
  (1005, 'Honda', 'Civic', 2020, 'Blue', 15000, '2025-11-15', '51213', 'EV', 'AUTO', 'DEF456GHI789', 5);*/
  
 /* INSERT INTO `carrental`.`user` (`user_id`, `name`, `email`, `phone`)
VALUES
  (1, 'MARK', 'MARK@Mail.com', '5103912564'),
  (2, 'SMITH', 'Smith@Mail.com', '5103912564'),
  (3, 'MIKE', 'MIKE@Mail.com', '5103912564'),
  (4, 'DIVED', 'DIVED@Mail.com', '5103912564'),
  (5, 'AMIRI', 'AMIRI@Mail.com', '5103912564');*/
  
  
  /*INSERT INTO `carrental`.`location` (`loc_id`, `location_name`, `address`, `contact`, `POC_name`, `Vehicle_id`)
VALUES
  (1, 'Location A', 'A ST Fremont CA', '5103951234', 'JAMAL', '1001'),
  (2, 'Location B', 'B ST Oakland CA', '5103951236', 'KAMAL', '1002'),
  (3, 'Location C', 'C ST ALameda CA', '51039512342', 'AJMAL' , '1003'),
  (4, 'Location A', 'A ST Fremont CAe', '5103951238', 'JAMAL', '1004'),
  (5, 'Location A', 'A ST Fremont CAe', '5103951237', 'JAMAL', '1005');
*/

/*
INSERT INTO `carrental`.`Insurance` (`insurance_id`, `vehicle_id`, `insurance_name`, `policy_num`, `start_date`, `end_date`, `premium_amount`)
VALUES
  (1, '1001', 'AAA', 'ABCD1234', '2024-01-01', '2024-06-01', 500.00),
  (2, '1002', 'GUICO', 'EFGH5678', '2024-02-01', '2024-07-01', 600.00),
  (3, '1003', 'AAA', 'IJKL9101', '2024-03-01', '2024-08-01', 700.00),
  (4, '1004', 'Farmers', 'MNOP1213', '2024-04-01', '2024-09-01', 800.00),
  (5, '1005', 'Freeway', 'QRST1415', '2024-05-01', '2024-10-01', 900.00);*/
  
  /*
  INSERT INTO `carrental`.`Booking` (`booking_id`, `res_id`, `vehicle_id`, `booking_date`, `payment_status`)
VALUES
(2400, 5, 1001, '2024-04-30', 'confirmed'),
(2401, 1, 1002, '2024-05-30', 'confirmed'),
(2402, 2, 1002, '2024-06-30', 'confirmed'),
(2403, 3, 1004, '2024-07-30', 'confirmed'),
(2405, 4, 1005, '2024-09-30', 'confirmed');
*/
  
 /* 
  USE carrental;

INSERT INTO `carrental`.`customer` (`customer_id`, `vehicle_id`, `res_id`, `fullname`, `emial`, `phone`, `address`, `DL`)
VALUES
(1, 1001, 101, 'John Doe', 'johndoe@example.com', '1234567890', '123 Main St, City, State', 'DL123456'),
(2, 1002, 102, 'Jane Smith', 'janesmith@example.com', '987654320', '456 Elm St, City, State', 'DL789012'),
(3, 1002, 103, 'Michael Johnson', 'michael@example.com', '555555555', '789 Oak St, City, State', 'DL345678'),
(4, 1004, 104, 'Sarah Wilson', 'sarah@example.com', '111222333', '321 Pine St, City, State', 'DL901234'),
(5, 1005, 105, 'Emily Brown', 'emily@example.com', '999887777', '987 Maple St, City, State', 'DL567890');
  
  */