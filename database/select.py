import cx_Oracle
import hashlib
from django.db import connection
from other.scripts import to_md5
from oracle_connector.connector import get_db_connection


def get_name_user(id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_NAME_USER', [id, result_cursor, ])[1].fetchone()
    if result is None:
        return 'Undefined'
    else:
        return result[1]


def get_id_user(name):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_ID_USER', [name, result_cursor, ])[1].fetchone()
    if result is None:
        return 0
    else:
        return result[0]


def get_news():
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_NEWS', [result_cursor, ])
    fetchall = result[0]
    return dictfetchall(fetchall)


def get_categories():
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_CATEGORIES', [result_cursor, ])
    fetchall = result[0]
    return dictfetchall(fetchall)


def dictfetchall(cursor):
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]


def dictfetcone(cursor):
    desc = cursor.description
    result = dict(zip([col[0] for col in desc], cursor.fetchone()))

    print result
    return result


def has_login(user_name):
    numberp = 10;
    db = get_db_connection()
    cur = db.cursor()
    result = cur.callproc('HAS_LOGIN', [user_name, numberp ])
    return bool(result[1])


def has_email(email):
    numberp = 10;
    db = get_db_connection()
    cur = db.cursor()
    result = cur.callproc('HAS_EMAIL', [email, numberp ])
    return bool(result[1])


def is_user_exists(email, password):
    hash_pass = to_md5(password)
    user_id = None
    db = get_db_connection()
    cur = db.cursor()
    result = cur.callproc('VERIFY_USER', [email, hash_pass, user_id, ])
    return int(result[2])


def get_news_by_name(user_name):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_NEWS_BY_NAME', [user_name, result_cursor, ])
    return dictfetchall(result[1])


def get_comments(article_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_COMMENTS', [article_id, result_cursor, ])
    return dictfetchall(result[1])


def get_private_messages(user_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_PRIVATE_MESSAGES', [user_id, result_cursor, ])
    return dictfetchall(result[1])


def is_admin(user_id):
    roles = 0
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('IS_ADMIN', [user_id, roles, ])
    return bool(result[1] > 0)


def is_left_like(article_id, user_id):
    isLeft = 0
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('IS_LEFT_LIKE', [article_id, user_id, isLeft, ])
    return bool(result[2])


def get_sandboxed_articles(category_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    if category_id is None:
        result = cur.callproc('GET_SANDBOXED_ARTICLES', [result_cursor, ])
    else:
        result = cur.callproc('GET_SANDBOXED_ARTICLES_CAT', [int(category_id), result_cursor, ])
        result[0] = result[1]
    return dictfetchall(result[0])


def get_owner_article(article_id):
    owner_id = None
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_OWNER_ARTICLE', [article_id, owner_id])
    return result[1]


def get_article(article_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_ARTICLE', [article_id, result_cursor, ])
    return dictfetcone(result[1])


def get_max_id_user():
    max_id = None
    db = get_db_connection()
    cur = db.cursor()
    result = cur.callproc('GET_MAX_ID_USER', [max_id, ])
    return result[0]


def get_category_name(cat_id):
    if cat_id is None:
        return ''
    name = None
    db = get_db_connection()
    cur = db.cursor()
    result = cur.callproc('GET_CATEGORY_NAME', [cat_id, name])
    return result[1]


def get_approvals(news_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_APPROVALS', [news_id, result_cursor, ])
    fetchall = result[1]
    return dictfetchall(fetchall)


def get_bookmarks(user_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('GET_BOOKMAKRS', [user_id, result_cursor, ])
    return dictfetchall(result[1])
