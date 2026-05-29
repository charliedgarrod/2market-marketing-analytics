-- Conversion rate by country
select
	country,
	round(sum(successfully_converted)::decimal / count(*) * 100, 2) as conversion_rate
from marketing_data
group by 1
order by 2 desc;

-- Montenegro are most receptive to ads on a relative basis (33%), however, when reflecting on the pattern of this analysis so far, that number is statistcally misleading
-- given that accounts for 1 of only 3 customers. Australia and the US are the least receptive at 24.30% and 23.29% respectively. This is a low hanging fruit for 
-- 2Market as they are both western English speaking countries and so one marketing campaign could effectively target both regions, doubling reach whilst limiting ad spend.

-- Conversion rate by channel
select
	round(sum(case when a.bulkmail_ad = 1 then m.successfully_converted end) / count(a.bulkmail_ad)::decimal * 100,2)  as bulkmail_conversion,
	round(sum(case when a.twitter_ad = 1 then m.successfully_converted end) / count(a.twitter_ad)::decimal * 100,2)  as twitter_conversion,
	round(sum(case when a.instagram_ad = 1 then m.successfully_converted end) / count(a.instagram_ad)::decimal * 100,2)  as instagram_conversion,
	round(sum(case when a.facebook_ad = 1 then m.successfully_converted end) / count(a.facebook_ad)::decimal * 100,2)  as facebook_conversion,
	round(sum(case when a.brochure_ad = 1 then m.successfully_converted end) / count(a.brochure_ad)::decimal * 100,2)  as brochure_conversion
from marketing_data m
left join ad_data a
on m.id = a.id;

-- Instagram has the best conversion rate at 15.03% closely followed by Facebook and Twitter (13.28% and 13.23% respectively).
-- The more traditional ad channels lag behind quite significantly. Bulkmail only converts 9.77% and brochure adverts convert 4.01%.
-- 2Market may wish to drop the least effective ad channels and reallocate that ad spend to either the current digital avenues, or explore other
-- avenues such as YouTube and/ or TikTok.

-- Channel success by age
select
	case
		when m.age between 20 and 30 then '20-30'
		when m.age between 31 and 40 then '31-40'
		when m.age between 41 and 50 then '41-50'
		when m.age between 51 and 60 then '51-60'
		when m.age between 61 and 70 then '61-70'
		else ' Over 70'
	end as age_bracket,
	count(m.*) as bracket_population,
	coalesce(round(sum(case when a.bulkmail_ad = 1 then m.successfully_converted end) / count(a.bulkmail_ad)::decimal * 100,2),0)  as bulkmail_conversion,
	coalesce(round(sum(case when a.twitter_ad = 1 then m.successfully_converted end) / count(a.twitter_ad)::decimal * 100,2),0)  as twitter_conversion,
	coalesce(round(sum(case when a.instagram_ad = 1 then m.successfully_converted end) / count(a.instagram_ad)::decimal * 100,2),0)  as instagram_conversion,
	coalesce(round(sum(case when a.facebook_ad = 1 then m.successfully_converted end) / count(a.facebook_ad)::decimal * 100,2),0)  as facebook_conversion,
	coalesce(round(sum(case when a.brochure_ad = 1 then m.successfully_converted end) / count(a.brochure_ad)::decimal * 100,2),0)  as brochure_conversion
from marketing_data m
left join ad_data a
on m.id = a.id
group by 1
order by 1;

