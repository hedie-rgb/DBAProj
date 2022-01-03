CREATE TABLE Airport (
code int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL,
Cityid int NOT NULL
);

 -- CREATE TABLE between_terminals 
 /*
CREATE TABLE between_terminals (
BusReservationTransportnumber int NOT NULL, 
Bus_Terminalid int NOT NULL, 
PRIMARY KEY (BusReservationTransportnumber, Bus_Terminalid)
);
 */
 
CREATE TABLE Bus (
Transportnumber int PRIMARY KEY,
Bus_Origin_Terminalid int NOT NULL,
Bus_Destination_Terminalid int NOT NULL
);

CREATE TABLE Bus_Terminal (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL, 
Cityid int NOT NULL,
Locationid int NOT NULL
);
 
 /*
Alter Cancelation
ADD Userid int, 
	refund int DEFAULT 0 NOT NULL, 
	_date date, 
	_time time(7), 
	Transportnumber int NULL, 
	Hotelid int NULL;

Alter Cancelation
DROP COLUMN Ticketcode;

 */
CREATE TABLE Cancelation (
id int IDENTITY(1,1) PRIMARY KEY,
rules text NULL,
Ticketcode int NOT NULL
);

 /*
Alter City
DROP COLUMN Locationid;
 */
 
CREATE TABLE City (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL,
Locationid int NOT NULL,
Countryid int NOT NULL
);


CREATE TABLE _Comment (
id int IDENTITY(1,1) PRIMARY KEY,
_date date NOT NULL,
advantages text NULL,
disadvantages text NULL,
conclusion text NULL,
Userid int NOT NULL,
Hotelid int NOT NULL
);

CREATE TABLE Company (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL,
);

CREATE TABLE Country (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL,
);

CREATE TABLE Domestic (
FlightTransportnumber int PRIMARY KEY
);

/*
Alter Flight
ADD Airportcode_origin int, 
	Airportcode_destination int;
Alter Flight	
DROP COLUMN rate;
*/

CREATE TABLE Flight (
Transportnumber int PRIMARY KEY ,
_class nvarchar(50) NOT NULL,
rate int NOT NULL,
amount_of_allowed_baggage int NOT NULL
);

/*
ALTER TABLE Flight_Airport
DROP CONSTRAINT  FK_FlightAirportAirport;
ALTER TABLE Flight_Airport
DROP CONSTRAINT  FK_FlightAirportFlight;
*/
CREATE TABLE Flight_Airport (
Flightid int PRIMARY KEY ,
Airportcode int NOT NULL,
FlightTransportnumber int NOT NULL
);

/*
Alter Flight_Legs
DROP COLUMN number, countryid, cityid;
*/
CREATE TABLE Flight_Legs (
code int IDENTITY(1,1) PRIMARY KEY,
duration time(7) NOT NULL,
number int NOT NULL,
OverseasFlightTransportnumber int NOT NULL,
Countryid int NOT NULL,
Cityid int NOT NULL,
Airportcode int NOT NULL
);

/*
Alter Hotel
DROP COLUMN Locationid;
Alter Hotel
ADD accomondation_type nvarchar(50) NULL, 
	rules text NULL, 
	Cityid int; 
*/

CREATE TABLE Hotel (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL,
about text NULL,
stars int NOT NULL,
Locationid int NOT NULL,
Price_Rangeid int NOT NULL
);


CREATE TABLE Hotel_Facility (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL
);

CREATE TABLE Hotel_Hotel_Facility (
Hotelid int NOT NULL,
Hotel_Facilityid int NOT NULL,
PRIMARY KEY (Hotelid, Hotel_Facilityid)
);

CREATE TABLE Hotel_Popular_Palce (
Hotelid int NOT NULL,
Popular_Palceid int NOT NULL,
PRIMARY KEY (Hotelid, Popular_Palceid)
);


-- CREATE TABLE Hotel_Reservation
/*
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
*/

CREATE TABLE Multi_Way (
id int IDENTITY(1,1) PRIMARY KEY
);

CREATE TABLE MultiWay_Overseas (
MultiWayid int NOT NULL,
OverseasFlightTransportnumber int NOT NULL,
PRIMARY KEY (MultiWayid, OverseasFlightTransportnumber)
);

CREATE TABLE One_Way (
id int IDENTITY(1,1) PRIMARY KEY,
DomesticFlightTransportnumber int NOT NULL,
OverseasFlightTransportnumber int NOT NULL
);

CREATE TABLE Overseas (
FlightTransportnumber int PRIMARY KEY
);

