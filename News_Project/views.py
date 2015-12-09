from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.shortcuts import render_to_response
from django.db import connection
from django.template.context_processors import csrf
from sql_requests.insert import add_user
from sql_requests.select import has_login


def index(request):
    header = 'Header!'

    cursor = connection.cursor()
    cursor.execute('SELECT * FROM News')
    data = cursor.fetchall()

    return render_to_response('index.html', {'header': header, 'news': data})


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
        # try:
        #     age = int(data.get('age', ''))
        # except ValueError:
        #     errors.append('Age must be number')
        if not errors:
            if data['password'] == data['password_confirmation']:
                print data['password']
            print 'great'
            add_user(data['login'], data['password'], data['email'])
            # return HttpResponseRedirect('index.html')
    c['errors'] = errors
    return render_to_response('signUp.html', c)
