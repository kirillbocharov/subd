from django.db import connection
from other.scripts import to_md5
from datetime import datetime
import cx_Oracle
from DBConnector.connector import get_db_connection


# def add_user(user_name, password, email, status_id=1):
#     cursor = connection.cursor()
#     pass_md5 = to_md5(password)
#     request = (
#         'INSERT INTO Users(User_name, Password, Status_id, Email) '
#         'VALUES("{user_name}", "{password}", {status_id}, "{email}");'
#     ).format(
#         user_name=user_name,
#         password=pass_md5,
#         status_id=status_id,
#         email=email)
#     cursor.execute(request)

def add_user(user_name, password, email, status_id=1):
    db = get_db_connection()
    cur = db.cursor()
    hash_pass = to_md5(password)
    result = cur.callproc('ADD_USER', [user_name, hash_pass, email, status_id])

# def add_news(user_id, news, header, is_sand):
#     cursor = connection.cursor()
#     date_str = datetime.now().strftime('%b %d, %Y, %I:%M %p')
#     request = (
#         'INSERT INTO News(Date_sent, Is_sand, Text_news, Header, Foto, Number_likes, User_id) '
#         'VALUES("{date_sent}", "{is_sand}", "{text_news}", "{header}", "{foto}", "{number_likes}", "{user_id}");'
#     ).format(
#         date_sent=date_str,
#         is_sand=is_sand,
#         text_news=news,
#         header=header,
#         foto="Url Foto",
#         number_likes=0,
#         user_id=user_id,
#     )
#     cursor.execute(request)

def add_news(user_id, news, header, is_sand):
    db = get_db_connection()
    date_str = datetime.now().strftime('%b %d, %Y, %I:%M %p')
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('ADD_NEWS', [date_str, user_id, news, header, 'url Foto', 0, is_sand ])


# def add_comment(news_id, user_id, comment):
#     cursor = connection.cursor()
#     date_str = datetime.now().strftime('%b %d, %Y, %I:%M %p')
#     request = (
#         'INSERT INTO Comments(News_id, User_id, Date_sent, Text_cmt) '
#         'VALUES("{news_id}", "{user_id}", "{date}", "{comment}");'
#     ).format(
#         news_id=news_id,
#         user_id=user_id,
#         date=date_str,
#         comment=comment,
#     )
#     cursor.execute(request)


def add_comment(news_id, user_id, comment):
    db = get_db_connection()
    date_str = datetime.now().strftime('%b %d, %Y, %I:%M %p')
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('ADD_COMMENT', [news_id, user_id, date_str, comment, ])


# def add_like_sql(article_id, user_id):
#     cursor = connection.cursor()
#     request = (
#         'INSERT INTO Likes(News_id, User_id) '
#         'VALUES({article_id}, {user_id});'
#     ).format(
#         article_id=article_id,
#         user_id=user_id
#     )
#     cursor.execute(request)


def add_like_sql(article_id, user_id):
    db = get_db_connection()
    cur = db.cursor()
    result_cursor = cur.var(cx_Oracle.CURSOR)
    result = cur.callproc('ADD_LIKE', [article_id, user_id, ])