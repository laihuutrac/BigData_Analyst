movies = load 'movie.csv' using PigStorage(',') as (id:int,title:chararray,year:int,rating:float,views:int);
SPLIT movies into lowrated if rating<3.0f, highrated if rating>3.0f;
grouphigh = group highrated all;
maxview = foreach grouphigh generate MAX(highrated.title),MAX(highrated.views);
dump maxview;
