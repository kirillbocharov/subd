from django.db import connection

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
