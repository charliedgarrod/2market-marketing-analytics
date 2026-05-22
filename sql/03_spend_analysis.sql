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

-- Spend by marital status by product category
select
	maritaL_status,
	sum(alcohol) as total_alcohol_spend,
	sum(vegetables) as total_vegetable_spend,
	sum(meat) as total_meat_spend,
	sum(fish) as total_fish_spend,
	sum(chocolate) as total_chocolate_spend,
	sum(commodities) as total_commodity_spend,
	sum(total_spend) as total_spend,
	sum(total_spend)/count(*) as per_capita_total_spend
from marketing_data
group by 1
order by 8 desc;

-- The married customers spent the most in total at $497,463. The caveat to this of course is that the married customers make up the largest proportion of customers.
-- When adjusting for population size it is the widowed customers who spend the most at $736.
-- Similarly to the different age brackets, alcohol dominates across all marital statuses.

-- Spend by education level by product category
select
	education,
	sum(alcohol) as total_alcohol_spend,
	sum(vegetables) as total_vegetable_spend,
	sum(meat) as total_meat_spend,
	sum(fish) as total_fish_spend,
	sum(chocolate) as total_chocolate_spend,
	sum(commodities) as total_commodity_spend,
	sum(total_spend) as total_spend,
	sum(total_spend)/count(*) as per_capita_total_spend
from marketing_data
group by 1
order by 8 desc;

-- The customers with a bachelors degree spent the most in total at 681,621. Again, the caveat to this is that the degree educated customers 
-- make up the largest proportion of customers.
-- When adjusting for population size it is the customers with a PhD who spend the most at $672. This is interesting as, proportionately, the highest earners don't spend alot
-- of their disposable income, despite having the highest per capita spend.
-- The pattern of alcohol dominating shifts a little with education level. Amongst those educated beyond a secondary education, alcohol is still the dominant product.
-- However, amongst those educated to a basic level, alcohol is the least popular product.

-- Spend by marital status and number of children
select
	maritaL_status,
	totalchildren,
	sum(alcohol) as total_alcohol_spend,
	sum(vegetables) as total_vegetable_spend,
	sum(meat) as total_meat_spend,
	sum(fish) as total_fish_spend,
	sum(chocolate) as total_chocolate_spend,
	sum(commodities) as total_commodity_spend,
	sum(total_spend) as total_spend,
	sum(total_spend)/count(*) as per_capita_total_spend
from marketing_data
group by 1, 2
order by 10 desc;

-- Perhaps unsurprisingly, it is married customers with no children, i.e. dual income with no kids, who spend the most in total at $236,863.
-- It is those customers with an unknown marital status and no children who spend the most per capita ($1,192) followed very closely by cohabiting customers with no kids ($1,190).
-- The top per capita spots are dominated by customers with no children, logical given fewer financial responsibilities and greater disposable income..
-- Once again, alcohol is the dominant product across marital statuses and child count.

-- Country spend as percentage of total spend
select
	country,
	sum(total_spend) as total_spend,
	round(SUM(total_spend) / SUM(SUM(total_spend)) OVER () * 100,2) AS percentage_of_total
	from marketing_data
group by 1
order by 3 desc;

-- As expected, Spain makes up the lion share of total_spend at 48.27% while Montenegro only accounts for 0.24%. But we know this would be the case.
