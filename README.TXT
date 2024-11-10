A590301AA


python+SQL資料庫
VSCODE，GITHUB設定
git config --global user.name "minket06"
git config --global user.email "minket06@yahoo.com.tw"
git config --global pull.rebase false
-----------------------教室內(RP4_a19)
piRobert0301.local or 192.168.0.252

a19
raspberry
-----------------------新加坡(1個月)
render
github帳號
minket06@yahoo.com.tw
https://dashboard.render.com/
render_chilLee_019
選新加坡
PGSQL 16
Free
hostname : dpg-crnsm2aj1k6c739c2t9g-a
databasename : render_chillee_019
username : render_chillee_019_user
password : Ff74F11wgiXrsNnVVjb3UtWWQHrRfKsc
--public
postgresql://render_chillee_019_user:Ff74F11wgiXrsNnVVjb3UtWWQHrRfKsc@dpg-crnsm2aj1
k6c739c2t9g-a.singapore-postgres.render.com/render_chillee_019
server:dpg-crnsm2aj1k6c739c2t9g-a.singapore-postgres.render.com
username : render_chillee_019_user
pwd : Ff74F11wgiXrsNnVVjb3UtWWQHrRfKsc
--********************************新加坡_NEW1(1個月)--**************************************************
render
github帳號
minket06@yahoo.com.tw
https://dashboard.render.com/
render_chilLee_019
選新加坡
PGSQL 16
Free
hostname : dpg-crnsm2aj1k6c739c2t9g-a
databasename : render_chillee_019
username : render_chillee_019_yw7r_user
password : 0bnyu6zkSsEdhb4mlE8i7d72UsRR5SOH
--public
postgresql://render_chillee_019_yw7r_user:0bnyu6zkSsEdhb4mlE8i7d72UsRR5SOH@dpg-csjhpllsvqrc73escsm0-a.singapore-postgres.render.com/render_chillee_019_yw7r
server:dpg-csjhpllsvqrc73escsm0-a.singapore-postgres.render.com
username : render_chillee_019_yw7r_user
pwd : 0bnyu6zkSsEdhb4mlE8i7d72UsRR5SOH

--internal
Internal Database URL : postgresql://render_chillee_019_yw7r_user:0bnyu6zkSsEdhb4mlE8i7d72UsRR5SOH@dpg-csjhpllsvqrc73escsm0-a/render_chillee_019_yw7r

---------------------------
conda --version

--***conda init***
conda init --all bash

--***取消termail一開始就進入base虛擬環境***
conda config --set auto_activate_base false


--***檢查目前已建立的虛擬環境***
conda env list

--***建立虛擬環境***
conda create --name myenv python=3.10
conda create --name envv1 python=3.11

conda create --name chihlee_sql python=3.10

--***啟動虛擬環境***
conda activate myenv
conda activate envv1

conda activate chihlee_sql

--***離開虛擬環境***
conda deactivate


--***刪除虛擬環境***
conda env remove --name myenv
conda env remove --name envv1

conda env remove --name chihlee_sql

--***ipython
python
exit()

--*******安裝Jupyter notebook(VSCODE開發PYTHON，測試用，.ipynb)

--************安裝套件psycopg2-binary*****(Python 和Postgresql通訊)
pip install psycopg2-binary

--***********使用套件 psycopg2************
import psycopg2

# Connect to your postgres DB
conn = psycopg2.connect("dbname=test user=postgres")

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a query
cur.execute("SELECT * FROM my_data")

# Retrieve query results
records = cur.fetchall()

pip install -r requirements.txt
---------------------------------------------
KCGPT2@mail.kcdairy.com.tw<mailto:KCGPT2@mail.kcdairy.com.tw>
KC87518788#258
----------------------------------------
notion
---------------------------------------
.env
POSTGRE_HOST=piRobert0301.local
POSTGRE_DATABASE=mydatabase_a19
POSTGRE_USER=a19
POSTGRE_PASSWORD=raspberry

HOST=piRobert0301.local
DATABASE=mydatabase_a19
USER=a19
PASSWORD=raspberry

HOST_RENDER=dpg-csjhpllsvqrc73escsm0-a.singapore-postgres.render.com
DATABASE_RENDER=render_chillee_019_yw7r
USER_RENDER=render_chillee_019_yw7r_user
PASSWORD_RENDER=0bnyu6zkSsEdhb4mlE8i7d72UsRR5SOH

