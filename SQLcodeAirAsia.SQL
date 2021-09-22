CREATE TABLE `User` (
  Acc_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Username varchar(100) NOT NULL,
  Password varchar(100) NOT NULL,
  Email varchar(100) NOT NULL,
  Tel varchar(10) NOT NULL,
  Birthday date
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
---------------------------------------
CREATE TABLE `Airport` (
  Airport_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Airport_Name varchar(100) NOT NULL,
  Airport_type varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-------------------------------------------
CREATE TABLE `Route` (
  Route_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Route_Arrival varchar(100) NOT NULL,
  Route_Departure varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
----------------------------------------------
CREATE TABLE `Passenger_type` (
  PT_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  PT_Type varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--------------------------------------------------
CREATE TABLE `Bill` (
  Bill_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Bill_total varchar(100) NOT NULL,
  Bill_Datetime datetime
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
---------------------------------------------------
CREATE TABLE `Airplane` (
  Airplane_ID int(10) NOT NULL PRIMARY KEY,
  Airplane_Name varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
---------------------------------------------------
CREATE TABLE 'Booked'(
	Booked_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    Booked_price double,
    Acc_ID int,
    Bill_ID int,
    foreign key (Acc_ID) references user(Acc_ID),
    foreign key (Bill_ID) references Bill(Bill_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
---------------------------------------------------
CREATE TABLE 'Passenger'(
	P_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    P_Firstname varchar(100) NOT NULL,
    P_Lastname varchar(100) NOT NULL,
    P_Sex varchar(100) NOT NULL,
    P_date date,
    PT_ID int,
    Booked_ID int,
    foreign key (PT_ID) references Passenger_type(PT_ID),
    foreign key (Booked_ID) references Booked(Booked_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
---------------------------------------------------
CREATE TABLE Flight(
	Flight_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    Flight_time time NOT NULL,
    Flight_Price double NOT NULL,
    Flight_Type varchar(100) NOT NULL,
    Flight_date date NOT NULL,
    Routing_ID int,
    Airplane_ID int,
    foreign key (Routing_ID) references Routing(Routing_ID),
    foreign key (Airplane_ID) references Airplane(Airplane_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
---------------------------------------------------
CREATE TABLE Seat(
	Seat_ID int(10) NOT NULL PRIMARY KEY ,
    Seat_Type varchar(100) NOT NULL,
    Airplane_ID int,
    foreign key (Airplane_ID) references Airplane(Airplane_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
---------------------------------------------------
CREATE TABLE Ticket(
	Ticket_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    Flight_ID int,
    Booked_ID int,
    P_ID int,
    foreign key (Flight_ID) references Flight(Flight_ID),
    foreign key (Booked_ID) references Booked(Booked_ID),
    foreign key (P_ID) references Passenger(P_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
---------------------------------------------------
CREATE TABLE Food(
	Food_ID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    Food_Type varchar(100) NOT NULL,
    Food_Name varchar(100) NOT NULL,
    Ticket_ID int,
    foreign key (Ticket_ID) references Ticket(Ticket_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
---------------------------------------------------