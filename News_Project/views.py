from django.shortcuts import render
from django.shortcuts import render_to_response
# Create your views here.

def index(request):
    header = 'Header!'
    return render_to_response('index.html', {'header': header})