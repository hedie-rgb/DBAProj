INSERT INTO _user (MobileNumber, first_name, last_name, _password,balance, registration_date)
VALUES
('09122377137',N'علی', N'غلامی', 'ali20',0, '2021-05-23'), --1
('09107725412' ,N'زهره', N'رسولی', 'r326',0, '2020-02-09'), --2
('09161734675',N'الهام', N'نیایشی', 'en2023',0, '2021-11-17'), --3
('09101736070',N'رضا', N'ملکی', 'rm2455',0, '2021-10-01'), --4
('09013456901',N'مرتضی', N'مولایی','mm4590', 0, '2021-06-21'), --5
('09197724709',N'سعید', N'حجازی', '#sh34',50000000,  '2020-10-18'), --6
('0017147193659',N'جان', N'ویک','kill2022',1000000000,'2020-08-11'), --7
('09078724100',N'آرمان', N'فدایی', 'fa30',15000000, '2021-11-15'), --8
('09128006468',N'محمد', N'سجادی', 'MSJ90',7500000, '2021-03-05'), --9
('09173278132',N'علی', N'محمدی', 'am_456',320000000, '2021-09-05'); --10

INSERT INTO _user (MobileNumber, first_name, last_name, _password,balance, registration_date)
VALUES
('09122399137',N'سارا', N'بدیعی', 's@bsb',0, '2020-01-23'), --11
('09122377904',N'ایلیا', N'احمدپور', 'ilix100',0, '2021-12-20'); --12

UPDATE _user
SET email = 'gholami2022@gmail.com'
WHERE id = 1

UPDATE _user
SET email = 'saeed20@gmail.com'
WHERE id = 6

UPDATE _user
SET email = 'w_john@gmail.com'
WHERE id = 7

 

INSERT INTO Transactions (amount, _type, _date, userid)
VALUES
(50000000, 'increment', '1400/08/12', 6),
(1000000000, 'increment', '1400/07/07',7),
(15000000, 'increment', '1400/10/05', 8),
(7500000, 'increment', '1398/12/27', 9),
(320000000, 'increment', '1399/01/20', 10);

 

INSERT INTO country (name)
VALUES
(N'ایران'); --1

 
INSERT INTO City (name, countryid)
VALUES
(N'تهران', 1), --1
(N'مشهد', 1); --2

 
INSERT INTO Company (name)
VALUES
(N'ایران پیما');

 
INSERT INTO Transport (time, _date, duration, capacity, origin_city_id, destination_city_id, Companyid)
VALUES
('13:30', '1400/09/23', '12:00', 22, 1, 2, 1), --1
('15:30', '1400/09/24', '13:00', 22, 1, 2, 1); --2

 



INSERT INTO Bus_Terminal (name, cityid)
VALUES
(N'غرب', 1),
(N'امام رضا', 2),
(N'جنوب', 1);

 

INSERT INTO Bus (transportnumber,bus_origin_terminalid, bus_destination_terminalid)
VALUES
(1, 1, 2),
(2, 2, 1);

 




BEGIN
    DECLARE @num int
    DECLARE @count int
    SET @num = 1
    SET @count = 1
WHILE @count <= 22
    BEGIN
    INSERT INTO Ticket (seat_number,ticket_number ,_status, Transportnumber, cost, _type)
    VALUES (@num , @num, 1, 1,'1910000', 'VIP')
    SET @count = @count + 1
    SET @num = @num + 1
    END
END;

 

BEGIN
    DECLARE @num int
    DECLARE @count int
    SET @num = 1
    SET @count = 1
    WHILE @count <= 22
        BEGIN
            INSERT INTO Ticket (seat_number,ticket_number ,_status, Transportnumber, cost, _type)
            VALUES (@num , @num, 1, 2,'1910000', 'VIP')
            SET @count = @count + 1
            SET @num = @num + 1
        END
END;

 
INSERT INTO country (name)
VALUES
(N'آمریکا'), --2
(N'قطر'); --3

 

