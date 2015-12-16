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


def add_news(user_id, news, header, is_sand):
    cursor = connection.cursor()
    request = (
        'INSERT INTO News(Is_sand, Text_news, Header, Foto, Number_likes, User_id) '
        'VALUES("{is_sand}", "{text_news}", "{header}", "{foto}", "{number_likes}", "{user_id}");'
    ).format(
        is_sand=is_sand,
        text_news=news,
        header=header,
        foto="Url Foto",
        number_likes=0,
        user_id=user_id,
    )
    cursor.execute(request)


def add_comment(news_id, user_id, comment):
    cursor = connection.cursor()
    date_str = datetime.now().strftime('%b %d, %Y, %I:%M %p')
    request = (
        'INSERT INTO Comments(News_id, User_id, Date_sent, Text_cmt) '
        'VALUES("{news_id}", "{user_id}", "{date}", "{comment}");'
    ).format(
        news_id=news_id,
        user_id=user_id,
        date=date_str,
        comment=comment,
    )
    cursor.execute(request)


def add_like_sql(article_id, user_id):
    cursor = connection.cursor()
    request = (
        'INSERT INTO Likes(News_id, User_id) '
        'VALUES({article_id}, {user_id});'
    ).format(
        article_id=article_id,
        user_id=user_id
    )
    cursor.execute(request)
