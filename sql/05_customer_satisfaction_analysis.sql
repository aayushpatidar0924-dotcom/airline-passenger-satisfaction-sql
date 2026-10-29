use airline_analytics;

-- 1 satisfied and dissatisfied
select 
	satisfaction,
    round((count(*)/(select count(*) from airline_passengers))*100,2) as percentage
from airline_passengers
group by satisfaction;

-- 2 satisfaction rate in customer type
with a as (select
				id,
                `Customer Type`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select 
	`Customer Type`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by `Customer Type`;

-- 3 satisfaction rate in travel class
with a as (select
				id,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select 
	class,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by class;

-- 4 comparition of business and personal travel satisfaction
with a as (select
				id,
                `Type of Travel`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select 
	`Type of Travel`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by `Type of Travel`;

-- 5 gender wish satisfaction rate
with a as (select
				id,
                gender,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select 
	gender,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by  gender;

-- 6 satisfaction rate in age group
with a as (select
				id,
                case when Age<18 then 'under 18'
					 when Age<31 then '18-30'
                     when Age<46 then '31-45'
                     when Age<61 then '46-60'
                     else 'above 60'
				end as 'age group',
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select 
	`age group`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by `age group`;

-- 7 satisfied passenger count in travel class
with a as (select 
				id,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select 
	class,
    sum(satisfied) as satisfied_passengers
from a 
group by class;

-- 8 dissatified percentage of customer type
with a as (select 
				id,
                `Customer Type`,
                case when satisfaction='False' then 1 else 0 end as dissatisfied
		   from airline_passengers)
select 
	`Customer Type`,
    round((sum(dissatisfied)/count(*))*100,2) as dissatisfied_percentage
from a 
group by `Customer Type`;

-- 9 average rating of services
select 
	avg(`Inflight wifi service`) as 'average inflight wifi service',
    avg(`On-board service`) as 'average On-board service',
    avg(`Leg room service`) as 'average leg room service',
    avg(cleanliness) as 'average cleanliness',
    avg(`checkin service`) as 'average checkin service',
    avg(`baggage handling`) as 'average baggage handling service',
    avg(`inflight entertainment`) as 'average inflight entertainment service',
    avg(`seat comfort`) as 'average seat comfort service',
    avg(`food and drink`) as 'average food and drink service',
    avg(`ease of online booking`) as 'average online booking service'
from airline_passengers;

-- 10 Rank services from highest to lowest average rating
SELECT service, average_rating
FROM (
    SELECT
        'Inflight WiFi' AS service,
        AVG(`Inflight wifi service`) AS average_rating
    FROM airline_passengers
    UNION ALL
    SELECT 'On-board Service', AVG(`On-board service`)
    FROM airline_passengers
    UNION ALL
    SELECT 'Leg Room Service', AVG(`Leg room service`)
    FROM airline_passengers
    UNION ALL
    SELECT 'Cleanliness', AVG(Cleanliness)
    FROM airline_passengers
    UNION ALL
    SELECT 'Check-in Service', AVG(`Checkin service`)
    FROM airline_passengers
    UNION ALL
    SELECT 'Baggage Handling', AVG(`Baggage handling`)
    FROM airline_passengers
    UNION ALL
    SELECT 'Inflight Entertainment', AVG(`Inflight entertainment`)
    FROM airline_passengers
    UNION ALL
    SELECT 'Seat Comfort', AVG(`Seat comfort`)
    FROM airline_passengers
    UNION ALL
    SELECT 'Food and Drink', AVG(`Food and drink`)
    FROM airline_passengers
    UNION ALL
    SELECT 'Online Booking', AVG(`Ease of Online booking`)
    FROM airline_passengers
) AS service_ratings
ORDER BY average_rating DESC;

-- 11 satisfaction rate of according to Inflight wifi service rating
with a as (select
				`Inflight wifi service`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Inflight wifi service`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by `Inflight wifi service`;

-- 12 satisfaction rate of according to online boarding
with a as (select
				`Online boarding`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Online boarding`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by `Online boarding`;

-- 13 satisfaction rate of seat comfort
with a as (select
				`Seat comfort`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Seat comfort`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by `Seat comfort`;

-- 14 satisfaction rate of Inflight entertainment
with a as (select
				`Inflight entertainment`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Inflight entertainment`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by `Inflight entertainment`;

-- 15 Dissatisfaction of low food and drink ratings
with a as (select
				`Food and drink`,
                case when satisfaction='False' then 1 else 0 end as dissatisfied
		   from airline_passengers)
select
	`Food and drink`,
    round((sum(dissatisfied)/count(*))*100,2) as dissatisfaction_rate
from a
where `food and drink`<3
group by `food and drink`;

-- 16 satisfied and dissatisfied passengers of wifi service rating
with a as (select
				id,
                `Inflight wifi service`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Inflight wifi service`,
    count(*) as total_passengers,
    sum(satisfied) as satisfied,
    (count(*)-sum(satisfied)) as dissatisfied
from a 
group by `Inflight wifi service`
ORDER BY `Inflight wifi service`;

--  17 Satisfaction percentage by Wi-Fi rating
with a as (select
				id,
                `Inflight wifi service`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Inflight wifi service`,
    count(*) as total_passengers,
    sum(satisfied) as satisfied,
    (count(*)-sum(satisfied)) as dissatisfied,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a 
group by `Inflight wifi service`
ORDER BY `Inflight wifi service`;

-- 18 compare satisfation rate in  travel class and online boarding
with a as (select
				class,
                `Online boarding`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	class,
    `Online boarding`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by class,`Online boarding`;


-- 19 compare satisfation rate in  travel class and seat comfort
with a as (select
				class,
                `seat comfort`,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	class,
    `seat comfort`,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by class,`seat comfort`;

-- 20 satisfaction rate of delay or not delay passengers
with a as (select
				id,
                case when `Departure Delay in Minutes`<1 then 'no' else 'yes' end as delay_status,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	delay_status,
    count(*) as passenger_count,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by  delay_status;

-- 21 Overall Summary of Departure and Arrival Delays
select 
	avg(`Departure Delay in Minutes`) as 'average departure delay',
    avg(`Arrival Delay in Minutes`) as 'average arrival delay',
    max(`Departure Delay in Minutes`) as 'maximum departure delay',
    max(`Arrival Delay in Minutes`) as 'maximum arrival delay',
    count(*) as 'total passengers'
from airline_passengers;

-- 22 Average Flight Distance according to customer type
select 
	`Customer Type`,
    count(*) as total_passengers,
    avg(`flight distance`) as 'average flight distance',
    max(`flight distance`) as 'maximum flight distance',
    min(`flight distance`) as 'minimum flight distance'
from airline_passengers
group by `Customer type`;

-- 23 satisfsction rate of customer type and travel class
with a as (select
				`Customer Type`,
                class,
                case when satisfaction='True' then 1 else 0 end as satisfied
		   from airline_passengers)
select
	`Customer Type`,
	class,
    round((sum(satisfied)/count(*))*100,2) as satisfaction_rate
from a
group by `Customer Type`,class;

-- 24 Average Flight Distance according to customer type and travel type
select 
	`Customer Type`,
    `type of travel`,
    count(*) as total_passengers,
    avg(`flight distance`) as 'average flight distance'
from airline_passengers
group by `Customer type`,`type of travel`;

```sql
/*
My Observations from Customer Satisfaction Analysis:

1. In my dataset, 55.70% of passengers were dissatisfied,
   while 44.30% were satisfied. This shows that more than
   half of the passengers were dissatisfied.

2. Loyal customers had a satisfaction rate of 49.47%,
   compared to 19.96% for disloyal customers.

3. Business class had the highest satisfaction rate at
   72.56%, followed by Eco Plus at 24.58% and Eco at 16.61%.

4. Passengers travelling for business purposes had a
   satisfaction rate of 58.40%, while personal travellers
   had a satisfaction rate of 9.63%.

5. The satisfaction rate for male passengers was 44.84%,
   slightly higher than the 43.74% for female passengers.

6. The dissatisfaction rate was 50.53% among loyal customers
   and 80.04% among disloyal customers.

7. Baggage Handling had the highest average service rating
   at 3.8052, while Inflight WiFi had the lowest at 2.7779.
   Online Booking also had a relatively low average rating
   of 2.8143.

8. Passengers without departure delays had a satisfaction
   rate of 44.72%, compared to 40.12% for passengers with
   departure delays.

9. These results helped me identify differences in passenger
   satisfaction across customer types, travel classes,
   travel purposes, genders, service ratings, and delay status.

10. These findings describe patterns in my dataset. Further
    analysis would be needed to understand the reasons behind
    these differences.
*/
```