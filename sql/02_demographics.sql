-- This will focus on analysing the demographic makeup of 2Market's customers
-- Customer age

-- Customer count by age bracket
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

-- Average age by country
select
	country,
	round(avg(age),2)
from marketing_data
group by 1
order by 2 desc;

-- The 51-60 ag bracket clearly the largest section of 2Markets customers.
-- Average age ranges from 52.67 in Montenegro to 57.32 in Australia.

-- Income

-- Average income by customer age bracket
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

-- Average income by country (per capita income)
select
	country,
	round(avg(income),2) as avg_income,
	count(*) as customer_count
from marketing_data
group by 1
order by 2 desc;


-- Average income by education level
select
	education,
	round(avg(income),2) as avg_income
from marketing_data
group by 1
order by 2 desc;

-- Interestingly, it is the over 70 age bracket that, on average, earns the most at ~$59,000. This is counter to what one might expect.
-- The income per capita is highest in Montenegro at ~$57,700, although the caveat to this is that there are only 3 records from Montenegro.
-- Unsurprisingly, those possessing a Doctorate (PhD) earn the most at ~$56,000.

-- Family & Background

-- Customer count by marital status
select
	marital_status,
	count(*) as customer_count
from marketing_data
group by 1
order by 2 desc;

-- Customer count by number of children
select
	totalchildren,
	count(*) as customer_count
from marketing_data
group by 1
order by 2 desc;

-- Average number of children by marital status
select 
	marital_status,
	round(avg(totalchildren),2) as avg_total_children
from marketing_data
group by 1
order by 2 desc;

-- Customer count by country
select
	country,
	count(*) as customer_count
from marketing_data
group by 1
order by 2 desc;

-- Married customers were the most common for 2Market with 838 customers being married.
-- Most customers had only 1 child (kid or teen) followed by no children.
-- On average, divorced customers had the most children at just over 1 per household (1.01), while unmarried couples followed with just under 1 per household (0.98).
-- Spain represented the most common nationality amongst the customer base with 1053 customers with Montenegro having the least with 3.

-- Education

select
	education,
	count(*) as customer_count
from marketing_data
group by 1
order by 2 desc;

-- Most customers hold a Bachelors Degree (1090). Whats surprising is that the second most common education level is Doctorate with 470.
-- The least common is those customers who stopped after Secondary Education (54).










