create database cybersecurity_analysis;
use cybersecurity_analysis;
create table cyberthreats(
country varchar(225), year int, attack_type varchar(225),target_industry varchar(225),
financial_loss_in_million_dollars float, number_of_affected_users int, attack_source varchar(225),
security_vulnerability_type varchar(225), defence_mechanism_used varchar(225),
incident_resolution_time_in_hours int
);

#VIEW THE DATA
select * from cyberthreats;

#COUNT TOTAL CYBERSECURITY INCIDENTS
select count(*) as number_of_affected_users from cyberthreats;

#NUMBER OF INCIDENTS PER YEAR
select year,count(*) as total_incidents
from cyberthreats
group by year
order by year asc;

#MOST TARGETED COUNTRIES
select country,count(*) as total_incidents
from cyberthreats
group by country
order by total_incidents desc
limit 10;

#MOST COMMON ATTACK TYPES
select attack_type,count(*) as occurrences
from cyberthreats
group by attack_type
order by occurrences desc
limit 5;

#INDUSTRIES MOST AFFECTED BY CYBERATTACKS
select target_industry,count(*) as total_attacks
from cyberthreats
group by target_industry
order by total_attacks desc
limit 10;

#ATTACK SOURCES WITH THE MOST CYBER THREATS
select attack_source,count(*) as attack_count
from cyberthreats
group by attack_source
order by attack_count desc
limit 10;

#TOTAL FINANCIAL LOSS DUE TO CYBERATTACKS
select sum(financial_loss_in_million_dollar) as total_financial_loss
from cyberthreats;

#FINANCIAL LOSS BY YEAR
select year, sum(financial_loss_in_million_dollar) as yearly_financial_loss
from cyberthreats
group by year
order by year asc;

#TOP 5 MOST COSTLY ATTACKS
select attack_type,sum(financial_loss_in_million_dollar) as total_loss
from cyberthreats
group by attack_type
order by total_loss desc
limit 5;

#NUMBER OF USERS AFFECTED PER YEAR
select year,sum(number_of_affected_users) as total_affected_users
from cyberthreats
group by year
order by year asc;

#SECURITY VULNERABILITIES LEADING TO MOST ATTACKS
select security_vulnerability_type,count(*) as occurrences
from cyberthreats
group by security_vulnerability_type
order by occurrences desc
limit 5;

#EFFECTIVENESS OF DEFENSE MECHANISMS
select defense_mechanism_used,count(*) as attack_count
from cyberthreats
group by defense_mechanism_used
order by attack_count desc;

#AVERAGE INCIDENT RESOLUTION TIME BY YEAR
select year,avg(incident_resolution_time_in_hours) as avg_resolution_time
from cyberthreats
group by year
order by year asc;

#FASTEST Vs SLOWEST INCIDENT RESOLUTION BY INDUSTRY
select target_industry,
min(incident_resolution_time_in_hours) as fastest_resolution,
max(incident_resolution_time_in_hours) as slowest_resolution,
avg(incident_resolution_time_in_hours) as avg_resolution_time
from cyberthreats
group by target_industry
order by avg_resolution_time desc;