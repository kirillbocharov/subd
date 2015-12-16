from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.shortcuts import render_to_response
from django.db import connection
from django.template.context_processors import csrf
from sql_requests.insert import add_user, add_comment, add_like_sql, add_news
from sql_requests.select import has_login, verify_user, get_news, get_name_user, get_comments, is_journalist, \
    is_left_like, get_news_by_name, get_childs_articles, get_numlikes_journ, get_owner_article
from sql_requests.update import inc_numbers_like, inc_numbers_like_journalist, make_journalist


def index(request):
    c = {}
    user_id = request.session.get('user_id', None)
    if user_id is None:
        c['user_name'] = None
    else:
        c['user_name'] = get_name_user(user_id)
    c['news'] = get_news()
    return render_to_response('index.html', c)


def my_page(request, user_name):
    c = {}
    errors = []
    c.update(csrf(request))
    user_id = request.session.get('user_id', None)
    if request.method == 'POST':
        data = request.POST
        if not data.get('news', ''):
            errors.append('Write news!')
        if not data.get('header', ''):
            errors.append('Write title!')
        add_news(user_id, data['news'], data['header'])
    c['user_name'] = user_name
    c['news'] = get_news_by_name(user_name)
    return render_to_response('my_page.html', c)


def article(request, article_id):
    errors = []
    c = {}
    user_id = request.session.get('user_id', None)
    # request.session['name']

    if user_id is None:
        user_name = None
    else:
        user_name = get_name_user(user_id)
    if request.method == 'POST':
        data = request.POST
        if not data.get('comment', ''):
            errors.append('Write comment!')
        # user_id = list(request.COOKIES['user_id'][2])
        user_id = request.session['user_id']
        add_comment(article_id, user_id, data['comment'])

    # TODO rewrite request in sql_request/select.py
    cursor = connection.cursor()
    c['comments'] = get_comments(article_id)
    cursor.execute('SELECT * FROM News WHERE News_id = {};'.format(article_id))
    c['article'] = list(cursor.fetchall()[0])
    c['user_name'] = user_name
    c.update(csrf(request))

    return render_to_response('article.html', c)


def register(request):
    errors = []
    c = {}
    c.update(csrf(request))
    if request.method == 'POST':
        data = request.POST
        if not data.get('login', ''):
            errors.append('Write login!')
        if has_login(data.get('login', '')):
            errors.append('This login already exists')
        if not data.get('password', ''):
            errors.append('Write password!')
        if not data.get('password_confirmation', ''):
            errors.append('Confirm passowrd')
        if not errors:
            if data['password'] == data['password_confirmation']:
                add_user(data['login'], data['password'], data['email'])
                c['news'] = get_news()
                c['header'] = 'Header'
                # TODO rewrite request in sql_request/select.py
                # Get last user_id and set cookie
                cursor = connection.cursor()
                cursor.execute('SELECT MAX(user_id) FROM Users;')
                user_id = cursor.fetchone()[0]

                request.session['user_id'] = user_id
                return HttpResponseRedirect('/', c)
            else:
                errors.append("Passwords didn't match.")
    c['errors'] = errors
    return render_to_response('signUp.html', c)


def sign_in(request):
    errors = []
    c = {}
    c.update(csrf(request))
    if request.method == 'POST':
        data = request.POST
        if not data.get('email', ''):
            errors.append('Write email!')
        if not data.get('password', ''):
            errors.append('Write password')
        if not errors:
            authorized_user_id = verify_user(data['email'], data['password'])
        else:
            c['errors'] = errors
            return render_to_response('signIn.html', c)
        if authorized_user_id is not None:
            # user is authorized
            c['news'] = get_news()
            c['header'] = 'Header'
            # TODO rewrite request in sql_request/select.py
            request.session['user_id'] = authorized_user_id
            return HttpResponseRedirect('/', c)
        else:
            errors.append("The email you've entered doesn't match any account")
    c['errors'] = errors
    return render_to_response('signIn.html', c)


def exit(request):
    try:
        del request.session['user_id']
    except KeyError:
        pass
    return HttpResponseRedirect('/', get_news())


def add_like(request, article_id):
    user_id = request.session.get('user_id', None)
    if user_id is not None:
        if not is_left_like(article_id, user_id):
            add_like_sql(article_id, user_id)
            if is_journalist(user_id):
                inc_numbers_like_journalist(article_id)
                inc_numbers_like(article_id)
                owner_article = get_owner_article(article_id)
                number_likes = get_numlikes_journ(owner_article)
                if number_likes > 0:
                    make_journalist(owner_article)
            else:
                inc_numbers_like(article_id)
    address = '/article/get/{article_id}'.format(article_id=article_id)
    return HttpResponseRedirect(address)


def sandbox(request):
    data = {}
    user_id = request.session.get('user_id', None)
    if user_id is None:
        user_name = None
    else:
        user_name = get_name_user(user_id)
    data['news'] = get_childs_articles()
    data['user_name'] = user_name
    return render_to_response('sandbox.html', data)
