DROP DATABASE IF EXISTS `sa46team5`;

CREATE SCHEMA `sa46team5` ;

USE `sa46team5` ;

CREATE TABLE `sa46team5`.`facility_type` (
  `typeID` VARCHAR(4) NOT NULL,
  `typeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`typeID`));


CREATE TABLE `sa46team5`.`facility` (
  `facilityID` INT NOT NULL AUTO_INCREMENT,
  `facilityName` VARCHAR(20) NOT NULL,
  `description` VARCHAR(200) NULL,
  `address` VARCHAR(45) NULL,
  `typeID` VARCHAR(4) NOT NULL,
  `isDamaged` TINYINT NOT NULL,
  `damageReason` VARCHAR(45) NULL,
  `isDeleted` TINYINT NOT NULL,
  PRIMARY KEY (`facilityID`),
  INDEX `FK_typeID_idx` (`typeID` ASC) VISIBLE,
  CONSTRAINT `FK_typeID`
    FOREIGN KEY (`typeID`)
    REFERENCES `sa46team5`.`facility_type` (`typeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE `sa46team5`.`users` (
  `userID` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  `address` VARCHAR(45) NULL,
  `phoneNumber` VARCHAR(20) NOT NULL,
  `dob` DATE NULL,
  `role` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `isDeleted` TINYINT NOT NULL,
  PRIMARY KEY (`userID`));



CREATE TABLE `sa46team5`.`booking` (
  `bookingID` INT NOT NULL AUTO_INCREMENT,
  `facilityID` INT NOT NULL,
  `userID` VARCHAR(20) NOT NULL,
  `start_Date` DATE NOT NULL,
  `end_Date` DATE NOT NULL,
  `isUnderMaintenance` TINYINT NOT NULL,
  `isCancel` TINYINT NOT NULL,
  PRIMARY KEY (`bookingID`),
  INDEX `FK_userID_idx` (`userID` ASC) VISIBLE,
  INDEX `FK_facilityID_idx` (`facilityID` ASC) VISIBLE,
  CONSTRAINT `FK_userID`
    FOREIGN KEY (`userID`)
    REFERENCES `sa46team5`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_facilityID`
    FOREIGN KEY (`facilityID`)
    REFERENCES `sa46team5`.`facility` (`facilityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



    /* INSERT QUERY */
INSERT INTO facility_type(typeId, typeName) 
VALUES 
  ('TT', 'Table Tennis');
/* INSERT QUERY */
INSERT INTO facility_type(typeId, typeName) 
VALUES 
  ('FB', 'Foot Ball');
/* INSERT QUERY */
INSERT INTO facility_type(typeId, typeName) 
VALUES 
  ('SP', 'Swimming Pool');
/* INSERT QUERY */
INSERT INTO facility_type(typeId, typeName) 
VALUES 
  ('BB', 'Basket Ball');
/* INSERT QUERY */
INSERT INTO facility_type(typeId, typeName) 
VALUES 
  ('BT', 'Badminton');
/* INSERT QUERY */
INSERT INTO facility_type(typeId, typeName) 
VALUES 
  ('BG', 'Board Games');
/* INSERT QUERY */
INSERT INTO facility_type(typeId, typeName) 
VALUES 
  ('MR', 'Meeting Room');
  
  /* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Apollo', '25 seats capacity', 'Level1,Wing B', 
    'MR', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Meeting Room2', 'This meeting room has capacity of 20 seats', 
    'Level2,WingC', 'MR', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Meeting Room3', 'This meeting room has capacity of 30 seats', 
    'Level3,Wing D', 'MR', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Meeting Room4', 'This meeting room has capacity of 20 seats', 
    'Level2,WingA', 'MR', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Table tennis1', 'Table dimension 12m* 6m', 
    'Level1,Wing C', 'TT', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Table tennis2', 'Table dimension 12m* 6m', 
    'Level1,Wing B', 'TT', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Table tennis3', 'Table dimension 10m* 5m', 
    'Level1,WingD', 'TT', 1, 'Net is damaged', 
    0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Table tennis4', 'Table dimension 12m* 6m', 
    'Level1,WingC', 'TT', 1, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Table tennis5', 'Table dimension 14m* 7m', 
    'Level3,WingA', 'TT', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Table tennis6', 'Table dimension 12m* 6m', 
    'Level4,WingC', 'TT', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Swimming pool1', 'Depth of 5 m', 
    'Level1,WingD', 'SP', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Swimming pool2', 'Depth of 10m', 
    'Level1,WingC', 'SP', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'BasketBall1', 'The court is 94 feet by 50feet', 
    'Level4,WingC', 'BB', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'BasketBall2', 'The court is 91.9 feet by 49.2feet', 
    'Level4,WingB', 'BB', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Badmintoncourt 1', 'This is indoor court', 
    'Level2,Wing C', 'BT', 1, 'Floor is damaged', 
    0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Badmintoncourt 2', 'This is outdoor court', 
    'Level2,WingB', 'BT', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Badmintoncourt 3', 'This is indoor court', 
    'Level3,WingC', 'BT', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Badmintoncourt 4', 'This is outdoor court', 
    'Level3,WingB', 'BT', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'FootBall Court', 'This football court has 90m* 70m dimension', 
    'Level1,Wing D', 'FB', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'Board Games Room1', 'Consists of carrom,chess,ping pong ball', 
    'Level3,WingA', 'BG', 0, '', 0
  );
/* INSERT QUERY */
INSERT INTO facility(
  facilityName, description, address, 
  typeID, isDamaged, damageReason, 
  isDeleted
) 
VALUES 
  (
    'BoardGames Room2', 'Consists of cards,chinese checkers,snakes and ladders', 
    'Level3,WingB', 'BG', 0, '', 0
  );
  
  
  
  
  /* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Antoinette1234', ' Antoinette Brooks', 
    'Antoinette@gmail.com', 'Clementi,Singapore', 
    98112233, '2018-05-01', 'Admin', 
    'jGxqBeBX', 0
  );
/* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Ira1234', ' Ira Love', 'Ira@gmail.com', 
    'Hougaung,Singapore', 98223344, 
    '2018-05-01', 'Member', 'b9tBbkm8', 
    0
  );
/* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Robin1234', ' Robin Cummings', 'Robin@gmail.com', 
    'Serangoon,Singapore', 98334455, 
    '2018-05-02', 'Admin', 'XxcN7Xkj', 
    0
  );
/* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Erin1234', ' Erin Griffin', 'Erin@gmail.com', 
    'JurongEast,Singapore', 98445566, 
    '2018-05-03', 'Member', '8R2z6df8', 
    1
  );
/* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Naomi1234', ' Naomi Payne', 'Naomi@gmail.com', 
    'Bishan,Singapore', 98556677, '2018-05-04', 
    'Member', 'MJXFuwha', 0
  );
/* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Shawn1234', ' Shawn Logan', 'Shawn@gmail.com', 
    'Ang Mo Kio,Singapore', 98667788, 
    '2018-05-05', 'Member', 'EZyWrfKg', 
    0
  );
/* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Eric1234', ' Eric Reyes', 'Eric@gmail.com', 
    'Tampanies,Singapore', 98778899, 
    '2018-05-06', 'Member', 'pRdCxzKY', 
    1
  );
/* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Abraham1234', ' Abraham Morris', 
    'Abraham@gmail.com', 'Bedok,Singapore', 
    98123456, '2018-05-07', 'Member', 
    'rQnYRz3L', 0
  );
/* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Alicia1234', ' Alicia Myers', 'Alicia@gmail.com', 
    'Marrymount,Singapore', 98345678, 
    '2018-05-08', 'Member', 'qAx4s43k', 
    0
  );
/* INSERT QUERY */
INSERT INTO users(
  userID, name, email, address, phoneNumber, 
  dob, role, password, isDeleted
) 
VALUES 
  (
    'Daniel1234', ' Daniel Pittman', 
    'Daniel@gmail.com', 'KentRidge,Singapore', 
    98654321, '2018-05-09', 'Member', 
    'C6XKpKNp', 0
  );
  
  
  
  /* INSERT QUERY */
INSERT INTO booking(
  facilityID, userID, start_Date, end_Date, 
  isUnderMaintenance, isCancel
) 
VALUES 
  (
    1, 'Antoinette1234', '2018-06-01', 
    '2018-06-01', 0, 0
  );
/* INSERT QUERY */
INSERT INTO booking(
  facilityID, userID, start_Date, end_Date, 
  isUnderMaintenance, isCancel
) 
VALUES 
  (
    12, 'Ira1234', '2018-06-02', '2018-06-02', 
    1, 0
  );
/* INSERT QUERY */
INSERT INTO booking(
  facilityID, userID, start_Date, end_Date, 
  isUnderMaintenance, isCancel
) 
VALUES 
  (
    13, 'Robin1234', '2018-06-03', '2018-06-03', 
    0, 0
  );
/* INSERT QUERY */
INSERT INTO booking(
  facilityID, userID, start_Date, end_Date, 
  isUnderMaintenance, isCancel
) 
VALUES 
  (
    20, 'Erin1234', '2018-06-04', '2018-06-05', 
    0, 0
  );
/* INSERT QUERY */
INSERT INTO booking(
  facilityID, userID, start_Date, end_Date, 
  isUnderMaintenance, isCancel
) 
VALUES 
  (
    6, 'Naomi1234', '2018-06-06', '2018-06-05', 
    0, 1
  );
  