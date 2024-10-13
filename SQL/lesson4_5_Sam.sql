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