INSERT INTO city (name, countryid)
VALUES
(N'لس آنجلس', 2), --3
(N'دوحه', 3), --4
(N'سانفرانسیسکو', 2); --5

 




INSERT INTO transport (time, _date, duration, capacity, origin_city_id, destination_city_id, Companyid)
VALUES
('4:45', '1400/09/20', '22:30', 300, 3, 1, 4); --3

 

BEGIN
    DECLARE @num int
    DECLARE @count int
    SET @num = 1
    SET @count = 1
    WHILE @count <= 300
        BEGIN
            INSERT INTO Ticket (seat_number,ticket_number ,_status, Transportnumber, cost, _type)
            VALUES (@num , @num, 1, 3, 220000000, '')
            SET @count = @count + 1
            SET @num = @num + 1
        END
END;



 


INSERT INTO airport (name, cityid)
VALUES
('Imam Khomeini(IKA)', 1), --1
('Doha(DOH)', 4), --2
('San Francisco Intl.SFO)', 5), --3
('Los Angeles international Airport(LAX)', 3); --4

 

INSERT INTO flight (transportnumber, class, amount_of_allowed_baggage, Airportcode_origin, Airportcode_destination)
VALUES
(3, N'اکونومی', 23, 3, 1);

 

INSERT INTO Overseas (FlightTransportnumber)
VALUES (3)

 
INSERT INTO flight_legs (duration, OverseasFlightTransportnumber, Airportcode)
VALUES
('1:30', 3, 2),
('6:30', 3, 3);

 

INSERT INTO transport_reservation (_date, number_of_adult, number_of_children, userid, Ticketcode)
VALUES
('1400/08/30', 1, 0, 7, 3);

 
UPDATE _user
SET balance = balance - (SELECT cost FROM ticket WHERE Transportnumber = 3 and ticket_number = 1)
WHERE id = 7;

 

INSERT INTO transactions (amount, _type, _date, userid)
VALUES
((SELECT cost FROM ticket WHERE Transportnumber = 3 and ticket_number = 1),'overseas_flight_reservation', '1400/08/30', 7);

 




UPDATE Ticket
SET _status = 0
WHERE ticket_number = 1 and transportnumber = 3;

 

INSERT INTO transport_reservation (_date, number_of_adult, number_of_children, userid, Ticketcode)
VALUES
('1400/09/18', 1, 0, 9, 328);

 

UPDATE _user
SET balance = balance - (SELECT cost FROM ticket WHERE code = 328)
 WHERE id = 9;

 

INSERT INTO transactions (amount, _type, _date, userid)
VALUES
((SELECT cost FROM ticket WHERE code = 328),'bus_reservation', '1400/09/18', 9);

 



UPDATE Ticket
SET _status = 0 where code = 328;

 


INSERT INTO transport_reservation (_date, number_of_adult, number_of_children, userid, Ticketcode)
VALUES
('1400/09/15', 1, 0, 2, 329);

 

INSERT INTO transactions (amount, _type, _date, userid)
VALUES ((SELECT cost FROM ticket WHERE code = 329),'bus_reservation', '1400/09/15', 2);

 






UPDATE Ticket
SET _status = 0 WHERE code = 329

 




UPDATE Ticket
SET _status = 1 WHERE seat_number = 7 and transportnumber = 2;

 


UPDATE Ticket
SET _status = 0 WHERE seat_number = 10 and transportnumber = 2;

 



UPDATE Transport_Reservation
SET Ticketcode = (SELECT code FROM Ticket WHERE seat_number = 10 and transportnumber = 2 )
WHERE Userid = 2

 

INSERT INTO hotel (name, stars, cityid)
VALUES
(N'هتل اسپیناس', 5, 1);

 










