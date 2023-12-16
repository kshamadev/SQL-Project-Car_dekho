CREATE DATABASE IF NOT EXISTS cars;
USE cars;
##Read Data 
SELECT * FROM car_dekho;
/* Total cars : To get a count of total records */
SELECT count(*) FROM car_dekho;
/*The manager asked the employee How many cars will be available in 2023 */
SELECT count(*) FROM car_dekho
WHERE year = 2023;
/*How many cars are available in 2020, 2021, 2022 */
SELECT count(*) FROM car_dekho WHERE year IN (2020,2021,2022) GROUP BY year;
/*Client asked me to print the total of all cars by year */
SELECT year, count(*) FROM car_dekho GROUP BY year
ORDER BY year DESC;
/*Client asked car dealer agent How many diesel cars will be there in 2020 */
SELECT count(*) FROM car_dekho WHERE fuel = "Diesel" AND year = 2020;
/*Client requested a car dealer agent How many petrol cars will be there in 2020*/
SELECT count(*) FROM car_dekho WHERE fuel = "Petrol" AND year = 2020;
/*The manager told the employee to give a print. All the fuel cars (petrol, diesel, and CNG) 
come by all year */
SELECT year, count(*) FROM car_dekho WHERE fuel = "Petrol" GROUP BY year;
SELECT year, count(*) FROM car_dekho WHERE fuel = "Diesel" GROUP BY year;
SELECT year, count(*) FROM car_dekho WHERE fuel = "CNG" GROUP BY year;
/*Manager said there were more than 100 cars in a given year, which year had more than 100 cars */
SELECT year, count(*) FROM car_dekho 
GROUP BY year
HAVING count(*) > 100;
/*Manager said to the employee All cars count details between 2015 and 2023; We need to complete 
the list */
SELECT Name, year, count(*) FROM car_dekho 
WHERE year BETWEEN 2015 AND 2023
GROUP BY Name, year;
/*Manager asked total car sold between 2015 and 2023 */
SELECT count(*) FROM car_dekho
WHERE year BETWEEN 2015 AND 2023;
/*Manager asked complete details of all cars sold between 2015 and 2023 */
SELECT * FROM car_dekho WHERE year BETWEEN 2015 AND 2023;

## END 
 




 
