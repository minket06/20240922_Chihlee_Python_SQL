A590301AA


python+SQL資料庫
VSCODE，GITHUB設定
git config --global user.name "minket06"
git config --global user.email "minket06@yahoo.com.tw"
git config --global pull.rebase false
-----------------------教室內(RP4_a19)
piRobert0301.local

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

pip install -r requirement.txt
