# 1)
use korea_db;

select M.name, M.grade, P.product_code, P.purchase_date, P.amount
from `members` M
	left join `purchases` P
    on M.member_id = P.member_id
order by P.purchase_date;

# 2)
select M.name, M.area_code, sum(P.amount)
from `members` M
	join `purchases` P
    on M.member_id = P.member_id
group by M.member_id
having sum(P.amount) >= 30000;

# 3)
select M.grade, count(*), sum(P.amount), avg(P.amount)
from `members` M
	join `purchases` P
    on M.member_id = P.member_id
group by M.grade;