BEGIN
DECLARE @num int
SET @num = 1;
WHILE @num <= 10
    BEGIN
        INSERT INTO room (meal, Hotelid, _Type, available, cost_per_night, num_of_bedrooms, _number)
        VALUES
        ('BB', 1, 'VIP', 1, 12800000, 2, @num)
        SET @num = @num + 1
    END
END

 

INSERT INTO hotel_reservation (checkin_date, checkout_date, _date, number_of_baby, number_of_adult, number_of_children, userid, Roomcode)
VALUES
('1400/09/20', '1400/09/21', '1400/09/01', 0, 1, 0, 7, 1);

 

UPDATE room
SET available = 0
WHERE _number = 1 and Hotelid = 1;

 

UPDATE _user
SET balance = balance - (SELECT cost_per_night FROM room WHERE _number = 1 and hotelid = 1)
WHERE id = 7;

 



INSERT INTO transactions (amount, _type, _date, userid)
VALUES ((SELECT cost_per_night FROM room WHERE _number = 1 and hotelid = 1),'hotel_reservation', '1400/09/01', 7);

 


BEGIN
DECLARE @Date DATE
SET @Date = FORMAT(GETDATE(), 'yyyy/MM/dd', 'fa')
DELETE  from _user
where DATEDIFF(day, @Date, registration_date) > 7
and id not in (select Userid from Transactions)
END

 

create table nzb_user(
id int PRIMARY KEY,
MobileNumber nvarchar(15) NOT NULL,
email varchar(50) NULL,
DateOfBirth date NULL,
TelephoneNumber nvarchar(15) NULL,
SSN nchar(10) NULL,
gender char(1) NULL,
PassportNumber nchar(9) NULL,
first_name nvarchar(25) NULL,
last_name nvarchar(25) NULL,
_password nvarchar(50) NOT NULL,
balance int DEFAULT 0 NULL,
registration_date date NOT NULL,
account_number nvarchar(25) NULL
);

INSERT INTO nzb_user
SELECT * FROM _user
WHERE balance != 0;

 






CREATE VIEW nzb_user_v AS
SELECT *
FROM nzb_user

 


CREATE PROCEDURE purchasedTickets @origin nvarchar(50), @destination nvarchar(50), @X nvarchar(50)
AS
BEGIN
    IF @X = N'رفت و برگشت'
        BEGIN
            select count(*) as Two_Way_Count
            from
            (SELECT DISTINCT _user.*
            from _user, Transport_Reservation
            where _user.id = Transport_Reservation.Userid
              and _user.id in ( select TR1.Userid
                                from Transport_Reservation TR1, Transport_Reservation TR2, Flight F1, Flight F2, Transport T1, Transport T2, Ticket TT1, Ticket TT2, Two_Way
                                where TR1.Ticketcode = TT1.code
                                  and TR2.Ticketcode = TT2.code
                                  and TT1.Transportnumber = T1._number
                                  and TT2.Transportnumber = T2._number
                                  and T1._number = F1.Transportnumber
                                  and T2._number = F2.Transportnumber
                                  and TR1._date = TR2._date
                                  and T1.origin_city_id = T2.destination_city_id
                                  and (Two_Way.DomesticFlightTransportnumber1 = F1.Transportnumber
                                    or Two_Way.OverseasFlightTransportnumber1 = F1.Transportnumber
                                    )
                                  and (Two_Way.DomesticFlightTransportnumber2 = F2.Transportnumber
                                  or Two_Way.OverseasFlightTransportnumber2 = F2.Transportnumber)
                                  and T1.origin_city_id = (select City.id FROM City where City.name = @origin)
                                  and T1.destination_city_id = (select City.id from City where City.name = @destination)
            )) as [uTRu.*]
        END
    IF @X = N'یک طرفه'
        BEGIN
            select count(*) One_Way_Count
                from
            (SELECT DISTINCT _user.*
            from _user, Transport_Reservation, Ticket
            where Transport_Reservation.Userid = _user.id
              and Transport_Reservation.Ticketcode = Ticket.code
              and Ticket.Transportnumber in ( select Transport._number
                                              from Transport_Reservation, Transport, Flight, One_Way, Ticket
                                              where Transport._number = Flight.Transportnumber
                                                and Transport_Reservation.Ticketcode = Ticket.code
                                                and (One_Way.OverseasFlightTransportnumber = Flight.Transportnumber
                                                  or One_Way.DomesticFlightTransportnumber = Flight.Transportnumber)
                                                and (Flight.Transportnumber = One_Way.DomesticFlightTransportnumber
                                                  or Flight.Transportnumber = One_Way.OverseasFlightTransportnumber)
                                                and Transport.origin_city_id = (select City.id FROM City where City.name = @origin)
                                                and Transport.destination_city_id = (select City.id from City where City.name = @destination)
            )) as [uTRu.*2]
        END
    IF @X = N'چند مسیره'
        BEGIN
