--source/台鐵車站資訊.csv
create table if not exists stations(
	stations_id serial primary key,
	stationCode varchar(5) unique not null,
	stationName varchar(20) not null,
	name varchar(20),
	stationAddrTw varchar(50),
	stationTel varchar(50),	
	gps varchar(30),
	haveBike BOOLEAN
);

select * from stations;
-- *************************************************
create table if not exists station_In_Out(
	date Date,
	staCode varchar(5) not null,
	gateInComingCnt integer,
	gateOutGoingCnt integer,
	primary key (date,staCode),
	Foreign key (staCode) references stations(stationCode) 
	ON delete SET NULL
	ON UPDATE CASCADE --SET NULL
);
select count(*) from station_In_Out;
select * from station_In_Out;
select * from station_In_Out where date <='2019/12/01';
--******************************************
SELECT * FROM STATION_IN_OUT
SELECT * FROM STATIONS;

SELECT 	DATE AS 日期,
		gateincomingcnt as 進站人數,
		gateoutgoingcnt as 出站人數,
		stationname as 站名,
		stationaddrtw as 地址,
		stationtel as 電話
FROM STATION_IN_out IN_OUT
JOIN STATIONS S ON IN_OUT.STACODE=S.STATIONCODE
where stationname='基隆';




