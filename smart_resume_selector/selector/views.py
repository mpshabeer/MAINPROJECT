from django.http import HttpResponse
from django.shortcuts import render

from selector.models import candidate, login
from selector.models import *
# Create your views here.

def main(request):
    return render(request,"admin/Login.html")

def verifycompany(request):
    return render(request,"admin/verify company.html")

def viewcandidate(request):
    return render(request, "admin/view candidate.html")

def  addcareerguidance(request):
    return render(request,"admin/addcareerguidence.html")


def viewcareerguide(request):
    return render(request, "admin/view carrer guide.html")

def viewcandidatecompliant(request):
    return render(request,"admin/viewcandidatecomplaint.html")


def replycomplaint(request):
    return render(request,"admin/reply.html")

def viewcompcompliant(request):
    return render(request,"admin/Viewcompanycomplaint.html")


def registercompnay(request):
   
    return render(request,"company/Company registration.html")

def addvacancy(request):
    return render(request,"company/addvacancy.html")

def addquestion(request):
    return render(request,"company/add question.html")


def editquestion(request):
    return render(request,"company/edit Qustions.html")

def viewresult(request):
    return render(request,"company/Test_result.html")

def postcompcompliant(request):
    return render(request,"company/compcomplaintpost.html")

def viewcompcompliantreply(request):
    return render(request,"company/company View replay.html")

def viewfeedback(request):
    return render(request,"company/View_feedback.html")

def registercandidate(request):
    return render(request,"candidate/Candidate registration.html")


def viewvacancy(request):
    return render(request,"candidate/view_vacancy.html")

def apply(request):
    return render(request,"candidate/Apply.html")

def attendmock(request):
    return render(request,"candidate/attendmocktest.html")

def attendtest(request):
    return render(request,"candidate/attendtest.html")
def cancompliantpost(request):
    return render(request,"candidate/candcompliantpost.html")

def candidatteviewreply(request):
    return render(request,"candidate/candidateviewreply.html")

def postfeedback(request):
    return render(request,"candidate/Feedback.html")


def addmockquestion(request):
    return render(request,"careerguidance/add Mock question.html")

def editmockquestion(request):
    return render(request,"careerguidance/editMock Qustions.html")

def viewmockresult(request):
    return render(request,"careerguidance/Mocktest_result.html")


def addtips(request):
    return render(request,"careerguidance/upload Tips.html")

def addvideos(request):
    return render(request,"careerguidance/upload videos.html")

def cmpreg(request):
    cname=request.POST['textfield']
    place=request.POST['textfield2']
    # pin=request.POST['textfield4']
    post=request.POST['textfield3']
    email=request.POST['textfield6']
    phone=request.POST['textfield5']
    un=request.POST['user']
    ps=request.POST['pwd']

    ob=login()
    ob.username=un
    ob.password=ps
    ob.utype='company'
    ob.save()

    obb=company()
    obb.cname=cname
    obb.place=place
    # obb.pin=pin
    obb.post=post
    obb.mail=email
    obb.phone=phone
    obb.lid=ob
    obb.save()
    return HttpResponse('''<script>alert("Registration Successfull");window.location='/'</script> ''')

def cnreg(request):
    name=request.POST['textfield']
    place=request.POST['textfield2']
    gender=request.POST['textfield4']
    address=request.POST['textfield3']
    email=request.POST['textfield6']
    phone=request.POST['textfield5']
    un=request.POST['user']
    ps=request.POST['pwd']

    ob=login()
    ob.username=un
    ob.password=ps
    ob.utype='candidate'
    ob.save()

    obb=candidate()
    obb.name=name
    obb.place=place
    obb.gender=gender
    obb.address=address
    obb.mail=email
    obb.phone=phone
    obb.lid=ob
    obb.save()
    return HttpResponse('''<script>alert("Registration Successfull");window.location='/'</script> ''')

def careerreg(request):
    un=request.POST['user']
    ps=request.POST['pwd']

    obj=career_guidance()
    obj.username=un
    obj.password=ps
    obj.save()
    
    ob=login()
    ob.username=un
    ob.password=ps
    ob.utype='careerguidance'
    ob.save()
    return HttpResponse('''<script>alert("Registration Successfull");window.location='/'</script> ''')







    

    