select count(*) Multi_Way_Count
from
            (SELECT DISTINCT _user.*
            from _user, Transport_Reservation, Ticket, Flight, Transport, Multi_Way, MultiWay_Overseas
            where Transport_Reservation.Userid = _user.id
              and MultiWay_Overseas.OverseasFlightTransportnumber = Flight.Transportnumber
              and Multi_Way.id = MultiWay_Overseas.MultiWayid
              and Transport_Reservation.Ticketcode = Ticket.code
              and Flight.Transportnumber = Ticket.Transportnumber
              and Transport._number = Flight.Transportnumber
              and _user.id not in (select TR1.Userid
                                   from Transport_Reservation TR1, Transport_Reservation TR2, Flight F1, Flight F2, Transport T1, Transport T2, Ticket TT1, Ticket TT2, Two_Way
                                   where TR1.Ticketcode = TT1.code
                                     and TR2.Ticketcode = TT2.code
                                     and TT1.Transportnumber = T1._number
                                     and TT2.Transportnumber = T2._number
                                     and T1._number = F1.Transportnumber
                                     and T2._number = F2.Transportnumber
                                     and TR1._date = TR2._date
                                     and T1.origin_city_id = T2.destination_city_id
                                     and (Two_Way.DomesticFlightTransportnumber1 = F1.Transportnumber
                                       or Two_Way.OverseasFlightTransportnumber1 = F1.Transportnumber
                                       )
                                     and (Two_Way.DomesticFlightTransportnumber2 = F2.Transportnumber
                                       or Two_Way.OverseasFlightTransportnumber2 = F2.Transportnumber))
              and Ticket.Transportnumber not in (select Transport._number
                                                 from Transport_Reservation, Transport, Flight, One_Way, Ticket
                                                 where Transport._number = Flight.Transportnumber
                                                   and Transport_Reservation.Ticketcode = Ticket.code
                                                   and (One_Way.OverseasFlightTransportnumber = Flight.Transportnumber
                                                     or One_Way.DomesticFlightTransportnumber = Flight.Transportnumber)
                                                   and (Flight.Transportnumber = One_Way.DomesticFlightTransportnumber
                                                     or Flight.Transportnumber = One_Way.OverseasFlightTransportnumber))
              and Transport.origin_city_id = (select City.id FROM City where City.name = @origin)
              and Transport.destination_city_id = (select City.id from City where City.name = @destination)
                ) as [uTRu.*3]
        END
END

EXEC purchasedTickets @origin = N'تهران', @destination = N'نجف', @X = N'رفت و برگشت';

 
 
 
 


CREATE PROCEDURE userWalletDetail @A nchar(1)
AS
SELECT transactions._type
FROM _user, transactions
where _user.id = Transactions.Userid
  and _user.last_name like '%'+ @A
  and Transactions._date = (SELECT max(_date) from Transactions where _user.id = Transactions.Userid)

EXEC userWalletDetail @A = N'ی'

   

