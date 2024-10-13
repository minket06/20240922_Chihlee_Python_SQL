SELECT (customer_id,staff_id) as G,*
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
from payment
group by customer_id
--order by count(amount) ASC;
order by 筆數 asc;
--*********************
select (first_name || ' ' || last_name) as full_name,sum(amount) as 總和--,* 
from payment p
join customer c on p.customer_id=c.customer_id
group by full_name
order by 總和 desc