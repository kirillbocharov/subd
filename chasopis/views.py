from django.http.response import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template.context_processors import csrf
from database.insert import add_user, add_comment, add_like_sql, add_news, send_message, do_approve_news
from database.select import has_login, is_user_exists, get_news, get_name_user, get_comments, is_admin, \
    is_left_like, get_news_by_name, get_sandboxed_articles, get_article, get_max_id_user, \
    get_private_messages, get_id_user, get_categories, get_category_name, get_approvals
from database.update import inc_numbers_like, inc_numbers_like_journalist, make_journalist
from database.delete import delete_news


def index(request):
    c = {}
    user_id = request.session.get('user_id', None)
    print 'us_id index = ', user_id
    if user_id is None:
        c['user_name'] = None
    else:
        c['user_name'] = get_name_user(user_id)
    c['news'] = get_news()
    c['is_admin'] = is_admin(user_id)
    return render_to_response('index.html', c)


def user_page(request, user_name):
    c = {}
    c.update(csrf(request))
    user_id = request.session.get('user_id', None)
    cur_user = get_name_user(user_id)
    c['user_name'] = cur_user
    c['news'] = get_news_by_name(user_name)
    c['cur_user'] = user_name
    return render_to_response('my_page.html', c)


def submit(request):
    c = {}
    errors = []
    c.update(csrf(request))
    user_id = request.session.get('user_id', None)
    cur_user = get_name_user(user_id)
    if request.method == 'POST':
        data = request.POST
        if not data.get('news', ''):
            errors.append('Article content is required!')
        if not data.get('header', ''):
            errors.append('Title is required!')
        category = int(data.get('category', 0))
        if category == 0:
            errors.append('Category is required!')
        if is_admin(user_id):
            post_to_sandbox = 0
        else:
            post_to_sandbox = 1
        if not errors:
            add_news(user_id, data['news'], data['header'], post_to_sandbox, category)
            return HttpResponseRedirect('/user/' + cur_user)
        else:
            c['errors'] = errors
    c['categories'] = get_categories()
    c['user_name'] = cur_user
    return render_to_response('submit.html', c)


def article(request, article_id):
    errors = []
    c = {}
    user_id = request.session.get('user_id', None)

    if user_id is None:
        user_name = None
    else:
        user_name = get_name_user(user_id)

    if request.method == 'POST':
        data = request.POST
        if not data.get('comment', ''):
            errors.append('Comment body is required!')
        user_id = request.session['user_id']
        add_comment(article_id, user_id, data['comment'])

    c['comments'] = get_comments(article_id)
    c['article'] = get_article(article_id)
    c['user_name'] = user_name
    c['is_admin'] = is_admin(user_id)
    c['history'] = get_approvals()
    c.update(csrf(request))

    return render_to_response('article.html', c)


def inbox(request):
    errors = []
    c = {}
    user_id = request.session.get('user_id', None)

    if user_id is None:
        user_name = None
    else:
        user_name = get_name_user(user_id)
    if request.method == 'POST':
        data = request.POST
        msg = data.get('message', '')

        to_user = data.get('username', '')
        to_id = get_id_user(to_user)

        if not msg:
            errors.append('Write message!')

        if to_id == 0:
            errors.append('User not found!')

        if not errors:
            send_message(user_id, to_id, msg)

    c['messages'] = get_private_messages(user_id)
    c['user_name'] = user_name
    c['current_id'] = user_id
    c.update(csrf(request))

    return render_to_response('inbox.html', c)


def register(request):
    errors = []
    c = {}
    c.update(csrf(request))
    if request.method == 'POST':
        data = request.POST
        if not data.get('login', ''):
            errors.append('Login must be not empty!')
        if has_login(data.get('login', '')):
            errors.append('This username already exists')
        if not data.get('password', ''):
            errors.append('Password must be not empty!')
        if not data.get('password_confirmation', ''):
            errors.append('Password confirmation is required!')
        if not errors:
            if data['password'] == data['password_confirmation']:
                add_user(data['login'], data['password'], data['email'])
                c['news'] = get_news()
                c['header'] = 'Header'
                # Get last user_id and set cookie
                user_id = get_max_id_user()

                request.session['user_id'] = user_id
                return HttpResponseRedirect('/', c)
            else:
                errors.append("Passwords do not match.")
    c['errors'] = errors
    return render_to_response('signUp.html', c)


def sign_in(request):
    errors = []
    c = {}
    c.update(csrf(request))
    if request.method == 'POST':
        data = request.POST
        if not data.get('email', ''):
            errors.append('Email is required')
        if not data.get('password', ''):
            errors.append('Password is required')
        if not errors:
            authorized_user_id = is_user_exists(data['email'], data['password'])
            print 'author ', authorized_user_id
        else:
            c['errors'] = errors
            return render_to_response('signIn.html', c)
        if authorized_user_id > 0:
            c['news'] = get_news()
            c['header'] = 'Header'
            request.session['user_id'] = authorized_user_id
            return HttpResponseRedirect('/', c)
        else:
            print 'hello'
            errors.append("Unknown email or password")
    c['errors'] = errors
    return render_to_response('signIn.html', c)


def logout(request):
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
            if is_admin(user_id):
                inc_numbers_like_journalist(article_id)
                inc_numbers_like(article_id)
            else:
                inc_numbers_like(article_id)
    address = '/article/{article_id}'.format(article_id=article_id)
    return HttpResponseRedirect(address)


def sandbox(request, category_id=None):
    data = {}
    user_id = request.session.get('user_id', None)
    if user_id is None:
        user_name = None
    else:
        user_name = get_name_user(user_id)
    data['news'] = get_sandboxed_articles(category_id)
    data['category_id'] = category_id
    data['category_name'] = get_category_name(category_id)
    data['user_name'] = user_name
    data['is_admin'] = is_admin(user_id)
    return render_to_response('sandbox.html', data)


def remove_news(request, news_id=None):
    user_id = request.session.get('user_id', None)
    if user_id is None:
        return HttpResponseRedirect('/')

    if news_id is None:
        return HttpResponseRedirect('/')

    if not is_admin(user_id):
        return HttpResponseRedirect('/')

    delete_news(int(news_id))

    return HttpResponseRedirect('/sandbox/')


def approve_news(request, news_id=None):
    user_id = request.session.get('user_id', None)
    if user_id is None:
        return HttpResponseRedirect('/')

    if news_id is None:
        return HttpResponseRedirect('/')

    if not is_admin(user_id):
        return HttpResponseRedirect('/')

    do_approve_news(int(news_id), int(user_id), 0)

    return HttpResponseRedirect('/sandbox/')


def disapprove_news(request, news_id=None):
    user_id = request.session.get('user_id', None)
    if user_id is None:
        return HttpResponseRedirect('/')

    if news_id is None:
        return HttpResponseRedirect('/')

    if not is_admin(user_id):
        return HttpResponseRedirect('/')

    do_approve_news(int(news_id), int(user_id), 1)

    return HttpResponseRedirect('/')
