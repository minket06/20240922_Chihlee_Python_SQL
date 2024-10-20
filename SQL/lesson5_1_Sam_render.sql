select * from stations;
select *
from station_in_out ;
select DATE_PART('year', date) AS year,
		DATE_PART('month',date) AS month,*
from station_in_out ;

       
--全省各站點2022年進站總人數(lesson5_1,lesson5_2)
-- select stacode,sum(gateincomingcnt) 
-- select *
select stacode,b.stationname,sum(gateincomingcnt) as total
from station_in_out a
left join stations b on a.stacode=b.stationcode
where date between '2022/01/01' and '2022/12/31' 
group by stacode,b.stationname
order by total desc --stacode,b.stationname
;

-- 全省各站點2022年進站總人數大於5佰萬人的站點
select stacode,b.stationname,sum(gateincomingcnt) as total
from station_in_out  a
left join stations b on a.stacode=b.stationcode
where date between '2022/01/01' and '2022/12/31' 
group by stacode,b.stationname
having sum(gateincomingcnt) >=5000000
order by total desc --stacode
;

-- 基隆火車站2020年,每月份進站人數
select stacode,b.stationname,
		DATE_PART('year',date) || '-' || LPAD(DATE_PART('month', date)::TEXT, 2, '0')  AS yearmonth,
		sum(gateincomingcnt)
from station_in_out   a
left join stations b on a.stacode=b.stationcode
where date between '2020/01/01' and '2020/12/31' and stacode='900' 
group by stacode,b.stationname,yearmonth
order by stacode,b.stationname,yearmonth
;

-- 基隆火車站2020年,每月份進站人數,由多至少
select stacode,b.stationname,
		DATE_PART('year',date) || '-' || LPAD(DATE_PART('month', date)::TEXT, 2, '0')  AS yearmonth,
		sum(gateincomingcnt) as total
from station_in_out   a
left join stations b on a.stacode=b.stationcode
where date between '2020/01/01' and '2020/12/31' and stacode='900' 
group by stacode,b.stationname,yearmonth
order by total desc
;

-- 基隆火車站2020,2021,2022,每年進站人數
select stacode,b.stationname,DATE_PART('year',date) as year ,sum(gateincomingcnt)
from station_in_out a
left join stations b on a.stacode=b.stationcode
where date between '2020/01/01' and '2022/12/31'  and stacode='900' 
group by stacode,b.stationname,year
order by stacode,b.stationname,year
;

-- 基隆火車站,臺北火車站2020,2021,2022,每年進站人數
select stacode,b.stationname,DATE_PART('year',date) as year ,sum(gateincomingcnt)
from station_in_out a
left join stations b on a.stacode=b.stationcode
where date between '2020/01/01' and '2022/12/31'  and stacode in ('900','1000')
group by stacode,b.stationname,year
order by stacode,b.stationname,year
;

-- 請使用SubQuery
-- 進站人數最多的一筆
select a.*,b.stationname
from station_in_out a
left join stations b on a.stacode=b.stationcode
where gateincomingcnt in (select max(gateincomingcnt) from station_in_out)
;

-- 各站點進站人數最多的一筆
select a.date,a.stacode,b.stationname,a.gateincomingcnt
from station_in_out a
left join stations b on a.stacode=b.stationcode
where (stacode, gateincomingcnt) in (select stacode,max(gateincomingcnt) from station_in_out group by stacode)
order by stacode, gateincomingcnt
;

