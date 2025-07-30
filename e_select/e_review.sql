USE `baseball_league`;

SELECT * FROM `players`;
SELECT * FROM `teams`;

# 1)
select name, birth_date
from `players`
where year(birth_date) >= '1990';

# 2)
select name
from `players`
where position = '외야수' and year(birth_date) <= 1995;

# 3) 
select name, birth_date
from `players`
order by birth_date;

# 4)
select name, founded_year
from `teams`
order by founded_year;

# 5) 
select distinct name
from `teams`;

# 6)
select distinct position
from `players`;

# 7)
select position
from `players`
group by position
having count(position) >= 2;