/*
ALTER Popular_Palce
DROP COLUMN Locationid;
ALTER Popular_Palce
ADD Cityid int;
*/

CREATE TABLE Popular_Palce (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL,
Locationid int NOT NULL
);

CREATE TABLE Popularity (
id int IDENTITY(1,1) PRIMARY KEY,
score numeric(2, 1) NULL,
Userid int NOT NULL,
Hotelid int NOT NULL
);

/*
ALTER Room
ADD _Type nvarchar(50), 
	num_of_bedrooms int,
	_number int;
ALTER Room
DROP COLUMN Room_Typeid
*/
CREATE TABLE Room (
code int IDENTITY(1,1) PRIMARY KEY,
meal nvarchar(50) NOT NULL,
Hotelid int NOT NULL,
Room_Typeid int NOT NULL,
available bit DEFAULT '1' NOT NULL, 
cost_per_night int NOT NULL
);

/*
ALTER Seat
ADD _number int,
	ticket_cost int,
	_type nvarchar(25);
ALTER Seat
DROP Seat_Typeid
*/
CREATE TABLE Seat (
code int IDENTITY(1,1) PRIMARY KEY,
_status bit DEFAULT '1' NOT NULL,
Transportnumber int NOT NULL,
Seat_Typeid int NOT NULL
);

/*
ALTER Transactions
ADD Userid int NOT NULL
*/
CREATE TABLE Transactions (
id int IDENTITY(1,1) PRIMARY KEY,
_type nvarchar(50) NOT NULL,
amount int NOT NULL,
_date date NOT NULL,
);

CREATE TABLE Transport (
_number int IDENTITY(1,1) PRIMARY KEY,
_time time(7) NOT NULL, 
_date date NOT NULL, 
duration time(7) NOT NULL,
capacity int NOT NULL,
origin_city_id int NOT NULL,
destination_city_id int NOT NULL
);

CREATE TABLE Transport_Company (
Transportnumber int NOT NULL,
Companyid int NOT NULL,
PRIMARY KEY (Transportnumber, Companyid)
);

-- CREATE TABLE Transport_Reservation
/*
CREATE TABLE Transport_Reservation (
id int IDENTITY(1,1) PRIMARY KEY,
rules text  NULL, 
_date date NOT NULL, 
number_of_adult int DEFAULT 0 NULL, 
number_of_children int DEFAULT 0 NULL, 
Userid int NOT NULL, 
Seatcode int NOT NULL 
);
*/

CREATE TABLE Two_Way (
id int IDENTITY(1,1) PRIMARY KEY,
DomesticFlightTransportnumber1 int NOT NULL,
OverseasFlightTransportnumber2 int NOT NULL,
OverseasFlightTransportnumber1 int NOT NULL,
DomesticFlightTransportnumber2 int NOT NULL
);

/*
ALTER _user
DROP COLUMN Registrationid
ALTER _user
ADD _password nvarchar(50),
	balance int DEFAULT 0 NULL,
	registration_date date,
	account_number nvarchar(25);
*/
CREATE TABLE _user (
id int IDENTITY(1,1) PRIMARY KEY,
MobileNumber nvarchar(15) NOT NULL,
email varchar(50) NULL,
Registrationid int NULL,
DateOfBirth date NOT NULL,
TelephoneNumber nvarchar(15) NULL,
SSN nchar(10) NULL UNIQUE,
gender char(1) NULL,
PassportNumber nchar(9) NULL,
first_name nvarchar(25) NULL,
last_name nvarchar(25) NULL,
);





-- These Tables Should but first should DELETE related ALTER - > FOREIGN KEY

-- DROP TABLE Balance;
CREATE TABLE Balance (
id int IDENTITY(1,1) PRIMARY KEY,
amount int NOT NULL,
);

-- DROP TABLE [Bank Account];

CREATE TABLE [Bank Account] (
id int IDENTITY(1,1) PRIMARY KEY,
[card number] int NULL,
[account number] nvarchar(20) NULL,
IBAN nvarchar(30) NULL,
Balanceid int NOT NULL
);

-- DROP TABLE [User Account];
CREATE TABLE [User Account] (
id int IDENTITY(1,1) PRIMARY KEY,
[Bank Accountid] int NOT NULL,
Userid int NOT NULL,
Balanceid int NOT NULL
);

-- DROP TABLE _Location;
CREATE TABLE _Location (
id int IDENTITY(1,1) PRIMARY KEY,
longitude float(10) NOT NULL,
latitude float(10) NOT NULL,
);

