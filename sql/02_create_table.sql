USE airline_analytics;

CREATE TABLE airline_passengers(
    id int,
    Age int,
    `Flight Distance` int,
    `Inflight wifi service` int,
    `Departure/Arrival time convenient` int,
    `Ease of Online booking` int,
    `Gate location` int,
    `Food and drink` int,
    `Online boarding` int,
    `Seat comfort` int,
    `Inflight entertainment` int,
    `On-board service` int,
    `Leg room service` int,
    `Baggage handling` int,
    `Checkin service` int,
    `Cleanliness` int,
    `Departure Delay in Minutes` int,
    `Arrival Delay in Minutes` decimal(10,2) null,
    Gender varchar(20),
    `Customer Type` varchar(50),
    `Type of Travel` varchar(50),
    Class varchar(30),
    satisfaction varchar(20)
);

describe airline_passengers;

select database();