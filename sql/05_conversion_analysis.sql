-- Conversion rate by country

select
	country,
	round(sum(successfully_converted)::decimal / count(*) * 100, 2) as conversion_rate
from marketing_data
group by 1
order by 2 desc;

-- Montenegro are most receptive to ads on a relative basis (33%), however, when reflecting on the pattern of this analysis so far, that number is statistcally misleading
-- given that accounts for 1 of only 3 customers. Australia and the US are the least receptive at 24.30% and 23.29% respectively. This is a low hanging fruit for 
-- 2Market as they are both western English speaking countries and so one marketing campaign could effectively target both regions.

-- Conversion rate by channel (WIP)