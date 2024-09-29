DROP TABLE IF EXISTS hospital

CREATE TABLE IF not exists hospital (
    序號 SERIAL PRIMARY KEY,
	直轄市或省轄縣市 VARCHAR(5) NOT NULL,
	醫療機構名稱 VARCHAR(30) NOT NULL UNIQUE,
	市話 VARCHAR(15),
	分機 VARCHAR(7),	
	聯絡人 VARCHAR(7),	
	地址 VARCHAR(50)	
);