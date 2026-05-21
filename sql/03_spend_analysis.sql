-- Analysis of the spending data

-- Total and per capita spend by country
select
	country,
	sum(total_spend) as total_spend,
	sum(total_spend)/count(*) as per_capita_spend
from marketing_data
group by 1
order by 3 desc;

-- The total spend follows the same story as the customer count by country - Spain has, by far the highest spend ($636,151) given its largest representation.
-- However when per capita spend is considered, Spain ranks in the bottom 3 with 604 where Montenegro goes from lowest total spend ($3,122) to highest per capita spend ($1,040).
-- As mentioned, the Montenegro per capita spend should be treated with caution given its 3 customer records.

-- Spend by product category across age brackets
select
	case
		when age between 20 and 30 then '20-30'
		when age between 31 and 40 then '31-40'
		when age between 41 and 50 then '41-50'
		when age between 51 and 60 then '51-60'
		when age between 61 and 70 then '61-70'
		else ' Over 70'
	end as age_bracket,
	sum(alcohol) as total_alcohol_spend,
	sum(vegetables) as total_vegetable_spend,
	sum(meat) as total_meat_spend,
	sum(fish) as total_fish_spend,
	sum(chocolate) as total_chocolate_spend,
	sum(commodities) as total_commodity_spend,
	sum(total_spend) as total_spend
from marketing_data
group by 1
order by 8 desc;

-- The 51-60 age bracket spent the most in total at $363,195. 
-- What is most surprisng is that the Over 70s rank third lowest for total spend ($234,882) despite having the most disposable income. 
-- Alcohol dominates across all age groups apart from the 20-30 year old age bracket where meat is the most popular product.









