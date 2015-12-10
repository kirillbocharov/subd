from django.db import connection
from other.scripts import to_md5

__author__ = 'vadik'


def add_user(user_name, password, email, status_id=1):
    cursor = connection.cursor()
    pass_md5 = to_md5(password)
    request = (
        'INSERT INTO Users(User_name, Password, Status_id, Email) '
        'VALUES("{user_name}", "{password}", {status_id}, "{email}");'
    ).format(
        user_name=user_name,
        password=pass_md5,
        status_id=status_id,
        email=email)
    cursor.execute(request)
