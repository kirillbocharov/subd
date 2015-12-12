from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.shortcuts import render_to_response
from django.db import connection
from django.template.context_processors import csrf
from sql_requests.insert import add_user
from sql_requests.select import has_login, verify_user, get_news


def index(request):
    header = 'Header!'

    data = get_news()
    return render_to_response('index.html', {'header': header, 'news': data})


def article(request, article_id):

    cursor = connection.cursor()
    cursor.execute('SELECT * FROM Comments WHERE News_id = {};'.format(article_id))
    comments = cursor.fetchall()
    cursor.execute('SELECT * FROM News WHERE News_id = {};'.format(article_id))
    article = cursor.fetchall()
    article = list(article[0])

    return render_to_response('article.html', {'comments': comments, 'article': article})


def register(request):
    errors = []
    c = {}
    c.update(csrf(request))
    if request.method == 'POST':
        data = request.POST
        if not data.get('login', ''):
            errors.append('Write login!')
        print has_login(data.get('login', ''))
        if has_login(data.get('login', '')):
            errors.append('This login already exists')
        if not data.get('password', ''):
            errors.append('Write password!')
        if not data.get('password_confirmation', ''):
            errors.append('Confirm passowrd')
        if not errors:
            if data['password'] == data['password_confirmation']:
                print data['password']
            print 'great'
            add_user(data['login'], data['password'], data['email'])
            c['news'] = get_news()
            c['header'] = 'Header'
            #TODO rewrite request in sql_request/select.py
            #Get last user_id and set cookie
            cursor = connection.cursor()
            cursor.execute('SELECT MAX(user_id) FROM Users;')
            user_id = cursor.fetchall()

            respons = render_to_response('index.html', c)
            respons.set_cookie('user_id', user_id)
            return respons
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
            #TODO rewrite request in sql_request/select.py
            cursor = connection.cursor()
            cursor.execute('SELECT User_id FROM Users WHERE Email = "{}";'.format(data['email']))
            user_id = cursor.fetchall()

            respons = render_to_response('index.html', c)
            #Add user_id to cookie
            respons.set_cookie('user_id', user_id)
            return respons
        else:
            errors.append("The email you've entered doesn't match any account")
    c['errors'] = errors
    return render_to_response('signIn.html', c)
