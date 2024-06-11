use organisation;
select * from worker;
# Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>.

select first_name WORKER_NAME from worker;

select  first_name from worker;

select first_name "First Name" from worker;
#Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.

select Upper(First_name) from worker;
select  upper (first_name) from worker;


#Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.

select distinct department from worker;

select  distinct department from worker;
select department from worker group by department;

#Q-4. Write An SQL Query To Print The First Three Characters Of FIRST_NAME From Worker Table.

select first_name, substr(first_name,1,3) from worker;

select  first_name, substr(first_name,1,3) from worker;


#Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table
select first_name, position('a' in first_name) from worker where first_name="Amitabh";

select  first_name, position('a' in first_name) from worker where first_name = 'Amitabh';


#Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces From The Right Side.
select rtrim(first_name) from worker;

select first_name,rtrim(first_name) from worker;

#Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces From The Left Side.

select department,ltrim(department) from worker;

#Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And Prints Its Length.
select department,length(department) from worker group by department;
select distinct department, length(department) from worker;
select distinct department,length(department) from worker;

#Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘a’ With ‘K’. (for replacing char is case-sensitive)
select first_name,replace(first_name,'a','k') from worker;
select first_name, replace(first_name, 'a','k') from worker;

select first_name,replace(first_name,"a","K") from worker;

#Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
select concat(first_name," ",last_name) from worker;
select concat(first_name," ",last_name) from worker;
select concat(first_name," ",last_name) from worker;

#Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.

select first_name from worker order by first_name asc;

select * from worker order by first_name asc;

#Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.

select * from worker order by department desc, first_name asc;

select * from worker order by DEPARTMENT desc,first_name asc;

#Q-13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.

select *from worker where first_name in ('vipul','satish');

select * from worker where first_name in ("vipul","satish");

#Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
select *from worker where first_name not in ('vipul','satish');

select * from worker where first_name not in ("vipul","satish");

#Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.

select *from worker where department = 'admin';

select * from worker where department = "Admin";
select * from worker where department in (select Department from worker group by department having department = 'admin');

# Q-16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.

select * from worker where first_name like '%a%';

select * from worker where first_name like '%a%';

#Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
select * from worker where first_name like '%a';

select * from worker where first_name like '%a';

#Q-18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And Contains Six Alphabets.

select * from worker where first_name like '_____h';
select * from worker where first_name like '%h' and length(first_name)= 6;

select * from worker where first_name like '_____h';
select * from worker where first_name like '%h' and length(first_name) = 6;

# Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.

select * from worker where SALARY >= 100000 and salary <=500000;
select * from worker where salary between 100000 and 500000;

#Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
select * from worker where joining_date like '%2014-02%';
select * from worker where year(joining_date) = 2014 and month(joining_date)=02;


select * from worker where year(joining_date) =2014 and month(joining_date) =2;
select * from worker where JOINING_DATE like "%2014-02%";

# Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.

select department,count(department) from worker group by department having department = 'admin';
select department,count(department) from worker where DEPARTMENT = "Admin";
select * from worker where department in (select department from worker group by department having department ='admin');
# Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.

select concat(first_name," ",last_name),salary from worker where salary  >=50000 and salary <=100000;

# Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
select department, count(*) as dup from worker group by department order by  dup  desc;
select department,count(department) as cd from worker group by department order by cd desc; 

# Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
select w.*,t.worker_title from worker w join title t on w.worker_id=t.worker_ref_id where t.worker_title ='manager';
select * from worker where worker_id in (select worker_ref_id from title where worker_title = 'manager');
select w.*,t.worker_title from worker w inner join title t on w.worker_id=t.worker_ref_id having worker_title = "manager";
select * from worker where worker_id in ( select worker_ref_id from title where worker_title = "manager");
#Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
 
select worker_title,affected_from, count(*) as dup from title group by worker_title,affected_from having dup >1;

# Q-26. Write An SQL Query To Show Only Odd Rows From A Table.

