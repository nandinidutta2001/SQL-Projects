create database insurance_info;
use insurance_info;
select * from insurance;

# 1. Count for each categories of ‘region 
 select * from insurance where region in (select region from insurance group by region having count(region) = 364 and gender ='male');

select region,count(*) as sc from insurance group by region;

# 2. Find 50 records of highest ‘age’ and export data/table to desktop 
select * from insurance order by age desc limit 50;
select * from insurance order by age desc limit 50;
select * from insurance order by age desc limit 50;

# 3. Add index name ‘quick’ on ‘id’ 

select * from insurance;
create index quick on insurance (id);

#4. Describe the schema of table 

desc insurance;

#5. Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view] 

create view gender as select id,age,bmi,children,smoker,region,charges from insurance; 
select * from gender;
create or replace view gender as select id,age,bmi,children,smoker,region,charges,hl_charges from insurance;
# 6. Rename the view as ‘type’ 

rename table gender to type;

# 7. Count how many are ‘northwest’ insurance holders 

select region, count(*) from insurance group by region having region = 'northwest';
select region, count(*) from insurance where region = 'northwest';

# 8. Count how many insurance holders were ‘femail’ 

select sex,count(*) from insurance where sex = 'female'; 

# 9. Create Primary key on a suitable column 

alter table insurance add primary key (id);

#10. Create a new column ‘ratio’ which is age multiply by bmi 

alter table insurance add column ratio double after bmi;
update insurance set ratio = age*bmi; 
select * from insurance; 

# 11. Arrange the table from high to low according to charges 

select * from insurance order by charges desc;

# 12. Find MAX of ‘charges’ 
select 
select * from insurance where charges = (select max(charges)from insurance);
select * from insurance order by charges desc  limit 1;
select * from insurance where charges = (select max(charges) from insurance);

# 13. Find MIN of ‘charges’ 
select * from insurance where charges = (select min(charges) from insurance);
select * from insurance where charges = (select min(charges) from insurance);

# 14. Find average of ‘charges’ of male and female 
select gender, round(avg(charges))from insurance group by gender;
select gender,round(avg(charges),0) from insurance group by gender;
select sex,round(avg(charges),2) as avg_charges from insurance group by sex;

# 15. Write a Query to rename column name sex to Gender

alter table insurance change sex gender varchar(6);
 
# 16. Add new column as HL_Charges where more than average charges should be categorized as HIGH and less than average charges 
# should be categorized as LOW 
select round(avg(charges)) from insurance;
update insurance set Hl_charges = case when charges > 13270 then 'HIGH' when charges < 13270 then 'LOW' end;
alter table insurance add column Hl_charges char(4);
select round(avg(charges),2) from insurance;
set @avg=(select avg(charges) from insurance);
update insurance set HL_charges =case when charges >=@avg then 'high' else 'Low' end; # refer cereals   it's the other way
select * from insurance;

# 17. Change location/position of ‘smoker’ and bring before ‘children’ 

alter table insurance add column smoker_ varchar(3) after bmi;
update insurance set smoker_=smoker;
alter table insurance drop column smoker;
alter table insurance change smoker_ smoker varchar(3);


# 18. Show top 20 records 

select * from insurance limit 20;

# 19. Show bottom 20 records 

select * from insurance order by id desc limit 20;

# 20. Randomly select 20% of records and export to desktop 
select round(count(*)*.2,2) from insurance;
select round(count(*)*.2,0) from insurance;
select * from insurance order by rand() limit 401;
select round(count(*)*.2,0) from insurance;  # multiply into .2 and 0 is round off decimals
select * from insurance order by rand() limit 268;
select count(*)*.2 from insurance;


# 21. Remove column ‘ratio’ 

alter table insurance drop column ratio;

# 22. Create one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in the script itself with remarks by using # 
# write a query to determine 2nd highest BMI based on gender male
select * from insurance where gender = 'female' order by bmi desc limit 1,1;
# find the insurance holders whose bmi is less than the maximum bmi of female
select * from insurance where bmi < (select max(bmi) from insurance where gender = 'female');
select * from insurance where bmi < (select max(bmi) from insurance where gender = 'Female');

#23. Create a view called Female_HL_Charges that shows only those data where  HL_Charges is High, Female, Smokers and with 0 children 


create view Female_HL_Charges as (select * from insurance where hl_charges = 'high' and gender = 'female' and smoker = 'yes' and children=0);
select * from Female_HL_Charges;

# 24. Update children column if there is 0 children then make it as Zero Children, if 1 
# then one_children, if 2 then two_children, if 3 then three_children, if 4 then
# four_children if 5 then five_children else print it as More_than_five_children.

alter table insurance modify children varchar(30);
update insurance set children = case when children = 0 then 'Zero children' when children = 1 then 'one children' 
when children = 2 then 'two children' when children = 3 then 'three children' when children = 4 then 'four children' 
when children = 5 then 'five children' else 'more than five children'end;
select * from insurance;

25. Mail the script to jeevan.raj@imarticus.com by EOD.
