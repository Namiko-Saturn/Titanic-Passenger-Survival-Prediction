CREATE DATABASE titinic_passenger_survival_prediction;
USE titinic_passenger_survival_prediction;
SELECT * FROM Titanic_Dataset;
-- What was the overall survival rate?
SELECT COUNT(*) survived FROM Titanic_Dataset;
SELECT count(*) * 100 FROM Titanic_dataset WHERE survived=1;
SELECT ROUND(SUM(survived) / COUNT(*) * 100,2) AS overall_survivalrate FROM Titanic_Dataset; 
-- Break down survival rate by passenger class (Pclass and sex
SELECT ROUND(SUM(survived) / COUNT(*) * 100,2) AS survivalrate FROM Titanic_Dataset GROUP BY pclass,sex;
-- What's the average fare paid per class? Any class where the spread (min/max) looks suspicious?
SELECT pclass, avg(fare)  AS Avgfare FROM Titanic_Dataset GROUP BY pclass;
-- How many passengers embarked from each port (Embarked)? How many rows have a missing embarkation port?
SELECT Embarked, COUNT(Passengerid) AS totalembarked FROM Titanic_Dataset GROUP BY Embarked;
-- Management wants to know: "Did women and children really get prioritized?" Answer it with numbers — survival rate by sex, and separately for passengers under 18.
SELECT ROUND(SUM(survived) / COUNT(*) * 100,2) FROM Titanic_Dataset WHERE SEX="Female" GROUP BY sex;
SELECT ROUND(SUM(survived) / COUNT(*) * 100,2) FROM Titanic_Dataset WHERE Age=">18" GROUP BY Age;
-- Was there a combined effect of class and sex on survival (i.e., did being in 1st class matter more for men or for women)?
SELECT pclass, Sex, sum(survived) AS effect_of_sex_pclass  FROM Titanic_Dataset GROUP BY pclass,Sex;
