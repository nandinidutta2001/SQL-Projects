use movies;

# i. Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.

select mov_year from movie where mov_title = 'American Beauty';

#ii. Write a SQL query to find those movies, which were released before 1998. Return movie title.

select * from movie where mov_year < 1998;

# iii. Write a query where it should contain all the data of the movies which were 
# released after 1995 and their movie duration was greater than 120.

select * from movie where mov_year > 1995 and mov_time > 120;

# iv. Write a query to determine the Top 7 movies which were released in United 
# Kingdom. Sort the data in ascending order of the movie year.

select * from movie m join ratings r using (mov_id) order by r.rev_stars desc limit 7;

# v. Set the language of movie language as 'Chinese' for the movie which has its 
# existing language as Japanese and the movie year was 2001.

(update movie set mov_lang = 'Chinese' where mov_lang = 'japanese' and mov_year = 2001);

#vi. Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.

select m.*,re.* from movie m join ratings r using (mov_id) join reviewer re using (rev_id) where m.mov_title = 'slumdog millionaire';

#vii. Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.

select a.act_fname,a.act_lname,c.role,a.act_gender from actor a join cast c using (act_id) where a.act_gender != 'M';

# viii. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'.
# Fetch all the fields of actor table. (Hint: Use the IN operator).

select * from actor where act_id in (select act_id from cast where mov_id in (select mov_id from movie where mov_title='annie hall'));

# ix. Write a SQL query to find those movies that have been released in countries other than the United Kingdom. 
# Return movie title, movie year, movie time, and date of release, releasing country.

select mov_title,mov_year,mov_time,mov_dt_rel,mov_rel_country from movie where mov_rel_country != 'UK';

#x. Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)

select g.gen_title Genre_title, max(m.mov_time) maximum_movie_duration, count(m.mov_id) number_of_movies from movie m inner join movie_genres mg 
using (mov_id) inner join genres g using (gen_id) group by g.gen_title order by g.gen_title asc;

# xi. Create a view which should contain the first name, last name, title of the movie & role played by particular actor.

create view lists as (select a.act_fname first_name,a.act_lname last_name,m.mov_title movie_title,c.role from actor a inner join 
cast c using (act_id) inner join movie m using (mov_id));
select * from lists;

# xii. Write a SQL query to find the movies with the lowest ratings

select m.*,r.rev_stars from movie m inner join ratings r using (mov_id) order by r.rev_stars asc limit 1;

# xiii. Finally Mail the script to jeevan.raj@imarticus.com
