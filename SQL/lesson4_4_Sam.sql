/*從Payment資料表取出所有員工的訂單總數*/
SELECT staff_id, count(payment_id) as 訂單總數
FROM public.payment
group by staff_id ;


select distinct staff_id FROM public.payment