CREATE PROCEDURE allDomesticFlights @origin nvarchar(50), @destination nvarchar(50), @date nvarchar(50)
AS
SELECT distinct company.name as flight_company_name
FROM transport, Company, flight, domestic
where Transport._number = Flight.Transportnumber
and  Domestic.FlightTransportnumber = Flight.Transportnumber
and Transport.Companyid = Company.id
and Transport.origin_city_id = (select City.id from City where City.name = @origin)
and Transport.destination_city_id = (select City.id from City where City.name = @destination)
and Transport._date = @date

EXEC allDomesticFlights @origin = N'تهران', @destination = N'کیش', @date = '1400/12/11';

 
 
 
CREATE PROCEDURE internationalTickets @origin nvarchar(50), @destination nvarchar(50), @c int
AS
select avg(len(last_name)) as last_name_average
from _user
where _user.id in
(select _user.id
from _user, Transport_Reservation, Transport, Flight, Overseas, Ticket
where _user.id = Transport_Reservation.Userid
and  Transport_Reservation.Ticketcode = Ticket.code
and Ticket.Transportnumber = Transport._number
and Transport._number = Flight.Transportnumber
and Flight.Transportnumber = Overseas.FlightTransportnumber
and Transport.origin_city_id = (select City.id from City where City.name = @origin)
and Transport.destination_city_id = (select City.id from City where City.name = @destination)
group by _user.id
having count(*) > @c)

 
 
 
 


CREATE PROCEDURE terminalBuses @terminal nvarchar(50), @origin nvarchar(50), @destination nvarchar(50), @company_name nvarchar(50), @date date
AS
SELECT DISTINCT Transport.time, Transport._date, Transport.capacity, c1.name as origin, c2.name as destination ,Bus_Terminal.name,Company.name
FROM _user, transport_reservation, transport, bus, company,bus_terminal, city c1, city c2
where _user.id = transport_reservation.userid
  and transport._number = bus.transportnumber
  and bus.Bus_Origin_Terminalid = bus_terminal.id
  and Transport.companyid = company.id
  and transport.origin_city_id = c1.id
  and transport.destination_city_id = c2.id
  and bus_terminal.name = @terminal
  and c1.name = @origin
  and c2.name = @destination
  and company.name = @company_name
  and transport._date = @date

EXEC terminalBuses @terminal = N'غرب' , @origin = N'تهران', @destination = N'اصفهان', @company_name = N'رویال سفر', @date = '1400/10/17';

 






CREATE PROCEDURE hotelOrBusUsers @A int, @city nvarchar(50)
AS
SELECT avg(balance) as AverageOfBalance
from  _user
where _user.id in (SELECT  _user.id
                    FROM _user, transport_reservation, transport, bus, hotel_reservation, Hotel, Room, Ticket
                    where _user.id = transport_reservation.userid
                      and Transport_Reservation.Ticketcode = Ticket.code
                      and Ticket.Transportnumber = Transport._number
                      and transport._number = bus.transportnumber
                      and Hotel_Reservation.Userid = _user.id
                      and Hotel_Reservation.Roomcode = Room.code
                      and Room.Hotelid = Hotel.id
                      and transport.origin_city_id = (select City.id from City where City.name = @city)
                    group by _user.id
                    having count(*) >= @A)

EXEC hotelOrBusUsers @A = 2, @city = N'تهران'

 


CREATE PROCEDURE internationalFlight @X int , @origin nvarchar(50), @destination nvarchar(50), @N int
AS
BEGIN
DECLARE @Date DATE
SET @Date = FORMAT(GETDATE(), 'yyyy/MM/dd', 'fa')
select top (@X) *
from Transport, Flight, Overseas, Ticket
where Transport._number = Flight.Transportnumber
and Flight.Transportnumber = Ticket.Transportnumber
and Overseas.FlightTransportnumber = Flight.Transportnumber
and Transport.origin_city_id = (select City.id from City where City.name = @origin)
and Transport.destination_city_id = (select City.id from City where City.name = @destination )
and DATEDIFF(month, @Date, Transport._date) between -@N and 0
order by Ticket.cost
END

