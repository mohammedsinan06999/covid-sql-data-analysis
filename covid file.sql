create database covid;
use covid;
select*from ecdc_covid_19;

#Count how many total records are in the dataset.
select count(*)from ecdc_covid_19;

#List all unique countries in the datase
#SELECT DISTINCT countries_and_territories FROM covid_data;

#Rename
alter table ecdc_covid_19 rename to covid;

# ARITHMATIC OPERATOR

#Show each country's total cases plus total deaths
SELECT 
    countriesAndTerritories,
    SUM(cases) + SUM(deaths) AS total_cases_and_deaths
FROM 
    covid GROUP BY 
    countriesAndTerritories;

#Calculate the difference between cases and deaths for each record 
SELECT countriesandterritories,daterep,cases,deaths,(cases - deaths) AS difference FROM covid;

#Calculate the death rate for each record (deaths ÷ cases)
select *,(deaths / cases) as death_rate from covid;

#Find the total affected people by adding cases and deaths.
select cases,deaths,cases+deaths as affected_people from covid;

select * from covid;

# Calculate the cases per million people using cases ÷ popData2018 * 1000000
 
 select cases,popData2018,cases  / popData2018 * 1000000 as cases_per_million from covid ;

#to find the active cases.
select cases,deaths,cases-deaths as Active_cases from covid ;

#Increase deaths by 5% for each record

select geoId,cases,deaths,deaths*1.05 as increased_death_rate from covid;

# Relational operators

#Show all records where cases > 1000.
select* from covid where cases>1000;

#Display countries where deaths < 10.
select * from covid where deaths<10;

#Find records where cases = deaths.
select*from covid where cases=deaths;

#Show data for countries where cases >= 500 and deaths >= 50.
select*from covid where cases>=500 and deaths >=50;

#Display all records where cases <= 100.
select*from covid where cases<=100;

#Find all countries where year = 2020.
select*from covid where year=2020;

#Show records where month != 12 (not December)
select * from covid where month !=12;

#List all countries where population> 50,000,000;
select*from covid where popData2018 > 50000000;

#Display records where cases < deaths .
select * from covid where cases<deaths;

#Show all records where cases >= 1000 OR deaths >= 100.
select*from covid where cases>=1000 or deaths >=100;



# LOGICAL OPERATORS

#Show records where cases > 1000 AND deaths > 100.
select*from covid where cases>1000 and deaths>100;

#Display countries where cases > 5000 OR deaths > 500.
select*from covid where cases > 5000 OR deaths > 500;

#Show all records where year = 2020 AND month = 3.
select*from covid where year = 2020 AND month = 3;

#Display data where month = 5 OR month = 6 (May or June).
select*from covid where month = 5 OR month = 6;

#Find records where cases > 0 AND deaths = 0 (countries with no deaths that day).
select*from covid where cases > 0 AND deaths = 0;

#Show all records where NOT (cases = 0) (means cases are not zero).
select*from covid where cases=0;

#Display data for countries with population > 10,000,000 AND cases > 1000.
select countriesandterritories,cases,geoid,popdata2018 from covid where popdata2018 > 10000000 AND cases > 1000;

#Show records where (cases > deaths) AND (year = 2021).
select*from covid where cases>deaths and year=2021;

#Find all countries where (deaths > 0) OR (cases > 0) (any activity).
select countriesandterritories,cases,deaths,geoid from covid where deaths>0 or cases>0;

#Display records where NOT (month = 12) (exclude December data).
select * from covid where not month=12;

#ORDER BY


#Display all records ordered by cases in ascending order
select countriesAndTerritories,geoid,countryTerritorycode,cases from covid order by cases asc;

#Display all records ordered by cases descending, then by deaths ascending
select *from covid order by  deaths asc;
select *from covid order by  cases desc;


# SPECIAL OPERATORS

#Show records where cases BETWEEN 100 AND 500.
select * from covid where cases between 100 and 500;

#Display all countries where month IN (3, 4, 5) (March to May).
select countriesAndTerritories,month from covid where month in (3,4,5);

#Find all countries where the name LIKE 'In%' (starts with “In”, e.g., India)
select countriesAndTerritories from covid where countriesAndTerritories like 'In%';

#Show records where countriesAndTerritories LIKE '%land%' (contains “land”).
SELECT *FROM covid WHERE countriesAndTerritories LIKE '%land%';

#Display all records where deaths IS NULL
SELECT *FROM covid WHERE deaths IS NULL;

#Display all records where deaths IS NOT NULL
SELECT * FROM covid WHERE deaths IS NOT NULL;

#Show all records where year BETWEEN 2020 AND 2021
SELECT *FROM covid WHERE year BETWEEN 2020 AND 2021;

#Find countries where geoId IN ('IN', 'US', 'FR', 'IT')
SELECT *FROM covid WHERE geoId IN ('IN', 'US', 'FR', 'IT');

#Show all data where countriesAndTerritories NOT LIKE '%a%' (names without the letter “a”)
SELECT * FROM covid WHERE countriesAndTerritories NOT LIKE '%a%';

#Display countries whose population (popData2018) is BETWEEN 1,000,000 AND 10,000,000
SELECT * FROM covid WHERE popData2018 BETWEEN 1000000 AND 10000000;

#CASE STATEMENT

#Create a new column case_level
SELECT 
    countriesAndTerritories,
    cases,
    CASE
        WHEN cases > 1000 THEN 'High'
        WHEN cases BETWEEN 100 AND 1000 THEN 'Medium'
        ELSE 'Low'
    END AS case_level
FROM covid;

#Add a column death_severity
SELECT 
    countriesAndTerritories,
    deaths,
    CASE
        WHEN deaths > 500 THEN 'Critical'
        WHEN deaths BETWEEN 100 AND 500 THEN 'Moderate'
        ELSE 'Low'
    END AS death_severity
FROM covid;


#Classify countries by population size
SELECT 
    countriesAndTerritories,
    popData2018,
    CASE
        WHEN popData2018 > 50000000 THEN 'Large'
        WHEN popData2018 BETWEEN 10000000 AND 50000000 THEN 'Medium'
        ELSE 'Small'
    END AS population_category
FROM covid;

#Create a column showing ‘Lockdown likely’ or ‘Normal’
SELECT 
    countriesAndTerritories,
    cases,
    deaths,
    CASE
        WHEN cases > 10000 AND deaths > 1000 THEN 'Lockdown likely'
        ELSE 'Normal'
    END AS lockdown_status
FROM covid;

#Label months as ‘First Half’ or ‘Second Half’
SELECT 
    countriesAndTerritories,
    month,
    CASE
        WHEN month <= 6 THEN 'First Half'
        ELSE 'Second Half'
    END AS half_of_year
FROM covid;