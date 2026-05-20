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