-- DROP TABLE Price_Range;
CREATE TABLE Price_Range (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL,
);

-- DROP TABLE reserve;
CREATE TABLE reserve (
id int IDENTITY(1,1) PRIMARY KEY,
Transportnumber int NOT NULL,
Userid int NOT NULL,
passenger_pickerid int NOT NULL
);

-- DROP TABLE Accommodation;
CREATE TABLE Accommodation (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL,
);

-- DROP TABLE Accommodation_Hotel;
CREATE TABLE Accommodation_Hotel (
Accommodationid int NOT NULL,
Hotelid int NOT NULL,
PRIMARY KEY (Accommodationid, Hotelid)
);

-- DROP TABLE [My Travels];
CREATE TABLE [My Travels] (
[order number] int IDENTITY(1,1) PRIMARY KEY,
[date] date NOT NULL,
[Account Infoid] int NOT NULL,
);

-- DROP TABLE [Account Info];
CREATE TABLE [Account Info] (
id int IDENTITY(1,1) PRIMARY KEY,
[User Acountid] int NOT NULL,
Transactionsid int NOT NULL,
[My Travelsorder number] int NOT NULL
);

-- DROP TABLE [Ground Route];
CREATE TABLE [Ground Route] (
code int IDENTITY(1,1) PRIMARY KEY
);

-- DROP TABLE [Bus Reservation_Ground Route] ;
CREATE TABLE [Bus Reservation_Ground Route] (
[Bus ReservationTransportnumber] int NOT NULL,
[Ground Routecode] int NOT NULL,
PRIMARY KEY ([Bus ReservationTransportnumber],[Ground Routecode])
);

-- DROP TABLE Ticket ;
CREATE TABLE Ticket (
code int IDENTITY(1,1) PRIMARY KEY,
[ticket status] bit NOT NULL,
type nvarchar(50) NOT NULL,
cost int NOT NULL,
reserveid int NOT NULL,
reserveTransportnumber int NOT NULL
);

-- DROP TABLE [Credit Increament] ;
CREATE TABLE [Credit Increament] (
id int IDENTITY(1,1) PRIMARY KEY,
[amount of current charge] int NOT NULL,
[Account Infoid] int NOT NULL,
Balanceid int NOT NULL,
[Usermobile number] varchar(255) NULL,
amount int NULL,
Userid int NULL
);

-- DROP TABLE Dependaent ;
CREATE TABLE Dependaent (
id int IDENTITY(1,1) PRIMARY KEY,
SSN nchar(10) NULL UNIQUE,
gender char(1) NULL,
[Date Of Birth] date NULL,
[passport number] nchar(9) NULL,
[mobile number] nvarchar(15) NULL,
Userid int NULL,
last_name nvarchar(25) NULL,
first_name nvarchar(25) NULL
);

-- DROP TABLE [Ground Route_Bus_Terminal] ; 
CREATE TABLE [Ground Route_Bus_Terminal] (
[Ground Routecode] int NOT NULL,
Bus_Terminalid int NOT NULL,
PRIMARY KEY ([Ground Routecode],Bus_Terminalid)
);

-- DROP TABLE Login ; 
CREATE TABLE Login (
id int IDENTITY(1,1) PRIMARY KEY,
password nvarchar(25) NOT NULL,
[Account Infoid] int NULL,
[mobile number] nvarchar(15) NULL UNIQUE,
email nvarchar(50) NULL UNIQUE,
Userid int NOT NULL
);

-- DROP TABLE Registration ; 
CREATE TABLE Registration (
id int IDENTITY(1,1) PRIMARY KEY,
[mobile number] nvarchar(15) NOT NULL UNIQUE,
password nvarchar(25) NOT NULL,
[Account Infoid] int NULL,
Userid int NOT NULL
);

-- DROP TABLE Room_Type ; 
CREATE TABLE Room_Type (
id int IDENTITY(1,1) PRIMARY KEY,
_name nvarchar(50) NOT NULL,
);

-- DROP TABLE Seat_Type ; 
CREATE TABLE Seat_Type (
id int IDENTITY(1,1) PRIMARY KEY,
_name varchar(50) NULL
);

-- DROP TABLE TempCode ; 
CREATE TABLE TempCode (
id int IDENTITY(1,1) PRIMARY KEY,
validate_duration time(7) NOT NULL,
Registrationid int NOT NULL,
Loginid int NOT NULL
);

-- DROP TABLE User_Room ; 
CREATE TABLE User_Room (
Userid int NOT NULL,
Roomcode int NOT NULL,
checkin_date date NULL,
checkout_date date NULL,
passenger_pickerid int NOT NULL,
PRIMARY KEY (Userid, Roomcode)
);

