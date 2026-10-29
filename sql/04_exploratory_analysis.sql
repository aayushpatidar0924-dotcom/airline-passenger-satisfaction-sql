use airline_analytics;

-- overall passenger satisfaction distribution
select 
	satisfaction,
    count(*) as passenger_count
from airline_passengers
group by satisfaction;

-- percentage of passenger satisfaction
select 
	satisfaction,
    count(*) as passenger_count,
    round((count(*)/(select count(*) from airline_passengers))*100,2) as percentage
from airline_passengers
group by satisfaction;

-- unique customer types
select 
	distinct `Customer Type` 
from airline_passengers;

-- passenger minimum/maximum/average age
select 
	min(age) as minimum_age,
    max(age) as maximum_age,
    avg(age) as average_age
from airline_passengers;

-- travel class passenger count
select 
	`class`,
    count(*) as passenger_count
from airline_passengers
group by `class`;

-- travel type passenger count
select 
	`Type of Travel`,
    count(*) as passenger_count
from airline_passengers
group by `Type of Travel`;

-- Gender wish passenger count and percentage
select 
	Gender,
    count(*) as passenger_count,
    round(((count(*)/(select count(*) from airline_passengers))*100),2) as percentage
from airline_passengers
group by Gender;

-- customer type passenger count
select 
	`Customer Type`,
    count(*) as passenger_count
from airline_passengers
group by `Customer Type`;

-- satisfied and dissatisfied passenger count in each travel class
select 
	class,
    satisfaction,
    count(*) as passenger_count
from airline_passengers
group by class,satisfaction;

-- satisfied and dissatisfied passenger count in each travel type
select 
	`Type of Travel`,
    satisfaction,
    count(*) as passenger_count
from airline_passengers
group by `Type of Travel`,satisfaction;

-- under 18,18-30,31-45,46-60,above 60 age group passenger count
with a as (select
				id,
                case when Age<18 then 'under 18'
					 when Age<31 then '18-30'
                     when Age<46 then '31-45'
                     when Age<61 then '46-60'
                     else 'above 60'
				end as 'age group'
			from airline_passengers)
select 
	`age group`,
    count(*) as passengers
from a 
group by `age group`;

-- satisfaction and dissatisfaction in each age group
with a as (select
				satisfaction,
                case when Age<18 then 'under 18'
					 when Age<31 then '18-30'
                     when Age<46 then '31-45'
                     when Age<61 then '46-60'
                     else 'above 60'
				end as 'age group'
			from airline_passengers) 
select 
	`age group`,
    satisfaction,
    count(*) as passenger_count
from a 
group by `age group`,satisfaction;

-- compare passenger satisfaction according to the gender and travel class 
select
	class,
    Gender,
    count(*) as total_passengers,
    sum(case when satisfaction='True' then 1 else 0 end) as satisfied_passengers,
    round(100*(sum(case when satisfaction='True' then 1 else 0 end)/count(*)),2) as satisfied_percentage
from airline_passengers
group by class,Gender;

-- percentage of customer type
select 
	`Customer Type`,
    round((count(*)/(select count(*) from airline_passengers))*100,2) as percentage
from airline_passengers
group by `Customer Type`;

-- highest passengers in travel class
select 
	class,
    count(*) as passengers
from airline_passengers
group by class
order by count(*) desc
limit 1;

-- common customer type
select 
	`Customer Type`
from airline_passengers
group by `Customer Type`
order by count(*) desc
limit 1;

-- maximum passenger  age group
with a as (select
				id,
                case when Age<18 then 'under 18'
					 when Age<31 then '18-30'
                     when Age<46 then '31-45'
                     when Age<61 then '46-60'
                     else 'above 60'
				end as 'age group'
			from airline_passengers)
select
	`age group`,
    count(*) as passengers
from a 
group by `age group`
order by count(*) desc
limit 1;

-- overall satisfied passenger percentage
SELECT
    ROUND(
        AVG(CASE
            WHEN satisfaction = 'True' THEN 1.0
            ELSE 0.0
        END) * 100,
        2
    ) AS satisfaction_percentage,
    CASE
        WHEN AVG(
            CASE
                WHEN satisfaction = 'True' THEN 1.0
                ELSE 0.0
            END
        ) * 100 > 50
        THEN 'Above 50%'
        ELSE '50% or below'
    END AS satisfaction_status
FROM airline_passengers;

/*
My observations after analyzing the data:

1. Out of 307,725 passengers, 171,413 were dissatisfied
   and 136,312 were satisfied. So, more than half of the
   passengers in my dataset were dissatisfied.

2. The 31-45 age group had the highest number of passengers
   (103,396). The above-60 group had the lowest (13,592).

3. Business class had the highest passenger count with
   150,421 passengers, followed by Eco with 144,183.
   Eco Plus had only 13,121 passengers.

4. Most passengers in my dataset were travelling for
   business purposes (218,753), while 88,972 were travelling
   for personal reasons.

5. When I compared satisfaction by gender and class, I found
   that satisfaction was much higher in Business class than
   in Eco and Eco Plus for both males and females.
   For example, satisfaction was 73.14% for males and
   71.99% for females in Business class.

These results made me curious about which services might
be related to passenger dissatisfaction. I will explore
service ratings and flight delays in the next analysis.
*/