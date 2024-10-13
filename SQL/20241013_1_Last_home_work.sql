-- first_name為Jamie
select * from customer where first_name='Jamie';

-- first_name是Jamie,同時last_name是Rice
select * from customer where first_name='Jamie' and last_name='Rice';

-- last_name是Rodriquez 或者 first_name是Adam
select * from customer where last_name='Rodriquez' or first_name='Adam'

-- 取出first_name是Ann,Anne,Annie
select * from customer where first_name in ('Ann','Anne','Annie')

-- 取出字串開頭是Ann的first_name
select * from customer where first_name like ('Ann%')

-- 取出first_name第1個字元是A,同時first_name的字元長度是3到5的資料
select * from customer where first_name like ('A%') and (length(first_name) between 3 and 5)

-- 取出first_name,前3字為Bra,但last_name不是Motley
select * from customer where first_name like ('Bra%') and (last_name != 'Motley')