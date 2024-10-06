SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE code = '1001';

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE code = '1001' OR code = '1002';

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE code IN ('1001','1002');

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE code = '1001' OR name = '八堵';


SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE name = '基隆';

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations;

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE name LIKE '台_';

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE name LIKE '台%';

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE name LIKE '%港';


SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
where id <= 20 and id >=10

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
where id > 20 OR id < 10


--BETWEEN
SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
where id BETWEEN 10 and 20

--NOT BETWEEN
SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
where id NOT BETWEEN 10 and 20


SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
WHERE NAME LIKE '%基%';

--ASC
SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
ORDER BY id

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
ORDER BY code

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
ORDER BY e_name

--DESC
SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
ORDER BY id DESC

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
ORDER BY code desc

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
ORDER BY e_name desc

--LIMIT
SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
ORDER BY e_name
LIMIT 10;

SELECT id as 序號,code as 代碼, name as 車站名稱, e_name as 英文名稱
FROM stations
ORDER BY e_name DESC
LIMIT 10;
