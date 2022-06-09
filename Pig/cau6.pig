movies = load 'movie.csv' using PigStorage(',') as (id:int,title:chararray,year:int,rating:float,views:int);
groupmovies = group movies all;
avgmovies = foreach groupmovies generate ROUND(AVG(movies.views));
dump avgmovies;
