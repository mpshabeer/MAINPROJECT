from datetime import datetime

from django.http import HttpResponse
from django.shortcuts import render

from selector.models import candidate, login
from selector.models import *
# Create your views here.

def main(request):
    return render(request,"admin/Login.html")
def logincode(request):
    uname=request.POST['username']
    password=request.POST['pwd']
    try:
        ob=login.objects.get(username=uname,password=password)


        if ob.utype == 'admin':
            return HttpResponse('''<script>alert("welcome admin");window.location='/adminhome'</script>''')
        elif ob.utype == 'company':
            request.session['lid']=ob.id
            return HttpResponse('''<script>alert("welcome company");window.location='/cmphome'</script>''')
        elif ob.utype == 'candidate':
            request.session['lid'] = ob.id
            return HttpResponse('''<script>alert("welcome candidate");window.location='/cndhome'</script>''')
        elif ob.utype == 'careerguidance':
            request.session['lid'] = ob.id
            return HttpResponse('''<script>alert("welcome careerguidance");window.location='/careerhome'</script>''')
        else:
            return HttpResponse('''<script>alert("invalid username or password");window.location='/'</script>''')
    except:
        return HttpResponse('''<script>alert("invalid username or password");window.location='/'</script>''')


def verifycompany(request):
    ob=company.objects.all()
    return render(request,"admin/verify company.html",{'val':ob})

def adminhome(request):
    return render(request,"admin/adminhome.html")

def viewcandidate(request):
    ob = candidate.objects.all()
    return render(request, "admin/view candidate.html",{'val':ob})

def  addcareerguidance(request):
    return render(request,"admin/addcareerguidence.html")


def viewcareerguide(request):
    return render(request, "admin/view carrer guide.html")

def viewcandidatecompliant(request):
    return render(request,"admin/viewcandidatecomplaint.html")


def replycomplaint(request,id):
    request.session['cid']=id
    ob=company_complaint.objects.get(id=id)
    return render(request,"admin/reply.html",{'val':ob})

def viewcompcompliant(request):
    ob=company_complaint.objects.all()
    return render(request,"admin/Viewcompanycomplaint.html",{'val':ob})

def registercompnay(request):
   
    return render(request,"company/Company registration.html")


def cmphome(request):
    return render(request, "company/companyhome.html")

def managevacancy(request):
    ob = vacancy.objects.filter(cid__lid__id=request.session['lid'])
    # request.session['cid'] = id
    # obj = test_questions.objects.filter()
    return render(request,"company/managevacancy.html",{'val':ob})

def addvacancy(request):
    return render(request,"company/addvacancy.html")

def addquestion(request,id):
    request.session['vid'] = id
    ob=vacancy.objects.get(id=id)
    return render(request,"company/add question.html",{'val':ob})


def editquestion(request,id):

    request.session['vid'] = id
    ob=test_questions.objects.filter(vid__id=id)
    return render(request,"company/edit Qustions.html",{'val':ob})

def viewresult(request):
    return render(request,"company/Test_result.html")

def postcompcompliant(request):
    ob=company_complaint.objects.filter(cid__lid__id=request.session['lid'])
    return render(request,"company/compcomplaintpost.html",{'val':ob})

def viewcompcompliantreply(request):
    return render(request,"company/company View replay.html")
def appliedstatus(request):
    return render(request,"company/appliedstatus.html")

def viewfeedback(request):
    ob=feedback.objects.all()
    return render(request,"admin/View_feedback.html",{'val':ob})

def registercandidate(request):
    return render(request,"candidate/Candidate registration.html")


def cndhome(request):
    return render(request, "candidate/candidatehome.html")


def viewvacancy(request):
    ob = vacancy.objects.all()
    return render(request,"candidate/view_vacancy.html",{'val':ob})

def apply(request):
    return render(request,"candidate/Apply.html")

def attendmock(request):
    return render(request,"candidate/attendmocktest.html")

def attendtest(request):
    return render(request,"candidate/attendtest.html")
def cancompliantpost(request):
    return render(request,"candidate/candcomplaintpost.html")

