import requests
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
        print(data)
        print("data的資料要放進資料庫")