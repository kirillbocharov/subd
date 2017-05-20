"""SUBD_Project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
from chasopis import views

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', views.index, name='index'),
    url(r'^register/$', views.register),
    url(r'^login', views.sign_in),
    url(r'^article/(?P<article_id>\d+)/$', views.article),
    url(r'^bookmark/(?P<article_id>\d+)/$', views.bookmark),
    url(r'^user/(?P<user_name>\w+)/$', views.user_page),
    url(r'^inbox/?$', views.inbox),
    url(r'^bookmarks/?$', views.bookmarks),
    url(r'^submit/?(\d+)?/?$', views.submit),
    url(r'^logout/?$', views.logout),
    url(r'^sandbox/?(\d+)?/?$', views.sandbox),
    url(r'^delete/?(\d+)/?$', views.remove_news),
    url(r'^approve/?(\d+)/?$', views.approve_news),
    url(r'^disapprove/?(\d+)/?$', views.disapprove_news),
]