-- DROP TABLE passenger_picker ; 
CREATE TABLE passenger_picker (
id int IDENTITY(1,1) PRIMARY KEY,
age_category nvarchar(25) NOT NULL,
number int NOT NULL
);

-- DROP TABLE cancelation_Room ;
CREATE TABLE cancelation_Room (
cancelationid int NOT NULL,
Roomcode int NOT NULL,
PRIMARY KEY (cancelationid, Roomcode)
);

-- DROP TABLE cancelation_Ticket ;
CREATE TABLE cancelation_Ticket (
cancelationid int NOT NULL,
Ticketcode int NOT NULL,
PRIMARY KEY (cancelationid, Ticketcode)
);

-- DROP TABLE User_cancelation ;
CREATE TABLE User_cancelation (
Userid int NOT NULL,
cancelationid int NOT NULL,
[date] date NOT NULL,
time time(7) NOT NULL,
PRIMARY KEY (Userid, cancelationid)
);
----------------------------------------------------

/*
ALTER TABLE Hotel 
ADD CONSTRAINT FK_HotelCity
FOREIGN KEY (Cityid) REFERENCES City (id);
*/

/*
ALTER TABLE Transactions 
ADD CONSTRAINT FK_TransactionUser
FOREIGN KEY (Userid) REFERENCES _user (id);
*/

/*
ALTER TABLE Transport_Reservation 
ADD CONSTRAINT FK_TansportReservationUser
FOREIGN KEY (Userid) REFERENCES _user (id);
*/

/*
ALTER TABLE Hotel_Reservation 
ADD CONSTRAINT FK_HotelReservationRoom 
FOREIGN KEY (Roomcode) REFERENCES Room (code);
*/

/*
ALTER TABLE Popular_Palce 
ADD CONSTRAINT FK_PopularPalceCity
FOREIGN KEY (Cityid) REFERENCES City (id);
*/

/*
ALTER TABLE Flight 
ADD CONSTRAINT FK_FlightDestAirport
FOREIGN KEY (Airportcode_destination) REFERENCES Airport (code);
*/

/*
ALTER TABLE Flight
ADD CONSTRAINT FK_FlightOriginAirport
FOREIGN KEY (Airportcode_origin) REFERENCES Airport (code);
*/

/*
ALTER TABLE Cancelation 
ADD CONSTRAINT FK_CancelationHotel
FOREIGN KEY (Hotelid) REFERENCES Hotel (id);
*/

/*
ALTER TABLE Cancelation 
ADD CONSTRAINT FK_CancelationTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);
*/

/*
ALTER TABLE Cancelation 
ADD CONSTRAINT FK_CancelationUser
FOREIGN KEY (Userid) REFERENCES _user (id);
*/

/*
ALTER TABLE between_terminals 
ADD CONSTRAINT FK_BetweenTermainalBusTerminal
FOREIGN KEY (Bus_Terminalid) REFERENCES Bus_Terminal (id);
*/

/*
ALTER TABLE between_terminals 
ADD CONSTRAINT FK_BetweenTerminalBus
FOREIGN KEY (BusReservationTransportnumber) REFERENCES Bus (Transportnumber);
*/

ALTER TABLE Transport_Company
ADD CONSTRAINT FK_TransportCompanyCompany
FOREIGN KEY (Companyid) REFERENCES Company (id);

ALTER TABLE Transport_Company
ADD CONSTRAINT FK_TransportCompanyTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

ALTER TABLE Bus
ADD CONSTRAINT FK_BusReservationDestBusTerminal
FOREIGN KEY (Bus_Destination_Terminalid) REFERENCES Bus_Terminal (id);

ALTER TABLE Bus
ADD CONSTRAINT FK_BusReservationOriginBusTerminal
FOREIGN KEY (Bus_Origin_Terminalid) REFERENCES Bus_Terminal (id);

ALTER TABLE Airport
ADD CONSTRAINT FK_AirportCity
FOREIGN KEY (Cityid) REFERENCES City (id);

ALTER TABLE City
ADD CONSTRAINT FK_CityCountry
FOREIGN KEY (Countryid) REFERENCES Country (id);

ALTER TABLE MultiWay_Overseas
ADD CONSTRAINT FK_MultiWayOverseasOverseas
FOREIGN KEY (OverseasFlightTransportnumber) REFERENCES Overseas (FlightTransportnumber);

