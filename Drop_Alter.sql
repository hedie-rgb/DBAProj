-- DROP Ralations, FOREIGN KEY -> ALTER

ALTER TABLE User_Room
DROP CONSTRAINT  FK_UserRoompassengerPicker;

ALTER TABLE reserve
DROP CONSTRAINT  FK_ReservePassengerPicker;

ALTER TABLE cancelation_Room
DROP CONSTRAINT  FK_cancelationRoom;

ALTER TABLE cancelation_Room
DROP CONSTRAINT  FK_cancelationRoomcancelation;

ALTER TABLE cancelation_Ticket
DROP CONSTRAINT  FK_cancelationTicketTicket;

ALTER TABLE cancelation_Ticket
DROP CONSTRAINT  FK_cancelationTicketcancelation;

ALTER TABLE User_cancelation
DROP CONSTRAINT  FK_Usercancelation;

ALTER TABLE User_cancelation
DROP CONSTRAINT  FK_UsercancelationUser;

ALTER TABLE TempCode
DROP CONSTRAINT  FK_TempCodeLogin;

ALTER TABLE Login
DROP CONSTRAINT  FK_LoginUser;

ALTER TABLE Flight_Airport
DROP CONSTRAINT  FK_FlightAirportAirport;

ALTER TABLE Flight_Airport
DROP CONSTRAINT  FK_FlightAirportFlight;

ALTER TABLE User_Room
DROP CONSTRAINT  FK_UserRoomRoom;

ALTER TABLE User_Room
DROP CONSTRAINT  FK_UserRoomUser;

ALTER TABLE reserve
DROP CONSTRAINT  FK_reserveUser;

ALTER TABLE Ticket
DROP CONSTRAINT  FK_Ticketreserve;

ALTER TABLE Seat
DROP CONSTRAINT  FK_SeatSeatType;

ALTER TABLE Registration
DROP CONSTRAINT  FK_RegistrationUser;

ALTER TABLE [User Account]
DROP CONSTRAINT  FK_UserAccountBalance;

ALTER TABLE [Account Info]
DROP CONSTRAINT  FK_AccountInfoMyTravels;

ALTER TABLE [Account Info]
DROP CONSTRAINT  FK_AccountInfoTransactions;

ALTER TABLE [Account Info]
DROP CONSTRAINT  FK_AccountInfoUserAccount;

ALTER TABLE [User Account]
DROP CONSTRAINT  FK_UserAccountUser

ALTER TABLE TempCode
DROP CONSTRAINT  FK_TempCodeRegistration;

ALTER TABLE City
DROP CONSTRAINT  FK_CityLocation;

ALTER TABLE Bus_Terminal
DROP CONSTRAINT  FK_BusTerminalLocation;

ALTER TABLE [Ground Route_Bus_Terminal]
DROP CONSTRAINT  FK_GroundRouteBusTerminalBusTerminal;

ALTER TABLE [Ground Route_Bus_Terminal]
DROP CONSTRAINT  FK_GroundRouteBusTerminalGroundRoute;

ALTER TABLE [Bus Reservation_Ground Route]
DROP CONSTRAINT  FK_BusReservationGroundRouteGroundRoute;

ALTER TABLE [Bus Reservation_Ground Route]
DROP CONSTRAINT  FK_BusReservationGroundRouteBusReservation;

ALTER TABLE Accommodation_Hotel
DROP CONSTRAINT  FK_AccommodationHotelHotel;

ALTER TABLE Accommodation_Hotel
DROP CONSTRAINT  FK_AccommodationHotelAccommodation;

ALTER TABLE Hotel
DROP CONSTRAINT  FK_HotelLocation;

ALTER TABLE Popular_Palce
DROP CONSTRAINT  FK_PopularPalceLocation;

ALTER TABLE Hotel
DROP CONSTRAINT  FK_HotelPriceRange;

ALTER TABLE Room
DROP CONSTRAINT  FK_RoomRoomType;

ALTER TABLE [Credit Increament]
DROP CONSTRAINT  FK_CreditIncreamentUser;

ALTER TABLE Dependaent
DROP CONSTRAINT  FK_DependaentUser;

ALTER TABLE [User Account]
DROP CONSTRAINT  FK_UserAccountBankAcount;

ALTER TABLE [Bank Account]
DROP CONSTRAINT  FK_BankAccountBalance;

ALTER TABLE [Credit Increament]
DROP CONSTRAINT  FK_CreditIncreamentBalance;

ALTER TABLE [Credit Increament]
DROP CONSTRAINT  FK_CreditIncreamentAccountInfo;

ALTER TABLE Login
DROP CONSTRAINT  FK_LoginAccountInfo;

ALTER TABLE Registration
DROP CONSTRAINT  FK_RegistrationAccountInfo;

ALTER TABLE reserve
DROP CONSTRAINT  FK_ReserveTransport;

-- TABLES, CREATE, ADD/DROP COLUMNS

CREATE TABLE between_terminals (
BusReservationTransportnumber int NOT NULL, 
Bus_Terminalid int NOT NULL, 
PRIMARY KEY (BusReservationTransportnumber, Bus_Terminalid)
);

