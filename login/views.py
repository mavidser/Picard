from login.forms import *
from django.http import HttpResponse
from django.shortcuts import render
from django.http import HttpResponseRedirect
from login.models import Users, Colleges, Projects
from django.template import RequestContext, loader
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout

def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/')

def handle_uploaded_file(f):
    with open('picard/media/a.jpg', 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)

def new(request):
    template = loader.get_template('login/new.html')
    if request.method == 'POST': # If the form has been submitted...
        form = NewProjectForm(request.POST, request.FILES) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # return HttpResponseRedirect('/success/url/')
            # form.save()

            name = request.POST['name']
            desc = request.POST['desc']
            category= request.POST['category']
            tags = request.POST['tags']
            partdone = request.POST['partdone']
            partplanned = request.POST['partplanned']
            partrequired = request.POST['partrequired']
            partner = request.POST['partner1']+'|'+request.POST['partner2']+'|'+request.POST['partner3']
            userr=Users.objects.get(pk=request.user.username)
            try:
                photo=request.FILES['photo']
            except:
                photo=''
            instance = Projects(name=name,desc=desc,category=category,tags=tags,partners=partner,timecreated='2012-12-12',photo=photo,user=userr,partplanned=partplanned,partreq=partrequired,partdone=partdone)
            # handle_uploaded_file(request.FILES['photo'])
            nop = Users.objects.get(pk=request.user.username).college
            nop.noofprojects=nop.noofprojects+1
            nop.save()
            instance.save()
            s='/project/'+str(instance.projectid)
            return HttpResponseRedirect(s)

    #           user = authenticate(username=username, password=password)
    #         if user is not None:
    #             if user.is_active:
    #                 login(request, user)
    #                 return HttpResponseRedirect('/user/'+user.username)
    #                 # Redirect to a success page.
    #             else:
    #                 return HttpResponseRedirect('/logdin/')
    #                 # Return a 'disabled account' error message
        else:
            return HttpResponseRedirect('/new/')
    else:
        form = NewProjectForm() # An unbound form
    context = RequestContext(request, {
                             'form': form
                             })
    return HttpResponse(template.render(context))

def signup(request):
    template = loader.get_template('login/signup.html')
    form = SignUpForm() # An unbound form
    if request.method == 'POST': # If the form has been submitted...
        form = SignUpForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            username = request.POST['username']
            password = request.POST['password']
            first_name = request.POST['first_name']
            last_name = request.POST['last_name']
            email = request.POST['email']
            college = request.POST['college']
            college=int(college)
            college = Colleges.objects.get(pk=college)
            # college2 = Users.objects.get(college=)
            year = request.POST['year']
            user = User.objects.create_user(username, email, password, first_name=first_name, last_name=last_name)
            userdetails = Users.objects.create(userid=username,year=year,college=college,xp=0,fb_id='')
            # if user is not None:
                # if user.is_active:
                    # login(request, user)
            # return HttpResponseRedirect('/user/'+username)
                    # Redirect to a success page.
                # else:
                    # return HttpResponseRedirect('/signup/')
                    # Return a 'disabled account' error message
            # else:
                # return HttpResponseRedirect('/logddin/')
            return HttpResponseRedirect('/user/'+username)
    else:
        form = SignUpForm() # An unbound form
    context = RequestContext(request, {
         'form': form
     })
    return HttpResponse(template.render(context))

def loginwrong(request):
    template = loader.get_template('login/loginwrong.html')
    if request.method == 'POST': # If the form has been submitted...
        form = LoginForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect('/user/'+user.username)
                    # Redirect to a success page.
                else:
                    return HttpResponseRedirect('/login/')
                    # Return a 'disabled account' error message
            else:
                return HttpResponseRedirect('/loginwrong/')
    else:
        form = LoginForm() # An unbound form
    context = RequestContext(request, {
                             'form': form
                             })
    return HttpResponse(template.render(context))
    #return HttpResponse('Hello World')

def index(request):
    template = loader.get_template('login/login.html')
    if request.method == 'POST': # If the form has been submitted...
        form = LoginForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect('/user/'+user.username)
                    # Redirect to a success page.
                else:
                    return HttpResponseRedirect('/login/')
                    # Return a 'disabled account' error message
            else:
                return HttpResponseRedirect('/loginwrong/')
    else:
        form = LoginForm() # An unbound form
    context = RequestContext(request, {
                             'form': form
                             })
    return HttpResponse(template.render(context))
	#return HttpResponse('Hello World')

def user(request, username):
    template = loader.get_template('login/user.html')
    details=Users.objects.get(pk=username)
    if request.method == 'POST': # If the form has been submitted...
        form = SearchForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # Process the data in form.cleaned_data
            # ...
            return HttpResponseRedirect('/searc/') # Redirect after POST
    else:
        form = SearchForm() # An unbound form
    context = RequestContext(request, {
         'User': details,
         'form': form
     })
    return HttpResponse(template.render(context))

def project(request, projectid):
    template = loader.get_template('login/project.html')
    details=Projects.objects.get(pk=projectid)
    if request.method == 'POST': # If the form has been submitted...
        form = SearchForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # Process the data in form.cleaned_data
            # ...
            return HttpResponseRedirect('/search/') # Redirect after POST
    else:
        form = SearchForm() # An unbound form
    context = RequestContext(request, {
         'Project': details,
         'form': form
     })
    return HttpResponse(template.render(context))

def college(request, collegeid):
    template = loader.get_template('login/college.html')
    details=Colleges.objects.get(pk=collegeid)
    pro=Projects.objects.filter(user__in=Users.objects.filter(college=collegeid))
    if request.method == 'POST': # If the form has been submitted...
        form = SearchForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # Process the data in form.cleaned_data
            # ...
            return HttpResponseRedirect('/search/') # Redirect after POST
    else:
        form = SearchForm() # An unbound form
    context = RequestContext(request, {
         'projects': pro,
         'college': details,
         'users': details.users_set.all(),
         'form': form
    })
    return HttpResponse(template.render(context))

def listcollege(request):
    template = loader.get_template('login/colleges.html')
    details=Colleges.objects.all()
    if request.method == 'POST': # If the form has been submitted...
        form = SearchForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # Process the data in form.cleaned_data
            # ...
            return HttpResponseRedirect('/search/') # Redirect after POST
    else:
        form = SearchForm() # An unbound form
    context = RequestContext(request, {
         'colleges': details,
         'form': form
    })
    return HttpResponse(template.render(context))

def search(request):
    # template = loader.get_template('login/search.html')
    if request.method == 'POST': # If the form has been submitted...
        form = SearchForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            # Process the data in form.cleaned_data
            # ...
            query=form.cleaned_data['query']
            return render(request, 'login/search.html', {
              'form': form,
              'query': query
            })
            # return HttpResponseRedirect('/search/') # Redirect after POST
    else:
        form = SearchForm() # An unbound form

    return render(request, 'login/search.html', {
        'form': form,
        'query': 'NODATAENTERED'
    })
