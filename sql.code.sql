#display all recored in the deliveryfood table

 select * from fooddelivery;

 #disaplay any two cloumn in your table

 select age,gender from fooddelivery;
 
#write a query to show the person gender with age should be above 22.
 
 select age, gender from fooddelivery
 where age>=22;
 
 #Take any column but show the column without print the duplicate values
 
 select distinct Educational_Qualifications from fooddelivery;
 
 #what is the average age of the respondents
 
 select avg(age) from fooddelivery;
 
 #how many are male and how many are female'
 
 select gender, count(*) as count from fooddelivery
 group by gender;
 
 #display the only female in  the gender column along with their age .Then display only who age greaterthan 22.
 
 select gender, age Income from  fooddelivery
 where gender ="female" and  age > 22;
 
 #display the average age of the every occupation.
select avg(age) as age,Occupation from fooddelivery
group by occupation;

 #display max latitude and display that value which only one decimal place.

select round(max(latitude),1)as latitude from fooddelivery;
 
 #which gender hass more postive feedback.
 
 select gender, count(feedback) as feedback from fooddelivery
 where feedback="positive"
 group by gender
 order by feedback desc;
 
 # calculate the average family size for each marital status.
 
 select avg(family_size), Marital_Status
 from fooddelivery
 group by Marital_Status;
 
 #display a any string column the data in column should be start with any one alphabet letter

select gender from fooddelivery
where gender like "m%";

#display the first three columns in any string 

select Educational_Qualifications, left(Educational_Qualifications,3) as count from fooddelivery;

#display the first three columns in any string 

select Educational_Qualifications, right(Educational_Qualifications,3) as count from fooddelivery;

#display longtiude and latitude with dicmalplaces 4. 

select round(longitude,3)as longitude ,round(latitude,3) as latitude from fooddelivery;


# find the top three most common pin codes among the respondents.

#wrie a query of min(age) of graduate who earn around 20000

select min(age), Educational_Qualifications, monthly_income from foodelivery
where Educational_Qualifications='graduate' and monthly_income='10001 to 25000';


select pincode,count(*)  as count from fooddelivery
group by pincode
order by count desc
limit 3;
# find the count graduate and post graduate by through education_quaflication

select Educational_Qualifications,count(*) as count from fooddelivery
where Educational_Qualifications in('graduate','post graduate')
group by Educational_Qualifications;

#disribution between latitude and longitude

SELECT latitude, longitude, COUNT(*) AS count
FROM deliveryfood
GROUP BY latitude, longitude
ORDER BY count DESC;


# write the relational between educational_qualiflication and monthly_income

SELECT Educational_Qualifications, Monthly_Income, COUNT(*) AS count
FROM fooddelivery
GROUP BY Educational_Qualifications, Monthly_Income
ORDER BY Educational_Qualifications, Monthly_Income;

#What is the total feedback count, the number of positive feedbacks, 
-- and the percentage of positive feedbacks for each combination of occupation and age group?

SELECT
    Family_Size,
    COUNT(*) as Total_Feedback,
    SUM(CASE WHEN Feedback = 'Positive' THEN 1 ELSE 0 END) as Positive_Feedback,
    (SUM(CASE WHEN Feedback = 'Positive' THEN 1 ELSE 0 END) / COUNT(*)) * 100 as Positive_Percentage
FROM fooddelivery
GROUP BY Family_Size
ORDER BY Family_Size;

#what is the total feedback count, the number of positive feedbacks, and the percentage of positive feedbacks for each age group?


SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN '0-18'
        WHEN Age BETWEEN 19 AND 25 THEN '19-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+' 
    END as Age_Group,
    COUNT(*) as Total_Feedback,
    SUM(CASE WHEN Feedback = 'Positive' THEN 1 ELSE 0 END) as Positive_Feedback,
    (SUM(CASE WHEN Feedback = 'Positive' THEN 1 ELSE 0 END) / COUNT(*)) * 100 as Positive_Percentage
FROM fooddelivery
GROUP BY Age_group;