ALTER TABLE MultiWay_Overseas
ADD CONSTRAINT FK_MultiWayMultiWay
FOREIGN KEY (MultiWayid) REFERENCES Multi_Way (id);

ALTER TABLE Two_Way
ADD CONSTRAINT FK_TwoWayOverseas
FOREIGN KEY (OverseasFlightTransportnumber1) REFERENCES Overseas (FlightTransportnumber);

ALTER TABLE Two_Way
ADD CONSTRAINT FK_TwoWayDomestic
FOREIGN KEY (DomesticFlightTransportnumber1) REFERENCES Domestic (FlightTransportnumber);

ALTER TABLE Bus_Terminal
ADD CONSTRAINT FK_BusTerminalCity
FOREIGN KEY (Cityid) REFERENCES City (id);

ALTER TABLE Seat
ADD CONSTRAINT FK_SeatTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

ALTER TABLE Flight_Legs
ADD CONSTRAINT FK_FlightLegsAirport
FOREIGN KEY (Airportcode) REFERENCES Airport (code);

ALTER TABLE Flight_Legs
ADD CONSTRAINT FK_FlightLegsOverseas
FOREIGN KEY (OverseasFlightTransportnumber) REFERENCES Overseas (FlightTransportnumber);

ALTER TABLE Two_Way
ADD CONSTRAINT FK_TwoWayDomestic2
FOREIGN KEY (DomesticFlightTransportnumber2) REFERENCES Domestic (FlightTransportnumber);

ALTER TABLE Two_Way
ADD CONSTRAINT FK_TwoWayOverseas2
FOREIGN KEY (OverseasFlightTransportnumber2) REFERENCES Overseas (FlightTransportnumber);

ALTER TABLE One_Way
ADD CONSTRAINT FK_OneWayOverseas2
FOREIGN KEY (OverseasFlightTransportnumber) REFERENCES Overseas (FlightTransportnumber);

ALTER TABLE One_Way
ADD CONSTRAINT FK_OneWayDomestic2
FOREIGN KEY (DomesticFlightTransportnumber) REFERENCES Domestic (FlightTransportnumber);

ALTER TABLE Hotel_Hotel_Facility
ADD CONSTRAINT FK_HotelHotelFacilityHotelFacility
FOREIGN KEY (Hotel_Facilityid) REFERENCES Hotel_Facility (id);

ALTER TABLE Hotel_Hotel_Facility
ADD CONSTRAINT FK_HotelHotelFacilityHotel
FOREIGN KEY (Hotelid) REFERENCES Hotel (id);

ALTER TABLE _Comment
ADD CONSTRAINT FK_CommentHotel
FOREIGN KEY (Hotelid) REFERENCES Hotel (id);

ALTER TABLE _Comment
ADD CONSTRAINT FK_CommentUser
FOREIGN KEY (Userid) REFERENCES _user (id);

ALTER TABLE Popularity
ADD CONSTRAINT FK_PopularityHotel
FOREIGN KEY (Hotelid) REFERENCES Hotel (id);

ALTER TABLE Popularity
ADD CONSTRAINT FK_PopularityUser
FOREIGN KEY (Userid) REFERENCES _user (id);

ALTER TABLE Hotel_Popular_Palce
ADD CONSTRAINT FK_HotelPopularPalcePopularPalce
FOREIGN KEY (Popular_Palceid) REFERENCES Popular_Palce (id);

ALTER TABLE Hotel_Popular_Palce
ADD CONSTRAINT FK_HotelPopularPalceHotel
FOREIGN KEY (Hotelid) REFERENCES Hotel (id);

ALTER TABLE Room
ADD CONSTRAINT FK_RoomHotel
FOREIGN KEY (Hotelid) REFERENCES Hotel (id);

ALTER TABLE Transport
ADD CONSTRAINT FK_TransporDestCity
FOREIGN KEY (destination_city_id) REFERENCES City (id);

ALTER TABLE Transport
ADD CONSTRAINT FK_TransportOriginCity
FOREIGN KEY (origin_city_id) REFERENCES City (id);

ALTER TABLE Overseas
ADD CONSTRAINT FK_OverseasFlight
FOREIGN KEY (FlightTransportnumber) REFERENCES Flight (Transportnumber);

ALTER TABLE Domestic
ADD CONSTRAINT FK_DomesticTransportnumber
FOREIGN KEY (FlightTransportnumber) REFERENCES Flight (Transportnumber);

ALTER TABLE Bus
ADD CONSTRAINT FK_BusReservationTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

ALTER TABLE Flight
ADD CONSTRAINT FK_FlightTransportnumber
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

