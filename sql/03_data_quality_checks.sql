use airline_analytics;

-- check total records
select 
	count(*) as total_records 
from airline_passengers;

-- check duplicate ids
select 
	id,
    count(*) as occurrences 
from airline_passengers
group by id having count(*)>1;

-- check missing arrival delays
select 
	count(*) as total_records,
    count('Arrival Delay in Minutes') as non_null_arrival_delays,
    sum('Arrival Delay in Minutes' is null) as missing_arrival_delays 
from airline_passengers;

-- check satisfation distribution
select
	satisfaction,
    count(*) as passenger_count
from airline_passengers
group by satisfaction;

-- chech age range
select 
	min(Age) as minimum_age,
    max(Age) as maximum_age,
    avg(Age) as aveage_age 
from airline_passengers;

-- check id range
select
	count(*) as total_records,
    min(id) as minimum_id,
    max(id) as maximum_id,
    count(distinct id) as unique_ids
from airline_passengers;