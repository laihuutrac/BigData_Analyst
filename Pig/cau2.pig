movies = load 'movie.csv' using PigStorage(',') as (id:int,title:chararray,year:int,rating:float,views:int);
filter_year = filter movies by year >= 2000;
filter_rating = filter filter_year by rating > 3.5;
movie = foreach filter_rating generate title,year,rating;
movie_limit = limit movie 5;
dump movie_limit;


