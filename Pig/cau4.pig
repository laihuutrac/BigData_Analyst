movies = load 'movie.csv' using PigStorage(',') as (id:int,title:chararray,year:int,rating:float,views:int);
SPLIT movies into lowrated if rating<3.0f, highrated if rating>3.0f;
grouplow = group lowrated all;
maxview = foreach grouplow generate MAX(lowrated.title),MAX(lowrated.views);
dump maxview;