EXEC internationalFlight @X = 5, @origin = N'تهران', @destination = N'تورنتو', @N= 3;

 
 
 
 
 

CREATE PROCEDURE allInternationalTickets @class nvarchar(50), @origin nvarchar(50), @destination nvarchar(50), @date1 date, @date2 date
AS
SELECT *
FROM transport, flight, overseas, ticket
where transport._number = flight.transportnumber
  and Flight.Transportnumber = Overseas.FlightTransportnumber
  and Ticket.Transportnumber = Transport._number
  and  transport.origin_city_id = (select City.id from City where City.name = @origin)
  and transport.destination_city_id = (select City.id from City where  City.name = @destination)
  and flight.class = @class
  and transport._date between @date1 and @date2

EXEC allInternationalTickets @class = N'فرست کلاس', @origin = N'تهران', @destination = N'فرانکفورت', @date1 = '1400/09/25', @date2 = '1400/09/30';

 
 
 

CREATE PROCEDURE joinedUsers @date1 date, @date2 date, @C int
AS
SELECT _user.*
FROM _user, transport_reservation, transport, Ticket
where _user.id = transport_reservation.userid
  and Transport_Reservation.Ticketcode = Ticket.code
  and Transport._number = Ticket.Transportnumber
  and ((registration_date between @date2 and @date1)
    or (select count(*)
        from Transport_Reservation
        where Transport_Reservation.Userid = _user.id
        ) < @C)

EXEC joinedUsers @date1 = '1400/09/25', @date2 = '1400/10/13', @C = 2;

 
 

CREATE PROCEDURE myTrips @first_name nvarchar(50), @last_name nvarchar(50)
AS
SELECT transport_reservation._date, Ticket.ticket_number, Ticket.seat_number, Ticket.cost, c1.name as origin, c2.name as destination
FROM _user, transport_reservation, Ticket, Transport, City c1, City c2
where _user.id = transport_reservation.userid
  and Transport_Reservation.Ticketcode = Ticket.code
  and Ticket.Transportnumber = Transport._number
  and _user.first_name = @first_name
  and _user.last_name = @last_name
  and Transport.origin_city_id = c1.id
  and Transport.destination_city_id = c2.id

EXEC myTrips @first_name = N'سجاد', @last_name = N'محمدی';

 
 

drop procedure chargedUsers
CREATE PROCEDURE chargedUsers @X int, @Y int
AS
select count(*) as number_of_user
from _user
where
_user.id in (SELECT _user.id
            FROM _user, transactions
            where _user.id = Transactions.Userid
            and Transactions._type = 'increment'
            group by _user.id
            having count(*) >=  @X)
and _user.id in (SELECT _user.id
                     FROM _user, transactions
                     where _user.id = Transactions.Userid
                       and Transactions._type != 'increment'
                     group by _user.id
                     having count(*) <= @Y)

EXEC chargedUsers @X = 7, @Y = 15;

 
 
 




CREATE PROCEDURE allBusTickets_1 @origin nvarchar(50), @destination nvarchar(50)
AS
SELECT DISTINCT company.name as CompanyName
FROM company, Transport, Bus
where Transport.Companyid = Company.id
and Transport._number = Bus.Transportnumber
and Company.id not in (SELECT Company.id
                       FROM Company, Transport, Bus
                       where Transport.Companyid = Company.id
                        and Transport._number = Bus.Transportnumber
                        and Transport.origin_city_id = (select City.id from City WHERE City.name = @origin)
                        and Transport.destination_city_id = (select City.id from City WHERE City.name = @destination)
    )

EXEC allBusTickets_1 @origin = N'کرج', @destination = N'قم';

 
 



 
 




