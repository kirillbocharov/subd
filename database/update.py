from django.db import connection
import cx_Oracle
from oracle_connector.connector import get_db_connection


def inc_numbers_like(article_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('INC_NUMBERS_LIKE', [article_id, ])


def update_article(article_id, title, text, category_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('UPDATE_ARTICLE', [article_id, title, text, category_id])
