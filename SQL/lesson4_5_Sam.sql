select * 
from payment


select customer_id,sum(amount) as 總和
from payment
--where customer_id > 500
group by customer_id
having sum(amount)>200;


select store_id,count(customer_id) as 數量
from customer
group by store_id
having count(customer_id)>300;

--*****
select * 
from country


select country_id,*
from country
where country='Taiwan'

select city 
from city
where country_id='92'

--subquery
select city 
from city
where country_id=(
	select country_id
	from country
	where country='Taiwan'
)

--用JOIN來取代SUBQUERY
select city
from city
join country on country.country_id=city.country_id
where country='Taiwan'





