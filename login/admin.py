from django.contrib import admin
from login.models import Users, Colleges, Projects

class ProjectsInline(admin.StackedInline):
	model = Projects
	extra = 1

class UsersAdmin(admin.ModelAdmin):
	inlines = [ProjectsInline]
	list_display = ('userid','college')
	search_fields = ['userid']

class UsersInline(admin.TabularInline):
	model = Users
	fieldsets= [
		# ('Credentials', {'fields': ['userid','password']}),
		('Basic Info', {'fields': ['userid']}),
		('College', {'fields': ['college','year']}),
		('Other', {'fields': ['fb_id','xp']}),
	]
	extra = 1
	inlines = [ProjectsInline]

class CollegesAdmin(admin.ModelAdmin):
	inlines = [UsersInline]
	list_display = ('name','location')
	search_fields = ['name','users__name']


admin.site.register(Users, UsersAdmin)
admin.site.register(Colleges,CollegesAdmin)
