from django import forms
from django.core.validators import *
from models import *
class SearchForm(forms.Form):
    query = forms.CharField(max_length=100,label='',error_messages={'required': ''},widget=forms.TextInput(attrs={'placeholder': 'Search'}))

class LoginForm(forms.Form):
    username = forms.CharField(max_length=30,label='',error_messages={'required': 'Username Required'},widget=forms.TextInput(attrs={'placeholder': 'Username'}))
    password = forms.CharField(max_length=30,label='',error_messages={'required': 'Password Required'},widget=forms.PasswordInput(attrs={'placeholder': 'Password'}))

class SignUpForm(forms.Form):
	# class Meta:
	# 	model = Users
	first_name = forms.CharField(max_length=30,label='First Name',error_messages={'required': 'First Name Required'})
	last_name = forms.CharField(max_length=30,label='Last Name',error_messages={'required': 'Last Name Required'})
	email = forms.EmailField(max_length=30,label='Email',required=True,error_messages={'invalid': 'Enter a valid email address.','required': 'Email id is required'})
	username = forms.CharField(max_length=30,label='Username',error_messages={'required': 'Username is required'})
	password = forms.CharField(max_length=30,label='Password',error_messages={'required': 'Password is required'},widget=forms.PasswordInput)
	college = forms.ModelChoiceField(
	     queryset=Colleges.objects.all(),
	     )
	year = forms.CharField(max_length=30,label='Year of Graduation',error_messages={'required': 'Graduation Year is required'})

	def clean_username(self):
		username = self.cleaned_data['username']
		if Users.objects.filter(pk=username).exists():
			raise forms.ValidationError("That user is already taken")
		return username

	def clean_first_name(self):
		first_name = self.cleaned_data['first_name']
		if not first_name.isalpha():
			raise forms.ValidationError("The Name should consist only of alphabets.")
		return first_name

	def clean_last_name(self):
		last_name = self.cleaned_data['last_name']
		if not last_name.isalpha():
			raise forms.ValidationError("The Name should consist only of alphabets.")
		return last_name

	def clean_year(self):
		year = self.cleaned_data['year']
		if not year.isdigit():
			raise forms.ValidationError("Enter a valid year.")
		return year

class NewProjectForm(forms.Form):
	name = forms.CharField(max_length=30,label='Name of the Project',error_messages={'required': 'Name of Project is Required'})
	desc = forms.CharField(max_length=3000,label='Description',error_messages={'required': 'Description of Project is Required'},widget=forms.Textarea)
	categories = (('Web Application', 'Web Application',), ('Mobile Application', 'Mobile Application',), ('Desktop Application', 'Desktop Application'), ('Other', 'Other'))
	category = forms.ChoiceField(widget=forms.Select, choices=categories,error_messages={'required': 'Category of Project is Required'})
	tags = forms.CharField(max_length=30,required=False,label='Tags',error_messages={'required': 'Enter at least one tag'})
	partner1 = forms.CharField(max_length=30,required=False,label='Partner 1 (username)',error_messages={'required': ''})
	partner2 = forms.CharField(max_length=30,required=False,label='Partner 2 (username)',error_messages={'required': ''})
	partner3 = forms.CharField(max_length=30,required=False,label='Partner 3 (username)',error_messages={'required': ''})
	devstatus = (('In Conception', 'In Conception',), ('Pre Development', 'Pre Development',), ('In Development', 'In Development'), ('Nearly Finished', 'Nearly Finished'), ('Released to Public', 'Released to Public'))
	partdone = forms.ChoiceField(widget=forms.Select, choices=devstatus,label='Dev Status',error_messages={'required': 'Development Status is Required'})
	partplanned = forms.CharField(max_length=256,required=False,label='Part Planned',error_messages={'required': ''},)
	partrequired = forms.CharField(max_length=256,required=False,label='Part Required',error_messages={'required': ''},)
	link = forms.URLField(max_length=300,label='Link',required=False,error_messages={'required': ''})
	photo = forms.ImageField(required=False)



class NewProjectForm2(forms.ModelForm):
    class Meta:
        model = Projects

