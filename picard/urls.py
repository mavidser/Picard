from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from picard import settings
from login import views

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'picard.views.home', name='home'),
    # url(r'^picard/', include('picard.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^login/', include('login.urls')),
    url(r'^loginwrong/', views.loginwrong, name='loginwrong'),
    url(r'^logout/', views.logout_view, name='logout'),
    url(r'^register/', views.signup, name='register'),
    url(r'^new/', views.new, name='new'),
    url(r'^signup/$', views.signup, name='signup'),
    url(r'^search/$', views.search, name='search'),
    # ex: /
    url(r'^$', views.index, name='index'),
    # ex: /college/
    url(r'^college/$', views.listcollege, name='listcollege'),

    # ex: /college/5/
    url(r'^college/(?P<collegeid>\d+)/$', views.college, name='college',),
    # ex: /user/5/
    url(r'^user/(?P<username>\S+)/$', views.user, name='user'),
    # ex: /project/5/
    url(r'^project/(?P<projectid>\d+)/$', views.project, name='project'),
)

urlpatterns += patterns('',
        url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': settings.MEDIA_ROOT,
        }),
        url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {
            'document_root': settings.STATIC_ROOT,
        }),
)
