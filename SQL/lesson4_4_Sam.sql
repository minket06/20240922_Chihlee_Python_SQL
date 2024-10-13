/*從Payment資料表取出所有員工的訂單總數*/
SELECT staff_id, count(payment_id) as 訂單總數
FROM public.payment
group by staff_id ;


-- select distinct staff_id FROM public.payment
/*取出每個員工,在每一個客戶的訂單金額總合*/
select staff_id,customer_id,sum(amount) as 訂單金額總合
from public.payment
group by staff_id,customer_id
order by customer_id

/*取出每日訂單的總和*/
-- select payment_date,sum(amount) 
select payment_date::date as 日期,sum(amount) 
from payment
--group by CAST(payment_date as date)
group by 日期
order by 日期
