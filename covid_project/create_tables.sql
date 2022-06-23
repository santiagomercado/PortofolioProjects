DROP TABLE IF EXISTS `covid_deaths`;
CREATE TABLE `covid_deaths` (
  `iso_code` text,
  `continent` text,
  `location` text,
  `date` datetime DEFAULT NULL,
  `total_cases` int(11) DEFAULT NULL,
  `new_cases` int(11) DEFAULT NULL,
  `new_cases_smoothed` double DEFAULT NULL,
  `total_deaths` bigint(20) DEFAULT NULL,
  `new_deaths` bigint(20) DEFAULT NULL,
  `new_deaths_smoothed` double DEFAULT NULL,
  `total_cases_per_million` double DEFAULT NULL,
  `new_cases_per_million` double DEFAULT NULL,
  `new_cases_smoothed_per_million` double DEFAULT NULL,
  `total_deaths_per_million` double DEFAULT NULL,
  `new_deaths_per_million` double DEFAULT NULL,
  `new_deaths_smoothed_per_million` double DEFAULT NULL,
  `reproduction_rate` double DEFAULT NULL,
  `icu_patients` bigint(20) DEFAULT NULL,
  `icu_patients_per_million` double DEFAULT NULL,
  `hosp_patients` bigint(20) DEFAULT NULL,
  `hosp_patients_per_million` double DEFAULT NULL,
  `weekly_icu_admissions` bigint(20) DEFAULT NULL,
  `weekly_icu_admissions_per_million` double DEFAULT NULL,
  `weekly_hosp_admissions` bigint(20) DEFAULT NULL,
  `weekly_hosp_admissions_per_million` double DEFAULT NULL
);

DROP TABLE IF EXISTS `covid_vaccinations`;
CREATE TABLE `covid_vaccinations` (
  `iso_code` text,
  `continent` text,
  `location` text,
  `date` datetime DEFAULT NULL,
  `total_tests` bigint(20) DEFAULT NULL,
  `new_tests` bigint(20) DEFAULT NULL,
  `total_tests_per_thousand` double DEFAULT NULL,
  `new_tests_per_thousand` double DEFAULT NULL,
  `new_tests_smoothed` double DEFAULT NULL,
  `new_tests_smoothed_per_thousand` double DEFAULT NULL,
  `positive_rate` double DEFAULT NULL,
  `tests_per_case` double DEFAULT NULL,
  `tests_units` text,
  `total_vaccinations` bigint(20) DEFAULT NULL,
  `people_vaccinated` bigint(20) DEFAULT NULL,
  `people_fully_vaccinated` bigint(20) DEFAULT NULL,
  `total_boosters` bigint(20) DEFAULT NULL,
  `new_vaccinations` bigint(20) DEFAULT NULL,
  `new_vaccinations_smoothed` bigint(20) DEFAULT NULL,
  `total_vaccinations_per_hundred` double DEFAULT NULL,
  `people_vaccinated_per_hundred` double DEFAULT NULL,
  `people_fully_vaccinated_per_hundred` double DEFAULT NULL,
  `total_boosters_per_hundred` double DEFAULT NULL,
  `new_vaccinations_smoothed_per_million` bigint(20) DEFAULT NULL,
  `new_people_vaccinated_smoothed` bigint(20) DEFAULT NULL,
  `new_people_vaccinated_smoothed_per_hundred` double DEFAULT NULL,
  `stringency_index` double DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `population_density` double DEFAULT NULL,
  `median_age` double DEFAULT NULL,
  `aged_65_older` double DEFAULT NULL,
  `aged_70_older` double DEFAULT NULL,
  `gdp_per_capita` double DEFAULT NULL,
  `extreme_poverty` double DEFAULT NULL,
  `cardiovasc_death_rate` double DEFAULT NULL,
  `diabetes_prevalence` double DEFAULT NULL,
  `female_smokers` double DEFAULT NULL,
  `male_smokers` double DEFAULT NULL,
  `handwashing_facilities` double DEFAULT NULL,
  `hospital_beds_per_thousand` double DEFAULT NULL,
  `life_expectancy` double DEFAULT NULL,
  `human_development_index` double DEFAULT NULL,
  `excess_mortality_cumulative_absolute` double DEFAULT NULL,
  `excess_mortality_cumulative` double DEFAULT NULL,
  `excess_mortality` double DEFAULT NULL,
  `excess_mortality_cumulative_per_million` double DEFAULT NULL
);