/*
ALTER TABLE Transport_Reservation 
ADD CONSTRAINT FK_TransportReservationSeat
FOREIGN KEY (Seatcode) REFERENCES Seat (code);
*/




-- These ALTER should DROP
/*
ALTER TABLE User_Room
DROP CONSTRAINT  FK_UserRoompassengerPicker;
*/
ALTER TABLE User_Room
ADD CONSTRAINT FK_UserRoompassengerPicker
FOREIGN KEY (passenger_pickerid) REFERENCES passenger_picker (id);

/*
ALTER TABLE reserve
DROP CONSTRAINT  FK_ReservePassengerPicker;
*/
ALTER TABLE reserve
ADD CONSTRAINT FK_ReservePassengerPicker
FOREIGN KEY (passenger_pickerid) REFERENCES passenger_picker (id);

/*
ALTER TABLE cancelation_Room
DROP CONSTRAINT  FK_cancelationRoom;
*/
ALTER TABLE cancelation_Room
ADD CONSTRAINT FK_cancelationRoom
FOREIGN KEY (Roomcode) REFERENCES Room (code);

/*
ALTER TABLE cancelation_Room
DROP CONSTRAINT  FK_cancelationRoomcancelation;
*/
ALTER TABLE cancelation_Room
ADD CONSTRAINT FK_cancelationRoomcancelation
FOREIGN KEY (cancelationid) REFERENCES cancelation (id);

/*
ALTER TABLE cancelation_Ticket
DROP CONSTRAINT  FK_cancelationTicketTicket;
*/
ALTER TABLE cancelation_Ticket
ADD CONSTRAINT FK_cancelationTicketTicket
FOREIGN KEY (Ticketcode) REFERENCES Ticket (code);

/*
ALTER TABLE cancelation_Ticket
DROP CONSTRAINT  FK_cancelationTicketcancelation;
*/
ALTER TABLE cancelation_Ticket
ADD CONSTRAINT FK_cancelationTicketcancelation
FOREIGN KEY (cancelationid) REFERENCES cancelation (id);

/*
ALTER TABLE User_cancelation
DROP CONSTRAINT  FK_Usercancelation;
*/
ALTER TABLE User_cancelation
ADD CONSTRAINT FK_Usercancelation
FOREIGN KEY (cancelationid) REFERENCES cancelation (id);

/*
ALTER TABLE User_cancelation
DROP CONSTRAINT  FK_UsercancelationUser;
*/
ALTER TABLE User_cancelation
ADD CONSTRAINT FK_UsercancelationUser
FOREIGN KEY (Userid) REFERENCES _user (id);

/*
ALTER TABLE TempCode
DROP CONSTRAINT  FK_TempCodeLogin;
*/
ALTER TABLE TempCode
ADD CONSTRAINT FK_TempCodeLogin
FOREIGN KEY (Loginid) REFERENCES Login (id);

/*
ALTER TABLE Login
DROP CONSTRAINT  FK_LoginUser;
*/
ALTER TABLE Login
ADD CONSTRAINT FK_LoginUser
FOREIGN KEY (Userid) REFERENCES _user (id);

/*
ALTER TABLE Flight_Airport
DROP CONSTRAINT  FK_FlightAirportAirport;
*/
ALTER TABLE Flight_Airport
ADD CONSTRAINT FK_FlightAirportAirport
FOREIGN KEY (Airportcode) REFERENCES Airport (code);

/*
ALTER TABLE Flight_Airport
DROP CONSTRAINT  FK_FlightAirportFlight;
*/
ALTER TABLE Flight_Airport
ADD CONSTRAINT FK_FlightAirportFlight
FOREIGN KEY (FlightTransportnumber) REFERENCES Flight (Transportnumber);

/*
ALTER TABLE User_Room
DROP CONSTRAINT  FK_UserRoomRoom;
*/
ALTER TABLE User_Room
ADD CONSTRAINT FK_UserRoomRoom
FOREIGN KEY (Roomcode) REFERENCES Room (code);

/*
ALTER TABLE User_Room
DROP CONSTRAINT  FK_UserRoomUser;
*/
ALTER TABLE User_Room
ADD CONSTRAINT FK_UserRoomUser
FOREIGN KEY (Userid) REFERENCES _user (id);

/*
ALTER TABLE reserve
DROP CONSTRAINT  FK_UserRoomUser;
*/
ALTER TABLE reserve
ADD CONSTRAINT FK_reserveUser
FOREIGN KEY (Userid) REFERENCES _user (id);