drop procedure allBusTickets_2
CREATE PROCEDURE allBusTickets_2 @origin nvarchar(50), @destination nvarchar(50), @company nvarchar(50), @cost int
AS
BEGIN
    DECLARE @Date DATE
    SET @Date = FORMAT(GETDATE(), 'yyyy/MM/dd', 'fa')
    select Transport.time, Transport._date, Transport.capacity, Ticket.*, Company.name
    from Transport, Bus, Ticket, Company
    where Bus.Transportnumber = Transport._number
    and Transport._number = Ticket.Transportnumber
    and Company.id = Transport.Companyid
    and (Transport._date in
    (select MIN(Transport._date)
    from Transport, Bus, Ticket, Company
    where Transport._number = Bus.Transportnumber
    and Ticket.Transportnumber = Transport._number
    and Company.id = Transport.Companyid
    and Transport._date >= @Date
    group by Transport.Companyid)
    or Transport.capacity in
    (select max(Transport.capacity)
    from Transport, Bus, Ticket, Company
    where Transport._number = Bus.Transportnumber
    and Ticket.Transportnumber = Transport._number
    and Company.id = Transport.Companyid
    group by Transport.Companyid)
    and Ticket.cost < @cost
    and Company.name = @company
    and Transport.origin_city_id = (select City.id from City where City.name = @origin)
    and Transport.destination_city_id = (select City.id from City where City.name = @destination))
END

EXEC allBusTickets_2 @origin = N'شیراز', @destination = N'اصفهان', @comPany = N'سیر و سفر', @cost = 300000;

 
 
 
 

CREATE PROCEDURE twoTrips @origin nvarchar(50), @destination1 nvarchar(50), @destination2 nvarchar(50)
AS
SELECT DISTINCT _user.first_name, _user.last_name
FROM _user, transport_reservation tr1, transport t1, transport_reservation tr2, transport t2, Domestic, bus, Ticket tick1, Ticket tick2, Overseas, Flight f1, Flight f2
where _user.id = tr1.userid
  and _user.id = tr2.userid
  and tr1.Ticketcode = tick1.code
  and tr2.Ticketcode = tick2.code
  and tick1.Transportnumber = t1._number
  and tick2.Transportnumber = t2._number
  and ((f1.Transportnumber = tick1.Transportnumber
      and f1.Transportnumber = Domestic.FlightTransportnumber)
      or (Bus.Transportnumber = tick1.Transportnumber))
  and f2.Transportnumber = tick2.Transportnumber
  and f2.Transportnumber = Overseas.FlightTransportnumber
 and t1._date < t2._date
 and t1.origin_city_id = (select City.id from City where City.name = @origin)
 and t1.destination_city_id = (select City.id from City where City.name = @destination1)
and t2.origin_city_id = (select City.id from City where City.name = @destination1)
and t2.destination_city_id =  (select City.id from City where City.name = @destination2)

EXEC twoTrips @origin = N'تهران', @destination1 = N'کیش', @destination2 = N'دبی'

 
 
 
 
 


CREATE PROCEDURE lastChange @first_name nvarchar(25), @last_name nvarchar(25)
AS
SELECT _type, _date
FROM Transactions
WHERE _date = (SELECT max(Transactions._date)
                FROM _user, transactions
                where _user.id = Transactions.userid
                and _user.first_name = @first_name
                and _user.last_name = @last_name)

EXEC lastChange @first_name = N'زهره', @last_name = N'رسولی';

 
 

CREATE PROCEDURE reserveHotel_1 @N int, @city nvarchar(50), @date1 date, @date2 date, @M int, @origin nvarchar(50), @date3 date, @date4 date
AS
SELECT *
FROM _user
where _user.id in  (select _user.id
                   from _user ,hotel_reservation, Room, Hotel
                   where _user.id = hotel_reservation.userid
                     and hotel_reservation.Roomcode = Room.code
                     and Room.Hotelid = Hotel.id
                     and Hotel.Cityid = (select City.id from City where City.name = @city)
                     and hotel_reservation._date between @date1 and @date2
                   group by _user.id
                   having count(*) = @N
    )
  and _user.id in
    (select _user.id
     from _user, transport_reservation, transport , Bus, Ticket
     where _user.id = transport_reservation.userid
       and transport_reservation.Ticketcode = Ticket.code
       and Ticket.Transportnumber = Transport._number
       and Bus.Transportnumber = Transport._number
       and Transport.origin_city_id = (select City.id from City where City.name = @origin)
       and transport_reservation._date between @date3 and @date4
       group by _user.id
       having count(*) = @M
     )

