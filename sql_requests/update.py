from django.db import connection


def inc_numbers_like(article_id):
    cursor = connection.cursor()
    sql_update_like = (
        'UPDATE News SET Number_likes = Number_likes + 1 WHERE News_id={article_id};'
    ).format(article_id=article_id)
    cursor.execute(sql_update_like)
    cursor.fetchone();


def inc_numbers_like_journalist(article_id):
    cursor = connection.cursor()
    sql_update_like = (
        'UPDATE News SET Number_likes_journalist = Number_likes_journalist + 1 WHERE News_id={article_id};'
    ).format(article_id=article_id)
    cursor.execute(sql_update_like)
    cursor.fetchone();


def make_journalist(user_id):
    cursor = connection.cursor()
    sql = (
        'UPDATE Users SET Status_id = 2 WHERE User_id = {user_id}'
    ).format(user_id=user_id)
    cursor.execute(sql)
    cursor.fetchone();