/*
ALTER TABLE Ticket
DROP CONSTRAINT  FK_Ticketreserve;
*/
ALTER TABLE Ticket
ADD CONSTRAINT FK_Ticketreserve
FOREIGN KEY (reserveid) REFERENCES reserve (id);

/*
ALTER TABLE Seat
DROP CONSTRAINT  FK_SeatSeatType;
*/
ALTER TABLE Seat
ADD CONSTRAINT FK_SeatSeatType
FOREIGN KEY (Seat_Typeid) REFERENCES Seat_Type (id);

/*
ALTER TABLE Registration
DROP CONSTRAINT  FK_RegistrationUser;
*/
ALTER TABLE Registration
ADD CONSTRAINT FK_RegistrationUser
FOREIGN KEY (Userid) REFERENCES _user (id);

/*
ALTER TABLE [User Account]
DROP CONSTRAINT  FK_UserAccountBalance;
*/
ALTER TABLE [User Account]
ADD CONSTRAINT FK_UserAccountBalance
FOREIGN KEY (Balanceid) REFERENCES Balance (id);

/*
ALTER TABLE [Account Info]
DROP CONSTRAINT  FK_AccountInfoMyTravels;
*/
ALTER TABLE [Account Info]
ADD CONSTRAINT FK_AccountInfoMyTravels
FOREIGN KEY ([My Travelsorder number]) REFERENCES [My Travels] ([order number]);

/*
ALTER TABLE [Account Info]
DROP CONSTRAINT  FK_AccountInfoTransactions;
*/
ALTER TABLE [Account Info]
ADD CONSTRAINT FK_AccountInfoTransactions
FOREIGN KEY (Transactionsid) REFERENCES Transactions (id);

/*
ALTER TABLE [Account Info]
DROP CONSTRAINT  FK_AccountInfoUserAccount;
*/
ALTER TABLE [Account Info]
ADD CONSTRAINT FK_AccountInfoUserAccount
FOREIGN KEY ([User Acountid]) REFERENCES [User Account] (id);

/*
ALTER TABLE [User Account]
DROP CONSTRAINT  FK_UserAccountUser;
*/
ALTER TABLE [User Account]
ADD CONSTRAINT FK_UserAccountUser
FOREIGN KEY (Userid) REFERENCES _user (id);

/*
ALTER TABLE TempCode
DROP CONSTRAINT  FK_TempCodeRegistration;
*/
ALTER TABLE TempCode
ADD CONSTRAINT FK_TempCodeRegistration
FOREIGN KEY (Registrationid) REFERENCES Registration (id);

/*
ALTER TABLE City
DROP CONSTRAINT  FK_CityLocation;
*/
ALTER TABLE City
ADD CONSTRAINT FK_CityLocation
FOREIGN KEY (Locationid) REFERENCES _Location (id);

/*
ALTER TABLE Bus_Terminal
DROP CONSTRAINT  FK_BusTerminalLocation;
*/
ALTER TABLE Bus_Terminal
ADD CONSTRAINT FK_BusTerminalLocation
FOREIGN KEY (Locationid) REFERENCES _Location (id);

/*
ALTER TABLE [Ground Route_Bus_Terminal]
DROP CONSTRAINT  FK_GroundRouteBusTerminalBusTerminal;
*/
ALTER TABLE [Ground Route_Bus_Terminal]
ADD CONSTRAINT FK_GroundRouteBusTerminalBusTerminal
FOREIGN KEY (Bus_Terminalid) REFERENCES Bus_Terminal (id);

/*
ALTER TABLE [Ground Route_Bus_Terminal]
DROP CONSTRAINT  FK_GroundRouteBusTerminalGroundRoute;
*/
ALTER TABLE [Ground Route_Bus_Terminal]
ADD CONSTRAINT FK_GroundRouteBusTerminalGroundRoute
FOREIGN KEY ([Ground Routecode]) REFERENCES [Ground Route] (code);

/*
ALTER TABLE [Bus Reservation_Ground Route]
DROP CONSTRAINT  FK_BusReservationGroundRouteGroundRoute;
*/
ALTER TABLE [Bus Reservation_Ground Route]
ADD CONSTRAINT FK_BusReservationGroundRouteGroundRoute
FOREIGN KEY ([Ground Routecode]) REFERENCES [Ground Route] (code);

/*
ALTER TABLE [Bus Reservation_Ground Route]
DROP CONSTRAINT  FK_BusReservationGroundRouteBusReservation;
*/
ALTER TABLE [Bus Reservation_Ground Route]
ADD CONSTRAINT FK_BusReservationGroundRouteBusReservation
FOREIGN KEY ([Bus ReservationTransportnumber]) REFERENCES Bus (Transportnumber);

