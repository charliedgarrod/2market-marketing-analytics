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
	round(sum(case when a.bulkmail_ad = 1 then m.successfully_converted end) / count(a.bulkmail_ad)::decimal * 100,2)  as bulkmail_conversion,
	round(sum(case when a.twitter_ad = 1 then m.successfully_converted end) / count(a.twitter_ad)::decimal * 100,2)  as twitter_conversion,
	round(sum(case when a.instagram_ad = 1 then m.successfully_converted end) / count(a.instagram_ad)::decimal * 100,2)  as instagram_conversion,
	round(sum(case when a.facebook_ad = 1 then m.successfully_converted end) / count(a.facebook_ad)::decimal * 100,2)  as facebook_conversion,
	round(sum(case when a.brochure_ad = 1 then m.successfully_converted end) / count(a.brochure_ad)::decimal * 100,2)  as brochure_conversion
from marketing_data m
left join ad_data a
on m.id = a.id
group by 1
order by 1;