select * from worker where worker_id %2 <> 0;
select * from worker where worker_id % 2 != 0; 

#Q-27. Write An SQL Query To Show Only Even Rows From A Table.

select * from worker where worker_id % 2 = 0;

# Q-28. Write An SQL Query To Clone A New Table From Another Table.
create table clone_table4 as select * from worker;
create table clone_table2 like worker; 
select * from clone_table2;
create table clone_table3 as select * from worker; 
select * from clone_table3;


# Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables.

select * from worker w inner join bonus b on w.worker_id = b.worker_ref_id;
select * from worker where worker_id in ( select worker_ref_id from bonus);
select * from worker where worker_id in (select worker_id from worker);
# Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.

select * from worker w left join bonus b on w.worker_id = b.worker_ref_id where b.worker_ref_id is null ;
select * from worker where worker_id not in ( select worker_ref_id from bonus);


# Q-31. Write An SQL Query To Show The Current Date And Time.

select now();
select curdate(),curtime();

# Q-32. Write An SQL Query To Show The Top N (Say ) Records Of A Table.
select * from worker order by salary desc limit 1;
select * from worker where worker_id limit 5; 
select * from worker limit 5; 
select * from worker where worker_id <= 5; 

# Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
select * from worker order by salary desc limit 4,1;
select * from (select * ,dense_rank() over(order by salary desc) rank_ from worker) t where t.rank_=5;
select * from worker order by salary desc limit 4,1 ;
select * from (select *,rank() over(order by salary desc) dr from worker) y where dr = 5;

#Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.

select * from (select *,dense_rank() over(order by salary desc) dr_ from worker) y_ where dr_ = 5;

# Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.

select * from worker where salary in (select salary from worker group by salary having count(salary)>1);
select salary,count(salary) c from worker group by salary having c>1;
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary from Worker W, Worker W1
where W.Salary = W1.Salary
and W.WORKER_ID != W1.WORKER_ID;
select * from worker where salary in (select salary from worker group by salary having count(salary) >1);

# Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.

select * from (select *, dense_rank() over(order by salary desc)dr2  from worker) t where  dr2 =2;

# Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.

select * from worker union all select * from worker order by worker_id;
select * from worker union all select * from worker;
# Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.

select * from worker w inner join bonus b on w.worker_id = b.worker_ref_id ;

# Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
select * from worker where worker_id <= (select (round(count(worker_id)/2)) from worker);
select * from worker where worker_id <= (select round(count(worker_id)/2) from worker);

# Q-40. Write An SQL Query To Fetch The Departments That Have Less Than 2 People In It.
select department,count(department) as dup from worker group by department having dup<3;

# Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
select department,count(department) from worker group by department;

 select department,count(department) as dup from worker group by department;

# Q-42. Write An SQL Query To Show The Last Record From A Table.

select * from worker order by worker_id desc limit 1;

# Q-43. Write An SQL Query To Fetch The First Row Of A Table.

select * from worker order by worker_id asc limit 1;


# Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.

select * from worker order by worker_id desc limit 5;

#Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
select * from (select *, dense_rank() over(partition by department order by salary desc) d from worker) t where t.d = 1; 
select * from (select *, dense_rank() over(partition by department order by salary desc) dr from worker) t where t.dr=1;

# Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.

select * from worker order by salary desc limit 3;

# Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.

select * from worker order by salary asc limit 3;


# Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table.
select * from (select *,dense_rank() over(order by salary desc) d from worker) t where t.d=5; 

select * from (select *, dense_rank() over(order by salary desc) as dr from worker) t where t.dr=1;

#Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid

select department, sum(salary) from worker group by department;
select department, sum(salary) from worker group by DEPARTMENT;

#Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary

select concat(first_name," ",last_name),salary,department from worker where salary = (select max(salary) from worker);
select * from (select *, dense_rank() over(order by salary desc) as dr from worker) t where t.dr=1;