/*
ALTER TABLE Accommodation_Hotel
DROP CONSTRAINT  FK_AccommodationHotelHotel;
*/
ALTER TABLE Accommodation_Hotel
ADD CONSTRAINT FK_AccommodationHotelHotel
FOREIGN KEY (Hotelid) REFERENCES Hotel (id);

/*
ALTER TABLE Accommodation_Hotel
DROP CONSTRAINT  FK_AccommodationHotelAccommodation;
*/
ALTER TABLE Accommodation_Hotel
ADD CONSTRAINT FK_AccommodationHotelAccommodation
FOREIGN KEY (Accommodationid) REFERENCES Accommodation (id);

/*
ALTER TABLE Hotel
DROP CONSTRAINT  FK_HotelLocation;
*/
ALTER TABLE Hotel
ADD CONSTRAINT FK_HotelLocation
FOREIGN KEY (Locationid) REFERENCES _Location (id);

/*
ALTER TABLE Popular_Palce
DROP CONSTRAINT  FK_PopularPalceLocation;
*/
ALTER TABLE Popular_Palce
ADD CONSTRAINT FK_PopularPalceLocation
FOREIGN KEY (Locationid) REFERENCES _Location (id);

/*
ALTER TABLE Hotel
DROP CONSTRAINT  FK_HotelPriceRange;
*/
ALTER TABLE Hotel
ADD CONSTRAINT FK_HotelPriceRange
FOREIGN KEY (Price_Rangeid) REFERENCES Price_Range (id);

/*
ALTER TABLE Room
DROP CONSTRAINT  FK_RoomRoomType;
*/
ALTER TABLE Room
ADD CONSTRAINT FK_RoomRoomType
FOREIGN KEY (Room_Typeid) REFERENCES Room_Type (id);

/*
ALTER TABLE [Credit Increament]
DROP CONSTRAINT  FK_CreditIncreamentUser;
*/
ALTER TABLE [Credit Increament]
ADD CONSTRAINT FK_CreditIncreamentUser
FOREIGN KEY (Userid) REFERENCES _user (id);

/*
ALTER TABLE Dependaent
DROP CONSTRAINT  FK_DependaentUser;
*/
ALTER TABLE Dependaent
ADD CONSTRAINT FK_DependaentUser
FOREIGN KEY (Userid) REFERENCES _user (id);

/*
ALTER TABLE [User Account]
DROP CONSTRAINT  FK_UserAccountBankAcount;
*/
ALTER TABLE [User Account]
ADD CONSTRAINT FK_UserAccountBankAcount
FOREIGN KEY ([Bank Accountid]) REFERENCES [Bank Account] (id);

/*
ALTER TABLE [Bank Account]
DROP CONSTRAINT  FK_BankAccountBalance;
*/
ALTER TABLE [Bank Account]
ADD CONSTRAINT FK_BankAccountBalance
FOREIGN KEY (Balanceid) REFERENCES Balance (id);

/*
ALTER TABLE [Credit Increament]
DROP CONSTRAINT  FK_CreditIncreamentBalance;
*/
ALTER TABLE [Credit Increament]
ADD CONSTRAINT FK_CreditIncreamentBalance
FOREIGN KEY (Balanceid) REFERENCES Balance (id);

/*
ALTER TABLE [Credit Increament]
DROP CONSTRAINT  FK_CreditIncreamentAccountInfo;
*/
ALTER TABLE [Credit Increament]
ADD CONSTRAINT FK_CreditIncreamentAccountInfo
FOREIGN KEY ([Account Infoid]) REFERENCES [Account Info] (id);

/*
ALTER TABLE Login
DROP CONSTRAINT  FK_LoginAccountInfo;
*/
ALTER TABLE Login
ADD CONSTRAINT FK_LoginAccountInfo
FOREIGN KEY ([Account Infoid]) REFERENCES [Account Info] (id);

/*
ALTER TABLE Registration
DROP CONSTRAINT  FK_RegistrationAccountInfo;
*/
ALTER TABLE Registration
ADD CONSTRAINT FK_RegistrationAccountInfo
FOREIGN KEY ([Account Infoid]) REFERENCES [Account Info] (id);

/*
ALTER TABLE reserve
DROP CONSTRAINT  FK_ReserveTransport;
*/
ALTER TABLE reserve
ADD CONSTRAINT FK_ReserveTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

