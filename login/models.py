from django.conf import settings
from django.db import models
from django.contrib.auth.models import AbstractBaseUser
from django.contrib.auth.models import BaseUserManager
from datetime import *
from django.contrib.auth.models import User
# Create your models here.

class Colleges(models.Model):
    def __unicode__(self):  # Python 3: def __str__(self):
        return self.name
    collegeid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    location = models.CharField(max_length=45)
    noofprojects = models.IntegerField(default=0)
    class Meta:
        db_table = 'picard_colleges'

class Users(models.Model):
    def __unicode__(self):  # Python 3: def __str__(self):
        return self.userid
    userid = models.CharField(primary_key=True, max_length=45)
    # password = models.CharField(max_length=45)
    # name = models.CharField(max_length=45)
    year = models.IntegerField()
    college = models.ForeignKey(Colleges)
    #college = models.ForeignKey(Colleges, db_column='collegeid')
    xp = models.IntegerField(default=0)
    fb_id = models.CharField(max_length=45, blank=True,default='')
    # email = models.CharField(max_length=45, unique=True)
    def name(self):
        return User.objects.get(username=self).get_full_name()
    def email(self):
        return User.objects.get(username=self).email
    class Meta:
        db_table = 'picard_users'
    def authenticate(self,u,p):
        if u==self.userid and p==self.password:
            return True
        else:
            return False


class Projects(models.Model):
    def __unicode__(self):  # Python 3: def __str__(self):
        return self.name
    projectid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    desc = models.TextField()
    user = models.ForeignKey(Users)
    #user = models.ForeignKey('Users', db_column='userid')
    category = models.CharField(max_length=45)
    tags = models.CharField(max_length=100, blank=True)
    partners = models.CharField(max_length=180, blank=True)
    partdone = models.CharField(max_length=256, blank=True)
    partplanned = models.CharField(max_length=256, blank=True)
    partreq = models.CharField(max_length=256, blank=True)
    opensource = models.CharField(max_length=45, blank=True)
    link = models.CharField(max_length=300, blank=True)
    photo = models.ImageField(upload_to='tmp', max_length=300, blank=True)
    timecreated = models.DateTimeField()

    class Meta:
        db_table = 'picard_projects'


# class MyUser(AbstractBaseUser):
#     username = models.CharField(max_length=40, unique=True)
#     email = models.CharField(max_length=240, unique=True)
#     first_name = models.CharField(max_length=40, unique=True)
#     last_name = models.CharField(max_length=40, unique=True)
#     college = models.ForeignKey(Colleges)
#     fb_id = models.CharField(max_length=240, unique=True)
#     USERNAME_FIELD = 'username'
#     REQUIRED_FIELDS = ['email','first_name','last_name','college']

# def get_full_name(self):
#     full_name = '%s %s' % (self.first_name, self.last_name)
#     return full_name.strip()

# def get_short_name(self):
#     return self.first_name


# class CustomUserManager(BaseUserManager):
#     def _create_user(self, username, password,
#                      first_name, last_name,college,fb_id, **extra_fields):
#         now = timezone.now()
#         if not username:
#             raise ValueError('The given username must be set')
#         user = self.model(username=username,
#                           first_name=first_name, last_name=last_name,
#                           college=college,fb_id=fb_id, last_login=now,
#                           date_joined=now, **extra_fields)
#         user.set_password(password)
#         user.save(using=self._db)
#         return user

#     def create_user(self, username, password=None, **extra_fields):
#         return self._create_user(username, password, False, False,
#                                  **extra_fields)

