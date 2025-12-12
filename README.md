#  COVID-19 SQL Data Analysis

This project contains SQL scripts used to explore, analyze, and derive insights from a COVID-19 dataset.  
It demonstrates SQL fundamentals as well as intermediate analytical concepts using real-world pandemic data.

---

##  Project Overview

The SQL script includes a wide range of queries covering:

### ** Basic Data Analysis**
- Counting total records
- Listing unique countries
- Renaming tables
- Viewing complete dataset

### ** Arithmetic Operations**
- Calculating total cases + deaths
- Case–death differences
- Death rate calculations
- Cases per million population
- Active cases calculation
- Increasing deaths by 5% (growth factor)

### ** Relational Operators**
- Filtering data using `>`, `<`, `>=`, `<=`, `=`
- Extracting records by month, year, and population
- Identifying anomalies (cases < deaths)

### ** Logical Operators**
- AND / OR conditions
- Excluding records using NOT
- Combined criteria for meaningful insights
- Filtering by multiple months, years, or conditions

### ** Sorting**
- Ordering by cases (ASC/DESC)
- Ordering by deaths

### ** Special Operators**
- `BETWEEN` ranges
- `IN` list filtering
- Pattern matching using `LIKE`
- Checking for NULL / NOT NULL
- Population range queries

### ** CASE Statements**
Classification-based insights, including:
- Case severity (High / Medium / Low)
- Death severity categories
- Population size classification
- Lockdown likelihood
- First-half vs second-half of year tagging

---

##  Dataset Used
The script works on the **ECDC COVID-19 dataset**, containing fields such as:

- `countriesAndTerritories`
- `cases`
- `deaths`
- `dateRep`
- `geoId`
- `popData2018`
- `month`
- `year`

---

## Skills Demonstrated

This project highlights proficiency in:

- SQL data cleaning & transformation  
- Applying arithmetic & logical operators  
- Using relational operators effectively  
- Writing optimized filtering conditions  
- Using CASE expressions for categorization  
- Performing exploratory data analysis (EDA)  
- Using pattern matching & special operators  
- Extracting meaningful insights from public health data  

---

## How to Use

1. Import the SQL file into **MySQL** (recommended).
2. Create the database using:
   ```sql
   CREATE DATABASE covid;
   USE covid;
## Purpose of This Project

This SQL script was developed to strengthen analytical skills, explore real-world data patterns, and practice writing production-ready SQL queries using a globally recognized dataset.
