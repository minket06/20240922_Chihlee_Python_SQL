# How to Add Emoji 👍 in VS Code 
# Windows: You can use the Win + . shortcut to open the emoji picker.
# macOS: Use Control + Command + Space to open the emoji picker.
# Material : https://fonts.google.com/icons?icon.set=Material+Symbols&icon.style=Rounded
from dotenv import load_dotenv
import streamlit as st
import time
# from time import sleep

# import datasource
# from datasource import get_data
# from tools.datasource import get_data

# from tools import get_data 
import tools

from pprint import pprint
load_dotenv()

# with st.spinner('下載資料中...'):
#     time.sleep(5)

# st.success("下載完成!",icon="🙌")

# placeholder = st.empty()
# with placeholder:
#     with st.spinner('下載資料中...'):
#         time.sleep(5)
#     # st.success("下載完成!",icon="🙌")
#     # st.success("下載完成",icon=":material/favorite:")
#     st.success("下載完成",icon=":material/download:")
#     time.sleep(3)

# placeholder.empty()



# placeholder = st.empty()
# with placeholder:
#     with st.spinner('下載資料中...'):
#         get_data()
#     st.success("下載完成",icon=":material/download:")
#     time.sleep(3)

# placeholder.empty()



@st.dialog("目前發生問題，請稍後再試")
def alert():
    st.write("連線有問題")
    st.stop()

# placeholder = st.empty()
# with placeholder:
#     with st.spinner('下載資料中...'):
#         youbikes = get_data()
# # alert()


@st.cache_data
def get_sarea()->list[str]:
    areas = [tuple1[0] for tuple1 in tools.get_sarea_from_database()]
    return areas


with st.spinner('下載資料中...'):
     #底下註解的為存檔
    # youbikes:list[dict] = tools.get_data()
    # tools.save_to_database(youbikes)
    # areas = tuple[0] for tuple1 in tools.get_data() 
    # return areas
    areas = get_sarea()   

# alert()

# if youbikes is None:
#     alert()
    
# pprint(youbikes)

#     # st.success("下載完成",icon=":material/download:")
#     # time.sleep(3)

# # placeholder.empty()

# st.write("顯示頁面")
# st.write(youbikes)

selected = st.radio(
        "選擇行政區:",
        areas,
        key='sarea',
        horizontal=True   
    )

data = tools.get_info_area(area=selected)
data1 = [{'日期':item[0],'站點':item[1],'總車輛':item[6],'可借':item[7],'可還':item[8],'活動':item[9]}for item in data]
st.dataframe(data1)