def candidatteviewreply(request):
    return render(request,"candidate/candidateviewreply.html")

def viewvideos(request):
    return render(request,"candidate/view videos.html")

def viewtips(request):
    ob=tips.objects.all()
    return render(request,"candidate/view tips.html",{'val':ob})

def postfeed(request):
    return render(request,"candidate/Feedback.html")

def addmockquestion(request):
    return render(request,"careerguidance/add Mock question.html")


def careerhome(request):
    return render(request,"careerguidance/careerhome.html")

def editmockquestion(request):
    ob=mock_test_questions.objects.all()
    return render(request,"careerguidance/editMock Qustions.html",{'val':ob})

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
    ob.utype='pending'
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
    gender=request.POST['radiobutton']
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
    ob = login()
    ob.username = un
    ob.password = ps
    ob.utype = 'careerguidance'
    ob.save()
    obj=career_guidance()
    obj.lid=ob
    obj.username=un
    obj.password=ps
    obj.save()
    

    return HttpResponse('''<script>alert("Registration Successfull");window.location='/'</script> ''')



def verifcmp(request,id):
    ob=login.objects.get(id=id)
    ob.utype='company'
    ob.save()
    return HttpResponse('''<script>alert("approved");window.location='/verifycompany'</script> ''')

def reject(request,id):
    ob=login.objects.get(id=id)
    ob.utype='rejected'
    ob.save()
    return HttpResponse('''<script>alert("rejected");window.location='/verifycompany'</script> ''')



def vacancyadd(request):
    vacancys=request.POST['textfield']
    requirments=request.POST['textfield2']
    noofvacancy=request.POST['textfield3']
    ob=vacancy()
    ob.vacancy=vacancys
    ob.requirments=requirments
    ob.no_of_vacancy=noofvacancy
    ob.cid=company.objects.get(lid__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/managevacancy'</script> ''')

def postcompliant (request):
    compliant=request.POST['textfield']
    ob=company_complaint()
    ob.cid=company.objects.get(lid__id= request.session['lid'])
    ob.complaint=compliant
    ob.date=datetime.today()
    ob.reply='pending'
    ob.save()
    return HttpResponse('''<script>alert("Compliant Added");window.location='/cmphome'</script> ''')
def postreply(request):
    reply = request.POST['textarea']
    ob=company_complaint.objects.get(id=request.session['cid'])
    ob.reply=reply
    ob.save()
    return HttpResponse('''<script>alert("Compliant Added");window.location='/viewcompcompliant'</script> ''')




def postqestions(request):
    question=request.POST['textfield']
    option1=request.POST['textfield2']
    option2 = request.POST['textfield3']
    option3 = request.POST['textfield4']
    option4 = request.POST['textfield5']
    ans = request.POST['textfield6']
    ob=test_questions()
    ob.vid=vacancy.objects.get(id= request.session['vid'])
    ob.question=question
    ob.option1=option1
    ob.option2=option2
    ob.option3=option3
    ob.option4=option4
    ob.answer=ans
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/managevacancy'</script> ''')


def postmockqestions(request):
    question=request.POST['textfield']
    option1=request.POST['textfield2']
    option2 = request.POST['textfield3']
    option3 = request.POST['textfield4']
    option4 = request.POST['textfield5']
    ans = request.POST['textfield6']
    ob=mock_test_questions()
    ob.cg_id=career_guidance.objects.get(lid__id=request.session['lid'])
    ob.question=question
    ob.option1=option1
    ob.option2=option2
    ob.option3=option3
    ob.option4=option4
    ob.answer=ans
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/addmockquestion'</script> ''')

def postfeedback(request):
    feedback1=request.POST['textfield']
    ob=feedback()
    ob.candidate_id=candidate.objects.get(lid__id=request.session['lid'])
    ob.feedback=feedback1
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/cndhome'</script> ''')

def posttips(request):
    tips1=request.POST['textfield']
    ob=tips()
    ob.date=datetime.today()
    ob.tips=tips1
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/careerhome'</script> ''')




    