select
	case
		when m.age between 20 and 30 then '20-30'
		when m.age between 31 and 40 then '31-40'
		when m.age between 41 and 50 then '41-50'
		when m.age between 51 and 60 then '51-60'
		when m.age between 61 and 70 then '61-70'
		else ' Over 70'
	end as age_bracket,
	count(m.*) as bracket_population,
	(coalesce(round(sum(case when a.twitter_ad = 1 then m.successfully_converted end) / count(a.twitter_ad)::decimal * 100,2),0)
		+ coalesce(round(sum(case when a.instagram_ad = 1 then m.successfully_converted end) / count(a.instagram_ad)::decimal * 100,2),0)
		+ coalesce(round(sum(case when a.facebook_ad = 1 then m.successfully_converted end) / count(a.facebook_ad)::decimal * 100,2),0)) as digital_ad_conversion,
	(coalesce(round(sum(case when a.brochure_ad = 1 then m.successfully_converted end) / count(a.brochure_ad)::decimal * 100,2),0) +
		coalesce(round(sum(case when a.bulkmail_ad = 1 then m.successfully_converted end) / count(a.bulkmail_ad)::decimal * 100,2),0)) as traditional_ad_conversion
from marketing_data m
left join ad_data a
on m.id = a.id
group by 1
order by 1;

-- Digital ads dominate across the board. In the world in which we live this might not seem surprising, however what is a shock is that this is true across all age brackets.
-- The over 70s have a digital ad conversion rate of 50.16% where traditional ads only convert 8.95%. Likewise with the 61-70 age bracket where digital ads convert
-- 42.41% and traditional ads convert 15.63%. The 20-30 age bracket is where this changes (digital ads 28.57% and traditional ads 42.86%) however there are only 7 customers
-- in this age bracket. This is possible insight in itself, 2Market either doesnt appeal to the younger generation or the small sample
-- size suggests it's a potentially high growth demographic. The reality is we have insufficient data to make a recommendation on this demographic specifically.

-- Channel success by marital status
select
	m.marital_status,
	count(m.*) as bracket_population,
	coalesce(round(sum(case when a.bulkmail_ad = 1 then m.successfully_converted end) / count(a.bulkmail_ad)::decimal * 100,2),0)  as bulkmail_conversion,
	coalesce(round(sum(case when a.twitter_ad = 1 then m.successfully_converted end) / count(a.twitter_ad)::decimal * 100,2),0)  as twitter_conversion,
	coalesce(round(sum(case when a.instagram_ad = 1 then m.successfully_converted end) / count(a.instagram_ad)::decimal * 100,2),0)  as instagram_conversion,
	coalesce(round(sum(case when a.facebook_ad = 1 then m.successfully_converted end) / count(a.facebook_ad)::decimal * 100,2),0)  as facebook_conversion,
	coalesce(round(sum(case when a.brochure_ad = 1 then m.successfully_converted end) / count(a.brochure_ad)::decimal * 100,2),0)  as brochure_conversion
from marketing_data m
left join ad_data a
on m.id = a.id
group by 1
order by 1;

select
	m.marital_status,
	count(m.*) as bracket_population,
	(coalesce(round(sum(case when a.twitter_ad = 1 then m.successfully_converted end) / count(a.twitter_ad)::decimal * 100,2),0)
		+ coalesce(round(sum(case when a.instagram_ad = 1 then m.successfully_converted end) / count(a.instagram_ad)::decimal * 100,2),0)
		+ coalesce(round(sum(case when a.facebook_ad = 1 then m.successfully_converted end) / count(a.facebook_ad)::decimal * 100,2),0)) as digital_ad_conversion,
	(coalesce(round(sum(case when a.brochure_ad = 1 then m.successfully_converted end) / count(a.brochure_ad)::decimal * 100,2),0) +
		coalesce(round(sum(case when a.bulkmail_ad = 1 then m.successfully_converted end) / count(a.bulkmail_ad)::decimal * 100,2),0)) as traditional_ad_conversion
from marketing_data m
left join ad_data a
on m.id = a.id
group by 1
order by 1;

-- Like the age demographic, marital status bares similar results. Digital ads are far more successful across marital statuses, with widows 
-- (57.74% vs 10.96% for traditional ads) being most respondent.
-- Given the sample sizes, married couples (41.88% vs 12.89%) and unmarried couples (41.92% vs 17.75%) tell the most compelling story, 
-- that digital ads truly are the most effective ad channels.
-- Like the 20-30 year olds in the previous query, the Unknown marital statuses have a small sample size and therefore their results are a statistical artefact.