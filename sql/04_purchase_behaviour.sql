-- Analysing the purchasing behaviours of 2Market's customers

-- Web vs in store purchasing
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

-- Deal-seekers vs full price buyers (WIP)
