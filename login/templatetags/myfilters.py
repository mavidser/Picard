from django import template
from login.models import Users, Colleges, Projects
from django.db.models import Q
from django.contrib.auth.models import User

register = template.Library()

@register.filter(name='getName')
def getName(value):
	if value=='':
		return ''
	details=Users.objects.get(pk=value)
	details=User.objects.get(username=value).get_full_name()
	return details

@register.filter(name='split')
def split(x,s):
	return x.split(s)

@register.filter(name='getUsers')
def getUsers(value):
	return User.objects.all().filter(Q(username=value)|Q(first_name__icontains=value)|Q(last_name__icontains=value))


@register.filter(name='getProjectsUser')
def getProjectsUser(value):
	return Projects.objects.all().filter(user=value)

@register.filter(name='getProjects')
def getProjects(value):
	return Projects.objects.all().filter(name__icontains=value)

@register.filter(name='getColleges')
def getColleges(value):
	return Colleges.objects.all().filter(name__icontains=value)
