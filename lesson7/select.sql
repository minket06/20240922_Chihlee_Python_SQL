-- select * from public."市場"

-- select * from public."股市" where name='^TWII';
-- select * from public."股市" where name='^HSI';
-- select * from public."股市" where name='^STI';

-- 取出市場資料
select country,市場.name,date,adj_close,volume 
from 股市 
join 市場 on 股市.name=市場.name
where country='台灣';

select country,市場.name,date,adj_close,volume 
from 股市 
join 市場 on 股市.name=市場.name
where country='台灣' and date in (select Max(date) from 股市 where name='^TWII');



select country,市場.name,date,adj_close,volume 
from 股市 
join 市場 on 股市.name=市場.name
where country='台灣' and date between '2024/01/01' and '2024/12/31'