EXEC reserveHotel_1 @N = 3, @city = N'کیش', @date1 = '1398/10/15', @date2 = '1400/10/15', @M = 4, @origin = N'تهران', @date3 = '1396/01/25', @date4 = '1399/05/11';

 


 
 








CREATE PROCEDURE reserveHotel_2 @date1 date, @date2 date, @city nvarchar(50)
AS
select * from _user where _user.id in
(select _user.id
from _user, Hotel_Reservation, Hotel, Room
where _user.id = Hotel_Reservation.Userid
and hotel_reservation.Roomcode = Room.code
and Room.Hotelid = Hotel.id
and Hotel.Cityid = (select City.id from City where City.name = @city)
and Hotel_Reservation._date between @date1 and @date2
and Hotel.stars < 3
group by _user.id
having count(distinct Hotelid) = (select distinct count(*)
                                  from Hotel
                                  where Hotel.Cityid = (select City.id from City where City.name = N'یزد')
                                  and Hotel.stars < 3))

EXEC reserveHotel_2  @date1 = '1400/05/20', @date2 = '1400/09/20', @city = N'یزد';

 
 
 


CREATE PROCEDURE reserveHotel_3 @city nvarchar(50), @destination nvarchar(50)
AS
select _user.last_name
from _user
where _user.id not in (select _user.id
from _user, Transport, Transport_Reservation, Ticket
       where _user.id = Transport_Reservation.Userid
       and Transport_Reservation.Ticketcode = Ticket.code
       and Ticket.Transportnumber = Transport._number
       and Transport.origin_city_id = (select city.id from city where city.name = @destination))
or _user.id not  in (select _user.id
                from _user,Hotel_Reservation, Hotel, Room
                where _user.id = Hotel_Reservation.Userid
                and Hotel_Reservation.Roomcode = Room.code
                and Room.Hotelid = Hotel.id
                and Hotel.Cityid = (select city.id from city where city.name != @city))
order by _user.last_name

EXEC reserveHotel_3 @city = N'مشهد', @destination = N'بندرعباس';

 
 
 
 


CREATE PROCEDURE reserveHotel_4 @city nvarchar(50), @C int
AS
SELECT *
FROM _user
where _user.id in (select Hotel_Reservation.userid
                   from hotel_reservation , hotel , Room
                   where Hotel_Reservation.Roomcode = Room.code
                    and Room.Hotelid = Hotel.id
                    and DATEDIFF(day, Hotel_Reservation.checkin_date, Hotel_Reservation.checkout_date) > @C
                    and Hotel.Cityid = (select City.id from City where City.name = @city)
)

EXEC reserveHotel_4 @city = N'کیش', @C = 7;

 
 

CREATE PROCEDURE reserveHotel_5 @A int
AS
SELECT *
FROM Hotel
WHERE Hotel.id in
(SELECT Hotel.id
FROM Hotel, Hotel_Reservation, Room
WHERE Hotel.id = Room.Hotelid
    and Hotel_Reservation.Roomcode = Room.code
    group by Hotel.id
    having count(*) =
(SELECT MAX (mycount)
FROM (SELECT count(*) mycount
FROM hotel_reservation,Room, Hotel
where Hotel_Reservation.Roomcode = Room.code
and Room.Hotelid = Hotel.id
and Hotel.stars > @A
group by Hotelid) as mH))

EXEC reserveHotel_5 @A = 2;

 
 
 







