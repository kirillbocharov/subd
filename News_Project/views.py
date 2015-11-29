from django.shortcuts import render
from django.shortcuts import render_to_response
from django.db import connection
# Create your views here.

def index(request):
    header = 'Header!'

    cursor = connection.cursor()
    cursor.execute('SELECT * FROM News')
    data = cursor.fetchall()
    print(data)

    return render_to_response('index.html', {'header': header, 'news': data})
