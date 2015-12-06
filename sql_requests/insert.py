import hashlib
from django.db import connection

__author__ = 'vadik'


def add_user(user_name, password, age, status_id=1):
    cursor = connection.cursor()
    hash_md5 = hashlib.md5()
    hash_md5.update(password)
    pass_md5 = hash_md5.hexdigest()
    request = (
        'INSERT INTO Users(User_name, Password, Age, Status_id) '
        'VALUES("{user_name}", "{password}", {age}, {status_id});'
    ).format(user_name=user_name, password=pass_md5, age=age, status_id=status_id)
    cursor.execute(request)
