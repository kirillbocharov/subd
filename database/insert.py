from django.db import connection
from other.scripts import to_md5
from datetime import datetime
import cx_Oracle
from oracle_connector.connector import get_db_connection


def add_user(user_name, password, email, status_id=1):
    db = get_db_connection()
    cur = db.cursor()
    hash_pass = to_md5(password)
    result = cur.callproc('ADD_USER', [user_name, hash_pass, email, status_id])


def add_news(user_id, content, title, to_sandbox, category_id):
    db = get_db_connection()
    date_str = datetime.now().strftime('%b %d, %Y, %I:%M %p')
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('ADD_NEWS', [date_str, user_id, content, title, '', 0, to_sandbox, category_id])


def add_comment(news_id, user_id, comment):
    db = get_db_connection()
    date_str = datetime.now().strftime('%b %d, %Y, %I:%M %p')
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('ADD_COMMENT', [news_id, user_id, date_str, comment, ])


def add_like_sql(article_id, user_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('ADD_LIKE', [article_id, user_id, ])


def send_message(from_id, to_id, text):
    db = get_db_connection()
    cur = db.cursor()
    result = cur.callproc('SEND_MESSAGE', [from_id, to_id, text])


def do_approve_news(news_id, user_id, status):
    db = get_db_connection()
    cur = db.cursor()
    result = cur.callproc('INSERT_APPROVAL', [news_id, user_id, status])
