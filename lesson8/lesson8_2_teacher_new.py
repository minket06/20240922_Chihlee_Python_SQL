import streamlit as st
import psycopg2
from dotenv import load_dotenv
import os
import pandas as pd

load_dotenv()

# @st.cache_resource
@st.cache_data
def getData(country:tuple[str])->list[tuple]:
    conn = psycopg2.connect(host=os.environ['POSTGRE_HOST'],
                            database=os.environ['POSTGRE_DATABASE'],
                            user=os.environ['POSTGRE_USER'],
                            password=os.environ['POSTGRE_PASSWORD'])
    with conn:
        with conn.cursor() as cursor:
            sql = '''
            SELECT country,市場.name,date,adj_close,volume
            FROM 股市 JOIN 市場 ON 股市.name = 市場.name
            WHERE country IN %s;
            '''
            cursor.execute(sql,(country,))
            all_data = cursor.fetchall()
    conn.close()
    print('aaa')
    return all_data


@st.cache_resource
def get_country():
    conn = psycopg2.connect(host=os.environ['POSTGRE_HOST'],
                            database=os.environ['POSTGRE_DATABASE'],
                            user=os.environ['POSTGRE_USER'],
                            password=os.environ['POSTGRE_PASSWORD'])
    with conn:
        with conn.cursor() as cursor:
            sql = '''
            SELECT * FROM 市場
            '''
            cursor.execute(sql)
            all_country = cursor.fetchall()
    conn.close()
    input_dict = dict(all_country)
    return input_dict.values()

def user_select():
    # default_country=tuple(st.session_state.stocks)
    # df = pd.DataFrame(getData((default_country,)),columns=['國家','代號','日期','收盤價','成交量'])
    # df["收盤價"] = df["收盤價"].astype('float').round(decimals=2)
    # # df
    # st.line_chart(data=df,x='日期',y='收盤價',color='國家')

    selected_countries = tuple(st.session_state.stocks)
    # 根據使用者選擇更新資料
    if selected_countries:
        data = getData(selected_countries)
        df = pd.DataFrame(data, columns=['國家', '代號', '日期', '收盤價', '成交量'])
        df["收盤價"] = df["收盤價"].astype('float').round(decimals=2)
        st.session_state['filtered_df'] = df  # 將更新的 DataFrame 儲存到 session_state


    # print('使用者選擇了')
    # print(st.session_state.stocks)

# print(getData())

st.title('世界大盤分析')
default_country = '台灣'

with st.sidebar:
    st.title('請選擇股票市場:')
    
    st.multiselect("請選擇",get_country(),
                    default=default_country,
                    placeholder="請選擇市場",
                    label_visibility='hidden',
                    key='stocks',
                    on_change=user_select)
    st.write(default_country)
    
# df = pd.DataFrame(getData((default_country,)),columns=['國家','代號','日期','收盤價','成交量'])
# df["收盤價"] = df["收盤價"].astype('float').round(decimals=2)

# 初始化或更新的 DataFrame
if 'filtered_df' in st.session_state:
    df = st.session_state['filtered_df']
else:
    df = pd.DataFrame(getData((default_country,)), columns=['國家', '代號', '日期', '收盤價', '成交量'])
    df["收盤價"] = df["收盤價"].astype('float').round(decimals=2)
    st.session_state['filtered_df'] = df


# df
st.line_chart(data=df,x='日期',y='收盤價',color='國家')