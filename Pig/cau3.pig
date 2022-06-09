movies = load 'movie.csv' using PigStorage(',') as (id:int,title:chararray,year:int,rating:float,views:int);
gr_data = group movies by year;
count = foreach gr_data generate group as gr_data,COUNT(movies.id) as Total;
order_data = order count by Total DESC;
dump order_data;


