# How to Add Emoji 👍 in VS Code 
# Windows: You can use the Win + . shortcut to open the emoji picker.
# macOS: Use Control + Command + Space to open the emoji picker.
# Material : https://fonts.google.com/icons?icon.set=Material+Symbols&icon.style=Rounded
from dotenv import load_dotenv
import streamlit as st
import time
# from time import sleep

# import datasource
from datasource import get_data

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

placeholder = st.empty()
with placeholder:
    with st.spinner('下載資料中...'):
        get_data()
    # st.success("下載完成",icon=":material/download:")
    # time.sleep(3)

# placeholder.empty()
alert()
st.write("顯示頁面")