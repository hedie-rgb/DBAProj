CREATE TABLE Airport (
code int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(50) NOT NULL, 
Cityid int NOT NULL
);

CREATE TABLE between_terminals (
BusReservationTransportnumber int NOT NULL, 
Bus_Terminalid int NOT NULL, 
PRIMARY KEY (BusReservationTransportnumber, Bus_Terminalid)
);

CREATE TABLE Bus (
Transportnumber int PRIMARY KEY,
Bus_Origin_Terminalid int NOT NULL, 
Bus_Destination_Terminalid int NOT NULL
);

CREATE TABLE Bus_Terminal (
id int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(50) NOT NULL, 
Cityid int NOT NULL
);

CREATE TABLE Cancelation (
id int IDENTITY(1,1) PRIMARY KEY,
rules text NULL, 
Userid int NOT NULL, 
refund int DEFAULT 0 NOT NULL, 
_date date NOT NULL, 
_time time(7) NOT NULL, 
Transportnumber int NULL, 
Hotelid int NULL, 
);

CREATE TABLE City (
id int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(50) NOT NULL, 
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
name nvarchar(50) NOT NULL 
);

CREATE TABLE Country (
id int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(50) NOT NULL
);

CREATE TABLE Domestic (
FlightTransportnumber int PRIMARY KEY
);

CREATE TABLE Flight (
Transportnumber int PRIMARY KEY,
class nvarchar(50) NOT NULL, 
amount_of_allowed_baggage int NOT NULL, 
Airportcode_origin int NOT NULL, 
Airportcode_destination int NOT NULL, 
);

CREATE TABLE Flight_Legs (
code int IDENTITY(1,1) PRIMARY KEY,
duration time(7) NOT NULL, 
OverseasFlightTransportnumber int NOT NULL, 
Airportcode int NOT NULL, 
);

CREATE TABLE Hotel (
id int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(50) NOT NULL, 
about text NULL, 
stars int NOT NULL, 
accomondation_type nvarchar(50) NULL, 
rules text NULL, 
Cityid int NOT NULL, 
);

CREATE TABLE Hotel_Facility (
id int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(50) NOT NULL, 
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
DomesticFlightTransportnumber int NULL, 
OverseasFlightTransportnumber int NULL, 
);

CREATE TABLE Overseas (
FlightTransportnumber int PRIMARY KEY
);

CREATE TABLE Popular_Palce (
id int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(50) NOT NULL, 
Cityid int NOT NULL
);

CREATE TABLE Popularity (
id int IDENTITY(1,1) PRIMARY KEY,
score numeric(2, 1) NOT NULL, 
Userid int NOT NULL, 
Hotelid int NOT NULL
);

CREATE TABLE Room (
code int IDENTITY(1,1) PRIMARY KEY,
meal nvarchar(50) NOT NULL, 
Hotelid int NOT NULL, 
_Type nvarchar(50) NOT NULL, 
available bit NOT NULL, 
cost_per_night int NOT NULL,
num_of_bedrooms int NOT NULL,
_number int NOT NULL
);

CREATE TABLE Ticket (
code int IDENTITY(1,1) PRIMARY KEY,
seat_number int NOT NULL,
ticket_number int NOT NULL,
_status bit DEFAULT '1' NOT NULL, 
Transportnumber int NOT NULL, 
_type nvarchar(25) NOT NULL,
cost int NOT NULL
);


CREATE TABLE Transactions (
id int IDENTITY NOT NULL, 
amount int NULL, 
_type nvarchar(50) NULL, 
_date date NULL, 
Userid int NOT NULL, 
PRIMARY KEY (id)
);

CREATE TABLE Transport (
_number int IDENTITY(1,1) PRIMARY KEY,
time time(7) NOT NULL, 
_date date NOT NULL, 
duration time(7) NOT NULL, 
capacity int NOT NULL, 
origin_city_id int NOT NULL, 
destination_city_id int NOT NULL, 
);

CREATE TABLE Transport_Company (
Transportnumber int NOT NULL, 
Companyid int NOT NULL, 
PRIMARY KEY (Transportnumber, Companyid)
);

CREATE TABLE Transport_Reservation (
id int IDENTITY(1,1) PRIMARY KEY,
rules text  NULL, 
_date date NOT NULL, 
number_of_adult int DEFAULT 0 NULL, 
number_of_children int DEFAULT 0 NULL, 
Userid int NOT NULL, 
Ticketcode int NOT NULL 
);

