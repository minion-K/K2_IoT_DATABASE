use korea_db;

select * from `members`;
select * from `purchases`;

# 1)
select name, contact, grade
from `members`;

# 2)
select name, grade
from `members`
where area_code = 'SEOUL';

# 3)
select name, join_date, grade
from `members`
where grade in ('Gold','Platinum','Diamond');

# 4)
select name, join_date
from `members`
where year(join_date) = '2023';

# 5)
select name, points
from `members`
where points >= 100;

# 6)
select *
from `members`
where gender = 'Male' and grade in ('Gold', 'Platinum', 'Diamond');

# 7)
select member_id, max(purchase_date)
from `purchases`
group by member_id
order by max(purchase_date) desc
limit 3;

# 8)
select member_id, sum(amount)
from `purchases`
group by member_id;


# 9) 구매 금액(amount)가 가장 높은 회원의 member_id, name, 총 구매 금액을 조회
select M.member_id, M.name, sum(P.amount) total_amount
from `members` M
	join `purchases` P
    on M.member_id = P.member_id
group by P.member_id
order by total_amount desc
limit 1;