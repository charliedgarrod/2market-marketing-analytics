-- Creating marketing data table
create table marketing_data(
	id integer primary key,
	year_birth integer,
	age integer,
	education varchar(50),
	marital_status varchar(50),
	income numeric,
	kidhome integer,
	teenhome integer,
	totalchildren integer,
	dt_customer date,
	recency integer,
	amtliquid integer,
	amtvege integer,
	amtnonveg integer,
	amtpes integer,
	amtchocolates integer,
	amtcomm integer,
	amttotal integer,
	numdeals integer,
	numwebbuy integer,
	numwalkinpur integer,
	numvisits integer,
	response integer,
	complain integer,
	country varchar(50),
	count_success integer
);

-- Creating the ad data table
create table ad_data (
	id integer primary key,
	bulkmail_ad integer,
	twitter_ad integer,
	instagram_ad integer,
	facebook_ad integer,
	brochure_ad integer
);

-- Check all loaded successfully
select
	*
from marketing_data
limit 10;

select
	*
from ad_data
limit 10;

-- Updating column names in marketing data to make them more user friendly

alter table marketing_data
	rename column amtliquid to alcohol;

alter table marketing_data
	rename column amtvege to vegetables;

alter table marketing_data
	rename column amtnonveg to meat;

alter table marketing_data
	rename column amtpes to fish;

alter table marketing_data
	rename column amtchocolates to chocolate;

alter table marketing_data
	rename column amtcomm to commodities;

alter table marketing_data
	rename column amttotal to total_spend;

alter table marketing_data
	rename column numdeals to discounted_purchases;

alter table marketing_data
	rename column numwebbuy to web_purchases;

alter table marketing_data
	rename column numwalkinpur to walk_in_purchases;

alter table marketing_data
	rename column numvisits to monthly_website_visits;

alter table marketing_data
	rename column response to promotion_accepted;

alter table marketing_data
	rename column complain to made_complaint;

alter table marketing_data
	rename column count_success to successfully_converted;












