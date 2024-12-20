import requests

import psycopg2
import os
from dotenv import load_dotenv

# 自訂常數
PI = 3.1415926

# 自訂CLASS
class Customerclass:
    pass

import time
#自訂Function
def get_data()->list | None:#-> list or None#
    time.sleep(5)
    url = 'https://tcgbusfs.blob.core.windows.net/dotapp/youbike/v2/youbike_immediate.json' 
    # response = requests.get(url)
    # type(response)
    try:
        response = requests.get(url)
        response.raise_for_status
    except:
        print ('出錯了')
        return None
    else:
        return response.json()
    
def save_to_database(data:list[dict])->None:#沒有傳出任何東西#
        # pass
        # print(data)

        # print("data的資料要放進資料庫")
        #建立資料表
        load_dotenv()
        conn = psycopg2.connect(host=os.environ['HOST_RENDER'],database=os.environ['DATABASE_RENDER'],user=os.environ['USER_RENDER'],password=os.environ['PASSWORD_RENDER'])
        with conn:
            with conn.cursor() as cursor:
                sql = '''
                CREATE TABLE IF NOT EXISTS 站點資訊(
                站點編號 VARCHAR(10),
                站點名稱 VARCHAR(30) NOT NULL,
                行政區 VARCHAR(10) NOT NULL,
                站點地址 VARCHAR(50),
                lat NUMERIC(15,11),
                lng NUMERIC(15,11),
                PRIMARY KEY(站點編號)
                );
                CREATE TABLE IF NOT EXISTS youbike(
                日期 TIMESTAMP,
                編號 VARCHAR(10),
                總車輛 INTEGER,
                可借 INTEGER,
                可還 INTEGER,
                活動 BOOLEAN,
                PRIMARY KEY(日期,編號),
                FOREIGN KEY(編號) REFERENCES 站點資訊(站點編號) 
                ON DELETE CASCADE
                ON UPDATE CASCADE
                );
                '''
                cursor.execute(sql)    
                    
        conn.close()

        conn = psycopg2.connect(host=os.environ['HOST_RENDER'],database=os.environ['DATABASE_RENDER'],user=os.environ['USER_RENDER'],password=os.environ['PASSWORD_RENDER'])
        with conn:
            with conn.cursor() as cursor:
                for site_info in data:
                    sql = '''
                        INSERT INTO 站點資訊 
                        VALUES(%s,%s,%s,%s,%s,%s)
                        ON CONFLICT DO NOTHING;
                    '''
                    cursor.execute(sql,(site_info["sno"],
                                   site_info["sna"],
                                   site_info["sarea"],
                                   site_info["ar"],
                                   site_info["latitude"],
                                   site_info["longitude"]))
                    
                    sql='''
                        INSERT INTO youbike
                        VALUES(%s,%s,%s,%s,%s,%s)
                        ON CONFLICT DO NOTHING
                    '''
                    cursor.execute(sql,(site_info["mday"],
                                   site_info["sno"],
                                   site_info["total"],
                                   site_info["available_rent_bikes"],
                                   site_info["available_return_bikes"],
                                   bool(int(site_info["act"]))))
        conn.close()        

def get_sarea_from_database()->list[tuple]:
    load_dotenv()
    conn = psycopg2.connect(host=os.environ['HOST_RENDER'],database=os.environ['DATABASE_RENDER'],user=os.environ['USER_RENDER'],password=os.environ['PASSWORD_RENDER'])
    with conn:
        with conn.cursor() as cursor:
            sql = '''
                SELECT 行政區
                FROM 站點資訊
                GROUP BY 行政區;
            '''
            cursor.execute(sql)
            areas = cursor.fetchall()
            return areas
            
    conn.close()

def get_info_area(area:str)->list[tuple]:
    load_dotenv()
    conn = psycopg2.connect(host=os.environ['HOST_RENDER'],database=os.environ['DATABASE_RENDER'],user=os.environ['USER_RENDER'],password=os.environ['PASSWORD_RENDER'])
    with conn:
        with conn.cursor() as cursor:
            sql = '''
                SELECT 日期,站點資訊.站點名稱,行政區,站點地址,lat,lng,總車輛,可借,可還,可借,活動
                FROM youbike
                JOIN 站點資訊 ON youbike.編號 = 站點資訊.站點編號
                WHERE (日期,編號) IN (
                    SELECT MAX(日期),編號
                    FROM youbike
                    GROUP BY 編號
                ) AND 行政區 = %s;
            '''
            cursor.execute(sql,(area,))
            area_info = cursor.fetchall()
            return area_info
            
    conn.close()