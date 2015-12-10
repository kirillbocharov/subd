import hashlib
from django.db import connection
from other.scripts import to_md5

__author__ = 'vadik'


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
    cursor.execute('SELECT * FROM News')
    data = cursor.fetchall()
    return data
