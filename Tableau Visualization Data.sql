--Queries for tableau visualizations

SELECT * FROM Project1..Deaths
SELECT * FROM Project1..Vaccinations

SELECT SUM(new_cases) as TotalCases, SUM(cast(new_deaths as bigint)) as TotalDeaths, (SUM(cast(new_deaths as bigint))/ SUM(new_cases))*100 as DeathPercentage
FROM Project1..Deaths
WHERE continent is not null
ORDER BY 1,2

--2

SELECT location, SUM(cast(new_deaths as bigint)) as TotalDeathCount
FROM Project1..Deaths
WHERE continent is null
AND location not in ('World', 'European Union', 'International', 'High Income', 'Middle Income', 'Low Income', 'Lower middle income', 'Upper middle income')
GROUP BY location
ORDER BY TotalDeathCount DESC

--3

SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as InfectedPercentage
FROM Project1..Deaths
GROUP BY location, population
ORDER BY InfectedPercentage DESC

--4

SELECT location, population, date, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as InfectedPercentage
FROM Project1..Deaths
GROUP BY location, population, date
ORDER BY InfectedPercentage DESC