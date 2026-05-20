-- This will focus on analysing the demographic makeup of 2Market's customers
-- Customer age

select
	case
		when age between 20 and 30 then '20-30'
		when age between 31 and 40 then '31-40'
		when age between 41 and 50 then '41-50'
		when age between 51 and 60 then '51-60'
		when age between 61 and 70 then '61-70'
		else ' Over 70'
	end as age_bracket,
	count(*) as customer_count
from marketing_data
group by 1
order by 2 desc;

select
	country,
	round(avg(age),2)
from marketing_data
group by 1
order by 2 desc;

-- The 51-60 ag bracket clearly the largest section of 2Markets customers.
-- Average age ranges from 52.67 in Montenegro to 57.32 in Australia.

-- Income
select
	case
		when age between 20 and 30 then '20-30'
		when age between 31 and 40 then '31-40'
		when age between 41 and 50 then '41-50'
		when age between 51 and 60 then '51-60'
		when age between 61 and 70 then '61-70'
		else ' Over 70'
	end as age_bracket,
	round(avg(income),2) as avg_income
from marketing_data
group by 1
order by 2 desc;

select
	country,
	round(avg(income),2) as avg_income
from marketing_data
group by 1
order by 2 desc;

select
	education,
	round(avg(income),2) as avg_income
from marketing_data
group by 1
order by 2 desc;

-- Marital status (WIP)