# Covid Project

In this project I wrote queries that retrieve interesting infromation about the pandemic situation arround the world. The dataset that I used was taken from https://ourworldindata.org/covid-deaths. It is an accurate an complete dataset that provides data at a very granular level.

## Description
This project contains:  
- `owid_covid_data.csv`: This is the dataset that was taken from https://ourworldindata.org/covid-deaths.
- `covid_deaths.csv` and `covid_vaccinations.csv`: Each of these files contains subset data from `owid_covid_data.csv`.
- `create_table.sql`: Creates two tables where the csv data will be stored.
- `queries.sql`: Contains all the queries.
- `script.sh`: Configure everything in order to have the project up and running. There are two parameters (`user` and `password`) that must be set up properly in case you want to run the project locally.