Alter TABLE Cancelation
ADD Userid int, 
	refund int DEFAULT 0 NOT NULL, 
	_date date, 
	_time time(7), 
	Transportnumber int NULL, 
	Hotelid int NULL;
Alter TABLE Cancelation
DROP COLUMN Ticketcode;

Alter TABLE City
DROP COLUMN Locationid;

Alter TABLE Flight
ADD Airportcode_origin int, 
	Airportcode_destination int;
Alter TABLE Flight	
DROP COLUMN rate;

Alter TABLE Flight_Legs
DROP COLUMN number, countryid, cityid;

Alter TABLE Hotel
DROP COLUMN Locationid;
Alter TABLE Hotel
ADD accomondation_type nvarchar(50) NULL, 
	rules text NULL, 
	Cityid int; 

CREATE TABLE Hotel_Reservation (
id int IDENTITY(1,1) PRIMARY KEY,
checkin_date date NULL, 
checkout_date date NULL, 
_date date NOT NULL, 
number_of_baby int DEFAULT 0 NULL, 
number_of_adult int DEFAULT 0 NULL, 
number_of_children int DEFAULT 0 NULL, 
Userid int NOT NULL, 
Roomcode int NOT NULL 
);

ALTER TABLE Popular_Palce
DROP COLUMN Locationid;
ALTER TABLE Popular_Palce
ADD Cityid int;

ALTER TABLE Room
ADD _Type nvarchar(50), 
	num_of_bedrooms int,
	_number int;
ALTER TABLE Room
DROP COLUMN Room_Typeid

ALTER TABLE Seat
ADD  seat_number int,
	 ticket_number int,
	 cost int,
	_type nvarchar(25);
ALTER TABLE Seat
DROP COLUMN Seat_Typeid

ALTER TABLE Transactions
ADD Userid int;


CREATE TABLE Transport_Reservation (
id int IDENTITY(1,1) PRIMARY KEY,
rules text  NULL, 
_date date NOT NULL, 
number_of_adult int DEFAULT 0 NULL, 
number_of_children int DEFAULT 0 NULL, 
Userid int NOT NULL, 
Seatcode int NOT NULL 
);

ALTER TABLE _user
DROP COLUMN Registrationid
ALTER TABLE _user
ADD _password nvarchar(50),
	balance int DEFAULT 0 NULL,
	registration_date date,
	account_number nvarchar(25);

-- DROP TABLES
	
DROP TABLE  IF EXISTS Balance, [Bank Account], [User Account],
_Location, Price_Range, reserve, Accommodation,
Accommodation_Hotel, [My Travels], [Account Info],
[Ground Route], [Bus Reservation_Ground Route], Ticket, 
[Credit Increament], Dependaent, [Ground Route_Bus_Terminal],  
Login, Registration, Room_Type, Seat_Type, TempCode,
User_Room, passenger_picker, cancelation_Room, cancelation_Ticket,
User_cancelation, Flight_Airport;



-- ADD new Ralations, FOREIGN KEY -> ALTER

ALTER TABLE Hotel 
ADD CONSTRAINT FK_HotelCity
FOREIGN KEY (Cityid) REFERENCES City (id);

ALTER TABLE Transactions 
ADD CONSTRAINT FK_TransactionUser
FOREIGN KEY (Userid) REFERENCES _user (id);

ALTER TABLE Transport_Reservation 
ADD CONSTRAINT FK_TansportReservationUser
FOREIGN KEY (Userid) REFERENCES _user (id);

ALTER TABLE Hotel_Reservation 
ADD CONSTRAINT FK_HotelReservationRoom 
FOREIGN KEY (Roomcode) REFERENCES Room (code);

ALTER TABLE Popular_Palce 
ADD CONSTRAINT FK_PopularPalceCity
FOREIGN KEY (Cityid) REFERENCES City (id);

ALTER TABLE Flight 
ADD CONSTRAINT FK_FlightDestAirport
FOREIGN KEY (Airportcode_destination) REFERENCES Airport (code);

ALTER TABLE Flight
ADD CONSTRAINT FK_FlightOriginAirport
FOREIGN KEY (Airportcode_origin) REFERENCES Airport (code);

ALTER TABLE Cancelation 
ADD CONSTRAINT FK_CancelationHotel
FOREIGN KEY (Hotelid) REFERENCES Hotel (id);

ALTER TABLE Cancelation 
ADD CONSTRAINT FK_CancelationTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

ALTER TABLE Cancelation 
ADD CONSTRAINT FK_CancelationUser
FOREIGN KEY (Userid) REFERENCES _user (id);

ALTER TABLE between_terminals 
ADD CONSTRAINT FK_BetweenTermainalBusTerminal
FOREIGN KEY (Bus_Terminalid) REFERENCES Bus_Terminal (id);

ALTER TABLE between_terminals 
ADD CONSTRAINT FK_BetweenTerminalBus
FOREIGN KEY (BusReservationTransportnumber) REFERENCES Bus (Transportnumber);

ALTER TABLE Transport_Reservation 
ADD CONSTRAINT FK_TransportReservationSeat
FOREIGN KEY (Seatcode) REFERENCES Seat (code);

EXEC sp_rename 'Seat', 'Ticket';




