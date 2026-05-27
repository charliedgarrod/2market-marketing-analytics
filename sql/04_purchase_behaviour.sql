-- Analysing the purchasing behaviours of 2Market's customers

-- Web vs in store purchasing by country
select
	country,
	sum(web_purchases) as num_web_purchases,
	sum(walk_in_purchases) as num_in_store_purchases,
	round(sum(walk_in_purchases) / sum(web_purchases)::decimal,2) as ratio_of_store_to_web_purchases,
	sum(web_purchases + walk_in_purchases) as total_purchases,
	sum(web_purchases + walk_in_purchases) / count(*) as total_purchases_per_capita
from marketing_data
group by 1
order by 5 desc;

-- Unsurprisingly at this point, the number of purchases follows a similar pattern to spend data. In total, Spain made the most total purchases at 10,322
-- With Montenegro making the fewest at 37. When adjusting for the population, however, that flips. Montenegro made 12 purchases per capita
-- While India, Australia and, crucially, Spain made the fewest at 9 per capita. 
-- Whats perhaps most interesting is the domination of in store purchases over web purchases. For every web purchase there are between 6% and 44% more in store purchases.
-- Despite an advancement in technology, it is the bricks and mortar store visits that are the most common mode of making a purchase.

-- Web vs in store purchasing by marital status
select
	marital_status,
	sum(web_purchases) as num_web_purchases,
	sum(walk_in_purchases) as num_in_store_purchases,
	round(sum(walk_in_purchases) / sum(web_purchases)::decimal,2) as ratio_of_store_to_web_purchases,
	sum(web_purchases + walk_in_purchases) as total_purchases,
	sum(web_purchases + walk_in_purchases) / count(*) as total_purchases_per_capita
from marketing_data
group by 1
order by 5 desc;

-- In absolute terms, it is the married couples who make the most purchases across both in store and web (total 8332), however, when adjusted for the population size,
-- they actually make the fewest purchases (9 per capita). They tend to prefer making purchases in store as opposed to on the web (43% more likely).
-- The widowed and unknown statuses make the fewest purchases (812 and 46 respectively) given their relatively smaller population size, however their per capita figures sit at
-- 11 purchases. All marital statuses are more likely to purchases in bricks and mortar stores as opposed to online (between 19% and 45% more likely).

-- Deal-seekers vs full price buyers
with deal_seekers as(
select
	country,
	sum(discounted_purchases) as discounted_purchases,
	sum(web_purchases + walk_in_purchases) as total_purchases
from marketing_data
group by 1
)
select
	country,
	sum(discounted_purchases) as discounted_purchases,
	sum(total_purchases) as total_purchases,
	round(sum(discounted_purchases) / sum(total_purchases)::decimal * 100, 2) as pct_discounted_purchases
from deal_seekers
group by 1
order by 4 desc;

-- As we might expect, the absolute number of discounted purchases in Spain is high (2374) given their large population, 
-- however they're about mid pack with regards to proportion (23%). 
-- The biggest deal seekers are India (26.90%) while Montenegro are most likely to pay full price,
-- however the normal caveat applies.

-- Customer engagement

select
	country,
	round(sum(web_purchases) / sum(monthly_website_visits)::decimal * 100 ,2) as conversion_rate
from marketing_data
group by 1
order by 2 desc;

-- Montenegro have the highest conversion rate, however, at a population of 3, the 100% conversion rate is almost certainly a statistical artefact and not actionable insight.
-- The most telling insight is India's 71.34% conversion rate, the lowest among the countries. This is painting an interesting story.
-- Indian customers tend to browse more, buy less, and when they do buy they tend to prefer discounts.



