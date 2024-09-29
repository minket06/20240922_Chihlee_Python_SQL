Create table if not exists weather(
	id serial primary key,
	city varchar(20) not null,
	stratdate timestamp,
	enddate timestamp,
	hight real,
	low real,
	status varchar(20)
);
