from django.db import connection
from other.scripts import to_md5
from datetime import datetime
import cx_Oracle
from oracle_connector.connector import get_db_connection


def delete_news(news_id):
    db = get_db_connection()
    cur = db.cursor()
    result = cur.callproc('DELETE_NEWS', [news_id])