use airline_analytics;

-- 1- top 3 services by average rating
with a as (select
					service,
                    average_rating,
                    dense_rank() over(order by average_rating desc) as 'rank'
			 from (SELECT 'Inflight WiFi' AS service,AVG(`Inflight wifi service`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'On-board Service', AVG(`On-board service`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Leg Room Service', AVG(`Leg room service`)AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Cleanliness', AVG(Cleanliness) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Check-in Service', AVG(`Checkin service`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Baggage Handling', AVG(`Baggage handling`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Inflight Entertainment', AVG(`Inflight entertainment`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Seat Comfort', AVG(`Seat comfort`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Food and Drink', AVG(`Food and drink`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Online Booking', AVG(`Ease of Online booking`) AS average_rating
					FROM airline_passengers
				) AS service_ratings)
select * from a where `rank`<4;

-- 2 lowest 3 services by average rating
with a as (select 
					service,
                    average_rating,
                    dense_rank() over(order by average_rating asc) as 'rank'
			 from (SELECT 'Inflight WiFi' AS service,AVG(`Inflight wifi service`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'On-board Service', AVG(`On-board service`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Leg Room Service', AVG(`Leg room service`)AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Cleanliness', AVG(Cleanliness) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Check-in Service', AVG(`Checkin service`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Baggage Handling', AVG(`Baggage handling`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Inflight Entertainment', AVG(`Inflight entertainment`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Seat Comfort', AVG(`Seat comfort`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Food and Drink', AVG(`Food and drink`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Online Booking', AVG(`Ease of Online booking`) AS average_rating
					FROM airline_passengers
				) AS service_ratings)
select * from a where `rank`<4;

-- 3 rank all services
with a as (select 
					service,
                    average_rating,
                    dense_rank() over(order by average_rating desc) as 'rank'
			 from (SELECT 'Inflight WiFi' AS service,AVG(`Inflight wifi service`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'On-board Service', AVG(`On-board service`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Leg Room Service', AVG(`Leg room service`)AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Cleanliness', AVG(Cleanliness) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Check-in Service', AVG(`Checkin service`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Baggage Handling', AVG(`Baggage handling`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Inflight Entertainment', AVG(`Inflight entertainment`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Seat Comfort', AVG(`Seat comfort`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Food and Drink', AVG(`Food and drink`) AS average_rating
					FROM airline_passengers
					UNION ALL
					SELECT 'Online Booking', AVG(`Ease of Online booking`) AS average_rating
					FROM airline_passengers
				) AS service_ratings)
select * from a;

-- 4 satisfaction rate by wifi rating
with a as (select 
				id,
                `Inflight wifi service`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		  from airline_passengers)
select 
	`Inflight wifi service`,
    count(*) as 'Total passengers',
    sum(satisfied) as 'satisfied passengers',
    count(*)-sum(satisfied) as 'dissatisfied passengers',
    round((sum(satisfied)/count(*))*100,2) as 'satisfaction percentage'
from a 
group by `Inflight wifi service`;

-- 5 Satisfaction Rate by Online Boarding Rating
with a as (select
				id,
                `Online boarding`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Online boarding`,
    round((sum(satisfied)/count(*))*100,2) as 'satisfaction rate'
from a 
group by `Online boarding`
order by `satisfaction rate` desc;

-- 6 customre type and travel class analysis
with a as (select
				id,
                `Customer Type`,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Customer Type`,
    class,
    count(*) as total_passengers,
    round((sum(satisfied)/count(*))*100,2) as 'satisfaction rate'
from a 
group by `customer type`,class;

-- 7 travel type and travel class analysis
with a as (select
				id,
                `Type of travel`,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Type of travel`,
    class,
    count(*) as total_passengers,
    round((sum(satisfied)/count(*))*100,2) as 'satisfaction rate'
from a 
group by `Type of travel`,class;

-- 8 Gender,class and satisfaction
with a as (select
				id,
			    gender,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	gender,
    class,
    count(*) as total_passengers,
    sum(satisfied) as 'satisfied passengers',
    round((sum(satisfied)/count(*))*100,2) as 'satisfaction rate'
from a 
group by gender,class;

-- 9 age group and class analysis
with a as (select
                case when Age<18 then 'under 18'
					 when Age<31 then '18-30'
                     when Age<46 then '31-45'
                     when Age<61 then '46-60'
                     else 'above 60'
				end as 'age group',
                class,
                case when satisfaction='True' then 1 else 0 end satisfied
			from airline_passengers) 
select 
	`age group`,
    class,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a 
group by `age group`,class;

-- 10 Most Dissatisfied Segment
with a as (select
				id,
			    `customer type`,
                class,
                `type of travel`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`customer type`,
	class,
	`type of travel`,
    count(*) as total_passengers,
    sum(satisfied) as 'satisfied passengers',
    count(*)-sum(satisfied) as 'dissatisfied passengers',
    100-round((sum(satisfied)/count(*))*100,2) as 'dissatisfaction rate'
from a 
group by `customer type`,class,`type of travel`
having 100-round(((sum(satisfied)/count(*))*100),2)>75;

-- 11 Above-Average Satisfaction Segments
with a as (select
				id,
                `Customer Type`,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers),
	 overall_satisfaction as (select round((sum(satisfied)/count(*))*100,2) as overall_rate from a)
select
	`Customer Type`,
    class,
    count(*) as total_passengers,
    round((sum(satisfied)/count(*))*100,2) as 'satisfaction rate'
from a 
group by `customer type`,class
having round((sum(satisfied)/count(*))*100,2)>(select * from overall_satisfaction);

-- 12 Above-Average Flight Distance
with a as (select avg(`flight distance`) from airline_passengers)
select 	
	id,
    age,
    `flight distance`,
    satisfaction
from airline_passengers
where `flight distance`>(select * from a);

-- 13 High-Rating but Dissatisfied Passengers
select 
	count(distinct id) as passengers
from airline_passengers
where `inflight wifi service`>3 and `online boarding`>3 and satisfaction='False';

-- 14 Passengers with Low Service Ratings
select
	count(distinct id) as passengers
from airline_passengers
where (`inflight wifi service`<3 and `online boarding`<3) or (`inflight wifi service`<3 and `seat comfort`<3) or (`seat comfort`<3 and `online boarding`<3);

-- 15. Compare Satisfaction with Overall Average
with a as (select
				id,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers),
	b as (select 
				round((sum(satisfied)/count(*))*100,2) 
		  from a)
select 
	class,
    round((sum(satisfied)/count(*))*100,2) as class_satisfaction_rate,
    (select * from b) as overall_satisfaction_rate,
    abs(round((sum(satisfied)/count(*))*100,2)-(select * from b)) as difference_in_percentage
from a 
group by class;

-- 16 Rank Classes by Satisfaction Rate
with a as (select
				id,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select 
	class,
    round((sum(satisfied)/count(*))*100,2) as class_satisfaction_rate,
    dense_rank() over( order by round((sum(satisfied)/count(*))*100,2) desc) as 'rank'
from a 
group by class;

-- 17 Rank Age Groups by Satisfaction Rate
with a as (select
                case when Age<18 then 'under 18'
					 when Age<31 then '18-30'
                     when Age<46 then '31-45'
                     when Age<61 then '46-60'
                     else 'above 60'
				end as 'age group',
                case when satisfaction='True' then 1 else 0 end satisfied
			from airline_passengers) 
select 
	`age group`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate,
    dense_rank() over(order by round((sum(satisfied)/count(*))*100,2) desc) as 'rank'
from a 
group by `age group`;

-- 18 Top 3 Wi-Fi Ratings by Passenger Count
with a as (select
				`inflight wifi service`,
                count(*) as passengers
		    from airline_passengers
            group by `inflight wifi service`),
	b as  (select 
			*,
			dense_rank() over(order by passengers desc) as 'rank'
		from a)
select 
	* 
from b 
where `rank`<=3;

-- 19 Compare Each Class with the Previous Ranked Class
with a as (select
				id,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers),
	 b as (select 
				class,
				round((sum(satisfied)/count(*))*100,2) as class_satisfaction_rate,
				dense_rank() over( order by round((sum(satisfied)/count(*))*100,2) desc) as 'rank'
			from a 
			group by class)
select 
	class,
    class_satisfaction_rate,
    lag(class_satisfaction_rate) over(order by `rank` asc) as previous_class_satisfaction_rate,
    `rank`
from b;

-- 20 Running Total of Passengers by Age Group
with a as (select
				id,
                case when Age<18 then 'under 18'
					 when Age<31 then '18-30'
                     when Age<46 then '31-45'
                     when Age<61 then '46-60'
                     else 'above 60'
				end as 'age group',
                case when Age<18 then 1
					 when Age<31 then 2
                     when Age<46 then 3
                     when Age<61 then 4
                     else 5
				end as 'order'
			from airline_passengers),
	 b as   (select 
				`age group`,
                `order`,
				count(*) as passenger_count
			from a 
			group by `age group`,`order`
            order by `order` asc)
select 
	`age group`,
    passenger_count,
    sum(passenger_count) over(order by `order` asc) as running_total
from b
order by `order`;

-- 21 Delayed vs Non-Delayed Passengers
with a as (select
				id,
                case when `Departure Delay in Minutes`<1 then 'no delay' else 'delayed' end as delay_status,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select 
	delay_status,
	count(*) as passengers,
    round((sum(satisfied)/count(*))*100,2) as 'satisfaction rate'
from a 
group by delay_status;

-- 22 Satisfaction by Departure Delay Range
with a as (select 
				id,
                case when `Departure Delay in Minutes`<1 then 'no delay'
                     when `Departure Delay in Minutes`<16 then 'short delay'
                     when `Departure Delay in Minutes`<61 then 'medium delay'
                     else 'long delay'
				end as 'delay range',
                case when satisfaction='True' then 1 else 0 end as satisfied
			from airline_passengers)
select 
	`delay range`,
    count(*) as passengers,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a 
group by  `delay range`
order by case `delay range`
				when 'no delay' then 1
				when 'short delay' then 2
				when 'medium delay' then 3
				when 'long delay' then 4
         end;

-- 23 Average Arrival Delay by Satisfaction
with a as (select
				`Arrival Delay in Minutes`,
                satisfaction
		   from airline_passengers
           where `Arrival Delay in Minutes` is not null)
select 
	case when satisfaction='True' then 'satisfied' else 'dissatisfied' end as satisfaction,
    avg(`Arrival Delay in Minutes`) as average_arrival_delay
from a 
group by satisfaction;

-- 24 Compare Departure and Arrival Delays
select
	`Type of Travel`,
    count(*) as total_passengers,
	avg(`Departure Delay in Minutes`) as Average_Departure_Delay,
    avg(`Arrival Delay in Minutes`) as Average_Arrival_Delay
from airline_passengers
group by `Type of Travel`;
    
    
```sql
/*
FINAL BUSINESS OBSERVATIONS

1. Loyal customers in Business Class had a satisfaction rate
   of 78.34%, which indicates a high satisfaction level
   for this customer segment.

2. Business Class had the highest satisfaction rate at 72.56%,
   followed by Eco Plus at 24.58% and Eco at 16.61%.

3. Passengers aged 46–60 had the highest satisfaction rate
   at 60.05%, followed by the 31–45 age group at 49.24%.

4. Wi-Fi ratings 2 and 3 had the highest passenger counts,
   with 82,133 and 81,053 passengers respectively.
   This can help identify commonly reported Wi-Fi ratings.

5. The running-total analysis shows that the dataset contains
   307,725 passengers across all age groups.

6. Passengers without departure delays had a satisfaction
   rate of 44.72%, compared with 40.12% for delayed passengers.

7. Satisfaction decreased across the departure-delay ranges:
   44.72% for no delay, 42.99% for short delay,
   33.09% for medium delay, and 28.99% for long delay.
   However, the long-delay group contained only 138 passengers.

8. The average arrival delay was approximately 1.39 minutes
   for dissatisfied passengers and 0.79 minutes for satisfied
   passengers, excluding NULL arrival-delay values.

9. I used CTEs, aggregate functions, CASE statements, and
   window functions such as DENSE_RANK(), LAG(), and SUM()
   OVER() to perform advanced analysis.

10. These results show differences in satisfaction across
    customer segments and delay categories. Further analysis
    would be needed to understand the reasons behind them.
*/
```
