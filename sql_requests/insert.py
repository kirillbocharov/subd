from django.db import connection
from other.scripts import to_md5
from datetime import datetime

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

def add_comment(news_id, user_id, comment):
    cursor = connection.cursor()
    request = (
        'INSERT INTO Comments(News_id, User_id, Date_sent, Text_cmt) '
        'VALUES("{news_id}", "{user_id}", "{date}", "{comment}");'
    ).format(
        news_id = news_id,
        user_id = user_id,
        date = datetime.now,
        comment = comment,
    )
    cursor.execute(request)