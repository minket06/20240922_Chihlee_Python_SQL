SELECT *
FROM public.payment
order by payment_id asc;

select 	customer_id,
		Sum(amount) as 加總,
		avg(amount) as 平均數量,
		count(amount) as 比數,
		max(amount) as 最大,
		min(amount) as 最小
from payment
group by customer_id
order by customer_id ASC;

--*****************
select 	customer_id,
		Sum(amount) as 加總,
		avg(amount) as 平均數量,
		count(amount) as 筆數,
		max(amount) as 最大,
		min(amount) as 最小
from payment
group by customer_id
--order by count(amount) ASC;
order by 筆數 asc;
