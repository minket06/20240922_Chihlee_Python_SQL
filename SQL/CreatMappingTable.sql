-- 建立每日各站進出站人數資料表
CREATE TABLE daily_station_data (
    TKT_BEG VARCHAR(10) NOT NULL,
    station_name VARCHAR(100),
    entry_count INT,
    exit_count INT,
    date DATE,
    PRIMARY KEY (TKT_BEG, date)
);

-- 建立車站資料表
CREATE TABLE station_data (
    station_code VARCHAR(10) NOT NULL,
    station_name VARCHAR(100),
    location VARCHAR(100),
    PRIMARY KEY (station_code)
);


-- 建立對應表
CREATE TABLE station_code_mapping (
    TKT_BEG VARCHAR(10) NOT NULL,
    station_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (TKT_BEG, station_code)
);

-- 插入對應資料
INSERT INTO station_code_mapping (TKT_BEG, station_code)
SELECT d.TKT_BEG, s.station_code
FROM daily_station_data d
JOIN station_data s ON d.station_name = s.station_name;