CREATE TABLE Two_Way (
id int IDENTITY(1,1) PRIMARY KEY,
OverseasFlightTransportnumber1 int NULL, 
OverseasFlightTransportnumber2 int NULL, 
DomesticFlightTransportnumber1 int NULL, 
DomesticFlightTransportnumber2 int NULL
);

CREATE TABLE _user (
id int IDENTITY(1,1) PRIMARY KEY,
MobileNumber nvarchar(15) NOT NULL, 
email varchar(50) NULL, 
DateOfBirth date NULL, 
TelephoneNumber nvarchar(15) NULL, 
SSN nchar(10) NULL UNIQUE, 
gender char(1) NULL, 
PassportNumber nchar(9) NULL UNIQUE, 
first_name nvarchar(25) NULL, 
last_name nvarchar(25) NULL, 
_password nvarchar(50) NOT NULL, 
balance int DEFAULT 0 NULL, 
registration_date date NOT NULL,
account_number nvarchar(25) NULL
);


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
ADD CONSTRAINT FK_HotelReservationUser 
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

ALTER TABLE Transport_Company 
ADD CONSTRAINT FK_TransportComapanyCompany
FOREIGN KEY (Companyid) REFERENCES Company (id);

ALTER TABLE Transport_Company 
ADD CONSTRAINT FK_TransportCompanyTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

ALTER TABLE Bus 
ADD CONSTRAINT FK_BusBusDestTerminal
FOREIGN KEY (Bus_Destination_Terminalid) REFERENCES Bus_Terminal (id);

ALTER TABLE Bus 
ADD CONSTRAINT FK_BusBusOriginTerminal
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
ADD CONSTRAINT FK_MultiWayOverseasMultiWay
FOREIGN KEY (MultiWayid) REFERENCES Multi_Way (id);

ALTER TABLE Two_Way 
ADD CONSTRAINT FK_TwoWayDomestic1
FOREIGN KEY (DomesticFlightTransportnumber1) REFERENCES Domestic (FlightTransportnumber);

ALTER TABLE Two_Way 
ADD CONSTRAINT FK_TwoWayOverseas1 
FOREIGN KEY (OverseasFlightTransportnumber1) REFERENCES Overseas (FlightTransportnumber);

ALTER TABLE Bus_Terminal 
ADD CONSTRAINT FK_BusTerminalCity 
FOREIGN KEY (Cityid) REFERENCES City (id);

ALTER TABLE Ticket 
ADD CONSTRAINT FK_TicketTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

ALTER TABLE Flight_Legs 
ADD CONSTRAINT FK_FlightLegsAirport
FOREIGN KEY (Airportcode) REFERENCES Airport (code);

ALTER TABLE Flight_Legs
ADD CONSTRAINT FK_FlightLegsOverseas
FOREIGN KEY (OverseasFlightTransportnumber) REFERENCES Overseas (FlightTransportnumber);

ALTER TABLE Two_Way 
ADD CONSTRAINT FK_TwoWayOverseas2
FOREIGN KEY (OverseasFlightTransportnumber2) REFERENCES Overseas (FlightTransportnumber);

ALTER TABLE Two_Way 
ADD CONSTRAINT FK_TwoWayDomestic2
FOREIGN KEY (DomesticFlightTransportnumber2) REFERENCES Domestic (FlightTransportnumber);

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
ADD CONSTRAINT FK_TransportDestCity 
FOREIGN KEY (destination_city_id) REFERENCES City (id);

ALTER TABLE Transport 
ADD CONSTRAINT FK_TransportOriginCity 
FOREIGN KEY (origin_city_id) REFERENCES City (id);

ALTER TABLE Overseas 
ADD CONSTRAINT FK_OverseasFlight
FOREIGN KEY (FlightTransportnumber) REFERENCES Flight (Transportnumber);

ALTER TABLE Domestic 
ADD CONSTRAINT FK_DomesticFlight
FOREIGN KEY (FlightTransportnumber) REFERENCES Flight (Transportnumber);

ALTER TABLE Bus 
ADD CONSTRAINT FK_BusTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

ALTER TABLE Flight 
ADD CONSTRAINT FK_FlightTransport
FOREIGN KEY (Transportnumber) REFERENCES Transport (_number);

ALTER TABLE Transport_Reservation 
ADD CONSTRAINT FK_TransportReservationTicket
FOREIGN KEY (Ticketcode) REFERENCES Ticket (code);