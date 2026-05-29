-- Customer segmentation analysis
with rfm_score as (with customer_metrics as (
select
	id,
	recency,
	total_spend as monetary_value,
	(web_purchases + walk_in_purchases) as frequency
from marketing_data
)
select
    *,
    4 - ntile(3) over(order by recency) as recency_score,
    ntile(3) over(order by monetary_value) as monetary_score,
    ntile(3) over(order by frequency) as frequency_score
from customer_metrics)
select 
	case 
		when(recency_score + monetary_score + frequency_score) between 8 and 9 then 'Champions'
		when(recency_score + monetary_score + frequency_score) between 6 and 7 then 'Loyal Customers'
		when(recency_score + monetary_score + frequency_score) between 3 and 5 then 'At Risk'
		else 'Lost'
	end as rfm_segmentation,
	count(*) as customer_count,
	round(avg(monetary_value), 2) as avg_spend,
	round(avg(recency), 2) as avg_recency,
	round(avg(frequency), 2) as avg_frequency
from rfm_score
group by 1
order by 2 desc;

-- From the RFM analysis we can see that champions purchased 27 days ago on average, made 15 purchases and averaged a spend of $1,210.82.
-- Loyal customers shopped as recently as at risk customers (55.38 vs 55.45 days on average), however were more frequent at 11.83 visits on average and spent
-- 8x more than those at risk ($807.03 avg spend). The at risk customers only spent an average of $101.41 and only visited 5.15 times on average.
-- Whats more worrying is that this makes up the largest segment, something 2Market will need to address.

-- Creating a view of the RFM data for PowerBI

create view rfm_segments as
with customer_metrics as (
    select
        id,
        recency,
        total_spend as monetary_value,
        (web_purchases + walk_in_purchases) as frequency
    from marketing_data
),
rfm_score as (
    select
        *,
        4 - ntile(3) over(order by recency) as recency_score,
        ntile(3) over(order by monetary_value) as monetary_score,
        ntile(3) over(order by frequency) as frequency_score
    from customer_metrics
)
select 
    id,
    recency,
    monetary_value,
    frequency,
    recency_score,
    monetary_score,
    frequency_score,
    case 
        when (recency_score + monetary_score + frequency_score) between 8 and 9 then 'Champions'
        when (recency_score + monetary_score + frequency_score) between 6 and 7 then 'Loyal Customers'
        when (recency_score + monetary_score + frequency_score) between 3 and 5 then 'At Risk'
    end as rfm_segment
from rfm_score;