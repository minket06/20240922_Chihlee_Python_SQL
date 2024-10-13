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