import hashlib
from django.db import connection
from other.scripts import to_md5

__author__ = 'vadik'


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
    cursor = connection.cursor()
    request = (
        'select count() from Users where User_name="{user_name}";'
    ).format(user_name=user_name)
    cursor.execute(request)
    if cursor.fetchone()[0]:
        return True
    else:
        return False


def has_email(email):
    cursor = connection.cursor()
    request = (
        'select count() from Users where Email="{email}";'
    ).format(email=email)
    cursor.execute(request)
    result = cursor.fetchone()[0]
    if result:
        return True
    else:
        return False


def verify_user(email, password):
    if has_email(email):
        cursor = connection.cursor()
        sql_get_pass = (
            'SELECT Password, User_id FROM Users WHERE Email="{email}";'
        ).format(email=email)
        cursor.execute(sql_get_pass)
        pass_user_id = cursor.fetchone()

        real_pass = pass_user_id[0]
        user_id = pass_user_id[1]
        received_pass = to_md5(password)
        if real_pass == received_pass:
            return user_id
    return None


def get_news():
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM News WHERE Is_sand=0')
    return dictfetchall(cursor)


def get_news_by_name(user_name):
    cursor = connection.cursor()
    sql_request = (
        'SELECT * FROM News WHERE News.User_id in '
        '(SELECT User_id FROM Users WHERE User_name="{user_name}");'
    ).format(user_name=user_name)
    cursor.execute(sql_request)
    data = cursor.fetchall()
    return data


def get_name_user(id):
    cursor = connection.cursor()
    sql_get_name = (
        'SELECT User_name FROM Users WHERE User_id={user_id};'
    ).format(user_id=id)
    cursor.execute(sql_get_name)
    data = cursor.fetchone()
    if data:
        return data[0]
    else:
        return None


def get_comments(article_id):
    cursor = connection.cursor()
    sql_get_comments = (
        'SELECT Comments.*, Users.User_name FROM Comments INNER JOIN Users '
        'ON News_id = {article_id} AND Users.User_id=Comments.User_id;'
    ).format(article_id=article_id)
    cursor.execute(sql_get_comments)
    result = dictfetchall(cursor)
    return result


def is_journalist(user_id):
    cursor = connection.cursor()
    sql_get_status_id = (
        'SELECT Status_id FROM Users WHERE User_id={user_id};'
    ).format(user_id=user_id)
    cursor.execute(sql_get_status_id)
    status_id = cursor.fetchone()[0]
    if status_id == 2:
        return True
    else:
        return False


def is_left_like(article_id, user_id):
    cursor = connection.cursor()
    sql_get_like = (
        'SELECT count() FROM Likes WHERE User_id={user_id} AND News_id={article_id};'
    ).format(user_id=user_id, article_id=article_id)
    cursor.execute(sql_get_like)
    count = cursor.fetchone()[0]
    if count == 0:
        return False
    else:
        return True


# def get_childs_articles():
#     cursor = connection.cursor()
#     sql = (
#         'SELECT News.* FROM News INNER JOIN Users ON '
#         'News.User_id=Users.User_id AND Users.Status_id=1;'
#     )
#     cursor.execute(sql)
#     return cursor.fetchall()


def get_childs_articles():
    cursor = connection.cursor()
    sql = (
        'SELECT * FROM News WHERE Is_sand=1'
    )
    cursor.execute(sql)
    return dictfetchall(cursor)


def get_numlikes_journ(user_id):
    cursor = connection.cursor()
    sql = (
        'SELECT sum(News.Number_likes_journalist) FROM Users INNER JOIN News '
        'ON Users.User_id = News.User_id AND Users.User_id = {user_id};'
    ).format(user_id=user_id)
    cursor.execute(sql)
    return cursor.fetchone()[0]


def get_owner_article(article_id):
    cursor = connection.cursor()
    sql = (
        'SELECT User_id FROM News WHERE News_id = {article_id}; '
    ).format(article_id=article_id)
    cursor.execute(sql)
    return cursor.fetchone()[0]


def get_article(article_id):
    cursor = connection.cursor()
    sql = (
        'SELECT * FROM News WHERE News_id = {article_id};'
    ).format(article_id=article_id)
    cursor.execute(sql)
    return dictfetcone(cursor)