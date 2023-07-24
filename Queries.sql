
--selecting the table to see if the values are properly matched
SELECT * FROM health;

--Retrieve the gender, ages and occupation from the "health" table.

SELECT gender, age, occupation
FROM health;


--Retrieve the distinct genders each from the "health" table and.

SELECT DISTINCT gender
FROM health;


--Retrieve the average sleep duration for all records in the "health" table.

SELECT ROUND(AVG(sleep_duration),1)
FROM health;

--Retrieve the gender and occupations of people aged 30 or above with quality of sleep greater than the average.

SELECT * FROM health;

SELECT age, gender, occupation
FROM health
WHERE age >= 30
  AND quality_of_sleep > (SELECT AVG(quality_of_sleep) FROM health);


--Retrieve the number of people whose BMI is equals to 'normal' from the "health" table.

SELECT COUNT(*) AS num_of_people
FROM health
WHERE bmi_category = 'Normal';


--Retrieve gender, age and occupation and of people with a sleep disorder from the "health" table.

SELECT gender, age, occupation, sleep_disorder AS peope_with_sleep_disorder
FROM health
WHERE sleep_disorder <> 'None';

--Retrieve the person id with a "High" stress level and "Obese" BMI category.

SELECT * FROM health;

SELECT person_id, age, occupation, stress_level as stress_level
FROM health
WHERE bmi_category = 'Obese'
AND stress_level > (SELECT AVG(stress_level) FROM health);


--Retrieve the person_id of people with a average quality of 
--sleep and with average sleep duration, group by and order by person_id

SELECT person_id, count(1) AS healthy_people
FROM health
WHERE sleep_duration >= (SELECT AVG(sleep_duration)FROM health) 
AND quality_of_sleep >= (SELECT AVG(quality_of_sleep) FROM health)
GROUP BY person_id 
ORDER BY person_id ASC;


--Retrieve the names and ages of all people with "High" stress level and "Low" BMI category.

SELECT * FROM health;


--Retrieve the names and occupations of people with an occupation starting with "Teacher" from the "health" table.
-- We can directly search for the search for the "teacher" in occupation column, however
--we can specify that in another query using wildcards

SELECT * FROM health
WHERE occupation = 'Teacher';

SELECT occupation,(occupation LIKE '%Teacher%') AS occupation_is_teacher 
FROM health;

--Retrieve the number of people with each type of sleep disorder from the "health" table.

SELECT COUNT(person_id) AS number_of_person , sleep_disorder
FROM health
WHERE sleep_disorder <> 'None'
GROUP BY sleep_disorder 
ORDER BY count(1) ASC;


--Retrieve the occupation and average sleep duration of people with a sleep disorder, excluding those with a "None" sleep disorder.

SELECT occupation, ROUND(AVG(sleep_duration),0) as average_sleep_duration
FROM health
WHERE sleep_disorder != 'None'
GROUP BY occupation
ORDER BY average_sleep_duration ASC;


--Retrieve the occupation and heart rate of people with above-average heart rate 
--(heart rate greater than the overall average).

select * from health;

SELECT DISTINCT occupation as work, heart_rate as heart_rate_per_person
FROM health
WHERE heart_rate > (SELECT AVG(heart_rate) FROM health)
ORDER BY heart_rate ASC;

	
--Retrieve the top 5 occupations with the highest number of people in the "health" table.
SELECT COUNT(person_id) AS people, occupation
FROM health
GROUP BY occupation
ORDER BY COUNT(1) DESC LIMIT 5;

--to chech if the values are correct
SELECT * FROM health
WHERE occupation = 'Doctor';

--Retrieve the person ID of people who have a sleep duration less than 6 hours, a stress level of "High", and a BMI category of "Obese."

SELECT person_id, sleep_duration, ROUND(AVG(stress_level),0) as average_stress_level 
FROM health
WHERE sleep_duration < 6
AND stress_level > (SELECT ROUND(AVG(stress_level),0) from health)
AND bmi_category = 'Obese'
GROUP BY person_id;


--Retrieve the person ID and ages of people with the lowest and highest ages recorded in the "health" table.

SELECT person_id, age as ages
FROM health
ORDER BY age DESC;

--that's it, we have now the the data needed for our report about Sleep health and lifestyle dataset. Data is downloaded from Kaggle. Queries are manually created by yours truly.