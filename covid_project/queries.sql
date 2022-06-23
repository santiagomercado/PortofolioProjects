USE covid1;

-- Total Cases vs Total Deaths
-- Shows the likelihood of dying of covid
SELECT
		location,date,
		total_cases,
  	total_deaths,
    (total_deaths/total_cases)*100 as deathpercentage
FROM covid_deaths;

-- Total Cases vs Population
-- Shows the percentage of population that got covid (per day)
SELECT
    covid_vaccinations.location,
    covid_vaccinations.date,
    covid_vaccinations.population,
    covid_deaths.total_cases,
    TRUNCATE((covid_deaths.total_cases/covid_vaccinations.population)*100,10) as infectionpercentage
FROM covid_vaccinations
INNER JOIN covid_deaths
ON
		covid_vaccinations.iso_code = covid_deaths.iso_code and
		covid_vaccinations.date = covid_deaths.date;


-- Locations with Highest Infection Rate compared to Population
SELECT
		B.location,
    TRUNCATE((A.total_cases/B.population)*100,10) as infectionpercentage
FROM (
	SELECT
		iso_code,
		MAX(total_cases) as total_cases
	FROM covid_deaths
  GROUP BY iso_code) AS A
JOIN (
	SELECT DISTINCT
		iso_code,
    location,
    population
FROM covid_vaccinations
WHERE continent IS NOT NULL) AS B
ON A.iso_code = B.iso_code
ORDER BY infectionpercentage DESC
LIMIT 10;

-- Locations with Higest Death Count
SELECT
		location,
		MAX(total_deaths) as total_deaths
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_deaths DESC
LIMIT 15;

-- Locations with Highest Death Count per Population
SELECT
		B.location,
    TRUNCATE((A.total_deaths/B.population)*100,10) as deathpercentage
FROM (
	SELECT
		iso_code,
		MAX(total_deaths) as total_deaths
	FROM covid_deaths
    GROUP BY iso_code) AS A
JOIN (
	SELECT DISTINCT
		iso_code,
    population,
    location
FROM covid_vaccinations
WHERE continent IS NOT NULL) AS B
ON A.iso_code = B.iso_code
ORDER BY deathpercentage DESC
LIMIT 10;

-- Death Count per Continent
SELECT
		A.continent,
    SUM(A.total_deaths) as deaths
FROM (
	SELECT
			location,
		  continent,
		  MAX(total_deaths) as total_deaths
	FROM covid_deaths
	WHERE continent IS NOT NULL
	GROUP BY location,continent
) AS A
GROUP BY continent;


-- Global Numbers
SELECT
		SUM(A.total_deaths) as global_deaths
FROM (
	SELECT
			location,
		  continent,
		  MAX(total_deaths) as total_deaths
	FROM covid_deaths
	WHERE continent IS NOT NULL
	GROUP BY location,continent
) AS A;

-- Global Deaths (per day)
SELECT
		date,
	  SUM(total_deaths) as total_deaths
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY date;

-- Total Population vs People with at least one vaccine
SELECT
		location,
	  MAX(people_vaccinated/population)*100 as people_vaccinated
FROM covid_vaccinations
WHERE continent IS NOT NULL
GROUP BY location;

-- Creating View to store data for later visualizations
CREATE VIEW DeathCountPerContinent as
SELECT
		A.continent,
    SUM(A.total_deaths)
FROM (
	SELECT
			location,
		  continent,
		  MAX(total_deaths) as total_deaths
	FROM covid_deaths
	WHERE continent IS NOT NULL
	GROUP BY location,continent
) AS A
GROUP BY continent;
