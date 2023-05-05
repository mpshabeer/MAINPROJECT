import operator
import time
from datetime import datetime

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render, redirect
from .predictionfile_nb import predictfn
# from pyresparser import ResumeParser
from pdfminer3.layout import LAParams, LTTextBox
from pdfminer3.pdfpage import PDFPage
from pdfminer3.pdfinterp import PDFResourceManager
from pdfminer3.pdfinterp import PDFPageInterpreter
from pdfminer3.converter import TextConverter

import io, random

from selector.dt import predict1
from selector.models import candidate, login
from selector.models import *
# Create your views here.

def main(request):

    return render(request,"loginindex.html")
def logincode(request):
    uname=request.POST['username']
    password=request.POST['pwd']
    try:
        ob=login.objects.get(username=uname,password=password)
        if ob.utype == 'admin':
            ob1=auth.authenticate(username='admin',password='admin')
            if ob1 is not None:
                auth.login(request,ob1)
            return HttpResponse('''<script>alert("welcome admin");window.location='/adminhome'</script>''')
        elif ob.utype == 'verified':
            request.session['lid']=ob.id
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
            return HttpResponse('''<script>alert("welcome company");window.location='/cmphome'</script>''')
        elif ob.utype == 'candidate':
            request.session['lid'] = ob.id
            request.session['cnt'] = 0
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
            return HttpResponse('''<script>alert("welcome candidate");window.location='/cndhome'</script>''')
        elif ob.utype == 'careerguidance':
            request.session['lid'] = ob.id
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
            return HttpResponse('''<script>alert("welcome careerguidance");window.location='/careerhome'</script>''')
        else:
            return HttpResponse('''<script>alert("invalid username or password");window.location='/'</script>''')
    except:
        return HttpResponse('''<script>alert("invalid username or password");window.location='/'</script>''')

@login_required(login_url='/')
def verifycompany(request):
    ob=company.objects.all()
    return render(request,"admin/verify company.html",{'val':ob})
@login_required(login_url='/')
def adminhome(request):
    return render(request,"adminindex.html")
@login_required(login_url='/')
def viewcandidate(request):
    ob = candidate.objects.all()
    return render(request, "admin/view candidate.html",{'val':ob})

def  addcareerguidance(request):
    return render(request,"admin/addcareerguidence.html")


def viewcareerguide(request):
    return render(request, "admin/view carrer guide.html")

@login_required(login_url='/')
def viewcandidatecompliant(request):
    return render(request,"admin/viewcandidatecomplaint.html")

@login_required(login_url='/')
def replycomplaint(request,id):
    request.session['cid']=id
    ob=company_complaint.objects.get(id=id)
    return render(request,"admin/reply.html",{'val':ob})

@login_required(login_url='/')
def viewcompcompliant(request):
    ob=company_complaint.objects.all()
    return render(request,"admin/Viewcompanycomplaint.html",{'val':ob})


def registercompnay(request):
   
    return render(request,"company/Company registration.html")


@login_required(login_url='/')
def cmphome(request):
    return render(request, "companyindex.html")

@login_required(login_url='/')
def managevacancy(request):
    ob = vacancy.objects.filter(cid__lid__id=request.session['lid'])
    # request.session['cid'] = id
    # obj = test_questions.objects.filter()
    return render(request,"company/managevacancy.html",{'val':ob})

@login_required(login_url='/')
def addvacancy(request):
    return render(request,"company/addvacancy.html")

@login_required(login_url='/')
def addquestion(request,id):
    request.session['vid'] = id
    ob=vacancy.objects.get(id=id)
    return render(request,"company/add question.html",{'val':ob})


@login_required(login_url='/')
def editquestion(request,id):

    request.session['vid'] = id
    ob=test_questions.objects.filter(vid__id=id)
    return render(request,"company/edit Qustions.html",{'val':ob})

@login_required(login_url='/')
def viewresult(request,id):
    from django.db.models import Sum
    # ob=test_result.objects.filter(question_id__vid__id=id).aggregate(Sum('mark'))
    # print(ob,"==========")
    result = test_result.objects.filter(question_id__vid__id=id).values('date','candidate_id_id__name','candidate_id_id__mail').order_by('candidate_id_id').annotate(sum=Sum('mark'))
    print(result,"*****************************************")
    return render(request,"company/Test_result.html",{'val':result})

@login_required(login_url='/')
def postcompcompliant(request):
    ob=company_complaint.objects.filter(cid__lid__id=request.session['lid'])
    return render(request,"company/compcomplaintpost.html",{'val':ob})

@login_required(login_url='/')
def viewcompcompliantreply(request):
    return render(request,"company/company View replay.html")


@login_required(login_url='/')
def appliedstatus(request):
    ob=applied.objects.filter(vid__cid__lid__id=request.session['lid'])
    return render(request,"company/appliedstatus.html",{'val':ob})

@login_required(login_url='/')
def viewfeedback(request):
    ob=feedback.objects.all()
    return render(request,"admin/View_feedback.html",{'val':ob})

def registercandidate(request):
    return render(request,"candidate/Candidate registration.html")


def cndhome(request):
    return render(request, "candidateindex.html")

@login_required(login_url='/')
def viewcnresult(request):
    from django.db.models import Sum
    result = test_result.objects.filter(candidate_id__lid__id=request.session['lid']).values('question_id_id__vid_id','date', 'question_id_id__vid_id__cid_id__cname', 'question_id_id__vid_id__vacancy').order_by('candidate_id_id').annotate(sum=Sum('mark'))
    for i in result:

        score=applied.objects.filter(candidate_id__lid__id=request.session['lid'],vid__id=i['question_id_id__vid_id'])
        for jj in score:

            i['predicted_score']=jj.predicted_score
            break
        else:
            i['predicted_score'] = "pending"
        print(i)

    return render(request, "candidate/viewresult.html",{'val':result})


def viewvacancy(request):
    ob = vacancy.objects.all()
    return render(request,"candidate/view_vacancy.html",{'val':ob})

@login_required(login_url='/')
def apply(request,id):

    request.session['vid']=id
    return render(request,"candidate/Apply.html")


def attendmock(request):
    return render(request,"candidate/attendmocktest.html")


@login_required(login_url='/')
def attendtest(request):
    cnt = request.session['cnt']
    ob = test_questions.objects.filter(vid=request.session['vid'])
    q = []
    for i in ob:
        q.append(i.id)
    res1 = test_questions.objects.get(vid=request.session['vid'], id=q[cnt])
    return render(request, 'candidate/attendtest.html', {'data': res1, 'ln': len(ob),'ss':int(len(ob)-1),'cnt':int(cnt)})

def countdown(t):

    print('Fire in the hole!!')



def cancompliantpost(request):
    return render(request,"candidate/candcomplaintpost.html")

def candidatteviewreply(request):
    return render(request,"candidate/candidateviewreply.html")


@login_required(login_url='/')
def viewvideos(request):
    ob = videos.objects.all()
    return render(request,"candidate/view videos.html",{'val':ob})


@login_required(login_url='/')
def viewtips(request):
    ob=tips.objects.all()
    return render(request,"candidate/view tips.html",{'val':ob})


@login_required(login_url='/')
def postfeed(request):
    return render(request,"candidate/Feedback.html")

def addmockquestion(request):
    return render(request,"careerguidance/add Mock question.html")


def careerhome(request):
    return render(request,"careerindex.html")

def editmockquestion(request):
    ob=mock_test_questions.objects.all()
    return render(request,"careerguidance/editMock Qustions.html",{'val':ob})

def viewmockresult(request):
    return render(request,"careerguidance/Mocktest_result.html")


@login_required(login_url='/')
def addtips(request):
    ob=tips.objects.all()
    return render(request,"careerguidance/upload Tips.html",{'val':ob})

@login_required(login_url='/')
def addvideos(request):
    ob=videos.objects.all()
    return render(request,"careerguidance/upload videos.html",{'val':ob})

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



@login_required(login_url='/')
def verifcmp(request,id):
    ob=login.objects.get(id=id)
    ob.utype='verified'
    ob.save()
    return HttpResponse('''<script>alert("approved");window.location='/verifycompany'</script> ''')


@login_required(login_url='/')
def reject(request,id):
    ob=login.objects.get(id=id)
    ob.utype='rejected'
    ob.save()
    return HttpResponse('''<script>alert("rejected");window.location='/verifycompany'</script> ''')



@login_required(login_url='/')
def vacancyadd(request):
    vacancys=request.POST['textfield']
    requirments=request.POST['textfield2']
    noofvacancy=request.POST['textfield3']
    exp=request.POST['exp']
    ob=vacancy()
    ob.vacancy=vacancys
    ob.requirments=requirments
    ob.no_of_vacancy=noofvacancy
    ob.experiance=exp
    ob.cid=company.objects.get(lid__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/managevacancy'</script> ''')


@login_required(login_url='/')
def postcompliant (request):
    compliant=request.POST['textfield']
    ob=company_complaint()
    ob.cid=company.objects.get(lid__id= request.session['lid'])
    ob.complaint=compliant
    ob.date=datetime.today()
    ob.reply='pending'
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/cmphome'</script> ''')


@login_required(login_url='/')
def deletecompliant(request,id):
    ob = company_complaint.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/cmphome'</script> ''')



@login_required(login_url='/')
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

@login_required(login_url='/')
def postfeedback(request):
    feedback1=request.POST['textfield']
    ob=feedback()
    ob.candidate_id=candidate.objects.get(lid__id=request.session['lid'])
    ob.feedback=feedback1
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/cndhome'</script> ''')

@login_required(login_url='/')
def posttips(request):
    tips1=request.POST['textfield']
    ob=tips()
    ob.date=datetime.today()
    ob.tips=tips1
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/careerhome'</script> ''')

@login_required(login_url='/')
def deletevacancy(request,id):
    ob4=applied.objects.filter(vid_id=id)
    ob4.delete()
    ob3=test_result.objects.filter(question_id_id__vid_id=id)
    ob3.delete()
    ob1=test_questions.objects.filter(vid__id=id)
    ob1.delete()
    ob = vacancy.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/managevacancy'</script> ''')

@login_required(login_url='/')
def uploadresume(request):
    ob1=applied.objects.filter(candidate_id__lid__id=request.session['lid'],vid__id=request.session['vid'])
    if len(ob1) == 0:
        obv=vacancy.objects.get(id=request.session['vid'])
        req=obv.requirments.lower().replace("\r","").split('\n')
        print(req,"=================")
        resume = request.FILES['file']
        userexp=request.POST['userexp']
        if obv.experiance <= int(userexp):
            fs = FileSystemStorage()
            fp = fs.save(resume.name, resume)
            gend = '1'
            age = '18'
            # q1 = request.POST['q1']
            # q2 = request.POST['q2']
            # q3 = request.POST['q3']
            # q4 = request.POST['q4']
            # q5 = request.POST['q5']
            # fs = fp.save('1.pdf', resume)
            # print(img.filename, "===")
            # img.save(r"C:\Users\TOSHIBA\Desktop\cvanalysis\\"+img.filename.split('/')[-1])
            # img.save(r"C:\Users\TOSHIBA\Desktop\cvanalysis\1.pdf")
            save_image_path = "media/"+fp
            # resume_data = ResumeParser(save_image_path).get_extracted_data()
            # print(resume_data)
            ### Resume writing recommendation
            resume_text = pdf_reader(save_image_path).lower()
            resume_score = 0
            print("RT \n", resume_text)
            if 'objective' or 'OBJECTIVE' in resume_text:
                resume_score = resume_score + 5
                a = '[+] Awesome! You have added Objective'
            else:
                a = '[-] According to our recommendation please add your career objective, it will give your career intension to the Recruiters.'

            if 'declaration' in resume_text or 'DECLARATION' in resume_text:
                resume_score = resume_score + 5
                b = '[+] Awesome! You have added Declaration✍'
            else:
                b = '[-] According to our recommendation please add Declaration✍. It will give the assurance that everything written on your resume is true and fully acknowledged by you'
        #
            obb=vacancy.objects.get(id=request.session['vid'])
            rcs=60/len(req)
            crcs=0
            count=0
            for cr in req:
                if cr in resume_text :
                    resume_score = resume_score + rcs
                    h = '[+] Awesome! You have added your requirements⚽'
                    count=count+1
                else:
                    h = '[-] According to our recommendation please add requirements ⚽.'
            h = '[+]  You have '+str(count)+  ' requirements matches ⚽'
            if 'hobbies' in resume_text or 'HOBBIES' in resume_text or 'Interests' in resume_text or 'INTERESTS' in resume_text:
                resume_score = resume_score + 5
                c = '[+] Awesome! You have added your Hobbies⚽'
            else:
                c = '[-] According to our recommendation please add Hobbies⚽. It will show your persnality to the Recruiters and give the assurance that you are fit for this role or not.'

            if 'achievements' in resume_text or 'ACHIEVEMENTS' in resume_text:
                resume_score = resume_score + 10
                d = '[+] Awesome! You have added your Achievements🏅'
            else:
                d = '[-] According to our recommendation please add Achievements🏅. It will show that you are capable for the required position.'

            if 'projects' in resume_text or 'project' in resume_text:
                resume_score = resume_score + 15
                e = '[+] Awesome! You have added your Projects👨‍💻'
            else:
                e = '[-] According to our recommendation please add Projects👨‍💻. It will show that you have done work related the required position or not.'
            f = '**Resume Score📝**"'
            score = resume_score
            # for percent_complete in range(resume_score):
            #     score += 1
            #     time.sleep(0.1)
            g = 'Your Resume Writing Score:' + str(score)
            print(" Your Resume Writing Score: ", str(score))
            print(a, b, c, d, e)
            h = '** Note: This score is calculated based on the content that you have added in your Resume. **'
            # print(predict1(['1', '18', '5', '5', '7', '6', '5']))
            # pred = predict1([gend, age, q1, q2, q3, q4, q5])
            # print(pred)
            data = []
            # row = {"task": "success", "a": a, "b": b, "c": c, "d": d, "e": e, "prd": pred, "sc": str(score)}
            ob = applied()
            ob.predicted_score=int(score)
            ob.status='predicted'
            ob.resume = fp
            ob.candidate_id = candidate.objects.get(lid__id=request.session['lid'])
            ob.vid = vacancy.objects.get(id=request.session['vid'])
            ob.save()
            return HttpResponse('''<script>alert("uploaded");window.location='/viewvacancy'</script> ''')
        else:
            return HttpResponse('''<script>alert("The application doesnot met the minimum Experiance");window.location='/viewvacancy'</script> ''')
    else:
        return HttpResponse('''<script>alert("Already applied");window.location='/viewvacancy'</script> ''')

@login_required(login_url='/')
def uploadresume1(request):


        resume = request.FILES['file']
        userexp=request.POST['userexp']
        fs = FileSystemStorage()
        fp = fs.save(resume.name, resume)

        save_image_path = "media/"+fp

        resume_text = pdf_reader(save_image_path).lower()
        res=predictfn(resume_text)
        print("++++++++++====================")
        print("++++++++++====================")
        print("++++++++++====================")
        print(res)
        print(res)
        print(res)
        print("++++++++++====================")
        print("++++++++++====================")
        print("++++++++++====================")
        ob=vacancy.objects.filter(vacancy=res,experiance__lte=int(userexp))
        return render(request, "candidate/predjob.html", {'val': ob})

@login_required(login_url='/')
def uploadvideo(request):
    vide=request.FILES['file']
    fs=FileSystemStorage()
    fp=fs.save(vide.name,vide)
    ob=videos()
    ob.video=fp
    ob.date=datetime.today()
    ob.save()
    return HttpResponse('''<script>alert("uploaded");window.location='/careerhome'</script> ''',)


def deletetips(request,id):
    ob=tips.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/addtips'</script> ''')

def deletevideo(request,id):
    ob=videos.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/addvideos'</script> ''')

def deletequestion(request,id):
    ob=test_questions.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/managevacancy'</script> ''')

def deletemockquestion(request,id):
    ob=mock_test_questions.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/editmockquestion'</script> ''')

@login_required(login_url='/')
def viewterms(request,id):
    request.session['vid']=id
    request.session['cnt'] = 0
    obb=test_result.objects.filter(candidate_id__lid__id=request.session['lid'],question_id__vid__id=id)
    check=test_questions.objects.filter(vid__id=id)
    print(check,"***************",len(check))
    print('Fire in the hole!!')
    if len(check) > 5:
        if len(obb) == 0:
            return render(request,"candidate/exam terms.html")
        else:
            return HttpResponse('''<script>alert("Already attended!!!!");window.location='/viewvacancy'</script> ''')
    else:
        return HttpResponse('''<script>alert("progress!!!!");window.location='/viewvacancy'</script> ''')


def mockterms(request):
    return render(request,"candidate/mockterms.html")
@login_required(login_url='/')
def atexam(request):
        q = request.POST['q']
        btn = request.POST['button']
        ans=request.POST['radiobutton']
        print(q)
        print(ans)
        if btn == "FINISH":
                request.session['cnt'] = 0
                obb = test_questions.objects.get(id=q)
                if obb.answer == ans:
                    print("hiiiiiiiiiiiiii")
                    ob = test_result()
                    ob.mark = 1
                    ob.date = datetime.today()
                    ob.candidate_id = candidate.objects.get(lid__id=request.session['lid'])
                    ob.question_id = test_questions.objects.get(id=q)
                    ob.save()
                    return HttpResponse('''<script>alert("succesfully attended");window.location="/cndhome"</script>''')
                else:
                    obbb= candidate.objects.get(lid__id=request.session['lid'])
                    print("hellooooooooooooooo",obbb)
                    ob = test_result()
                    ob.mark = 0
                    ob.date = datetime.today()
                    ob.candidate_id = candidate.objects.get(lid__id=request.session['lid'])
                    ob.question_id =test_questions.objects.get(id=q)
                    ob.save()
                    return HttpResponse('''<script>alert("succesfully attended");window.location="/cndhome"</script>''')
        else:

                if btn == "NEXT":
                    request.session['cnt'] = request.session['cnt'] + 1
                    obb=test_questions.objects.get(id=q)
                    if obb.answer == ans:
                        ob=test_result()
                        ob.mark=1
                        ob.date=datetime.today()
                        ob.candidate_id=candidate.objects.get(lid=request.session['lid'])
                        ob.question_id=test_questions.objects.get(id=q)
                        ob.save()
                        return redirect('attendtest')
                    else:
                        ob = test_result()
                        ob.mark = 0
                        ob.date = datetime.today()
                        ob.candidate_id = candidate.objects.get(lid=request.session['lid'])
                        ob.question_id = test_questions.objects.get(id=q)
                        ob.save()
                        return redirect('attendtest')
@login_required(login_url='/')
def deleteresume(request,id):
    ob = applied.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/appliedstatus'</script> ''')


def logout(request):
    auth.logout(request)
    return HttpResponse('''<script>alert("logouted");window.location='/'</script> ''')

@login_required(login_url='/')
def resumescore(request):
    ob = vacancy.objects.filter(cid__lid__id=request.session['lid'])
    return render(request,"company/viewresumescore.html",{'val':ob})

@login_required(login_url='/')
def rankscore(request,id):
    from django.db.models import Sum
    result = test_result.objects.filter(question_id__vid__id=id).values('date', 'candidate_id_id__name', 'candidate_id_id__phone','candidate_id_id__mail','candidate_id_id__id').order_by('candidate_id_id').annotate(sum=Sum('mark')).order_by('-sum')
    for i in result:
        score = applied.objects.filter(vid__id=id,candidate_id__id=i['candidate_id_id__id']).order_by('-predicted_score')
        print(score,"======================")
        tm=int(i['sum'])
        for jj in score:
            i['resume']=jj.resume
            i['predicted_score'] = int(jj.predicted_score)
            tm=tm+int(jj.predicted_score)/5
            break
        else:
            i['predicted_score'] = "pending"
            # i['resume']="pending"
        i['tm']=tm
        print(i)
        # qry="insert into table sortrank values()"
#     r={'date': datetime.date(2023, 4, 30), 'candidate_id_id__name': 'shabeeb', 'candidate_id_id__phone': 8281927605, 'candidate_id_id__mail': 'mpshabeer007@gmail.com', 'candidate_id_id__id': 4
# , 'sum': 9, 'predicted_score': 80, 'tm': 25.0}


    return render(request,"company/viewrankscore.html",{'val':result})


def pdf_reader(file):
    resource_manager = PDFResourceManager()
    fake_file_handle = io.StringIO()
    converter = TextConverter(resource_manager, fake_file_handle, laparams=LAParams())
    page_interpreter = PDFPageInterpreter(resource_manager, converter)
    with open(file, 'rb') as fh:
        for page in PDFPage.get_pages(fh,
                                      caching=True,
                                      check_extractable=True):
            page_interpreter.process_page(page)
            print(page)
        text = fake_file_handle.getvalue()
    converter.close()
    fake_file_handle.close()
    return text




def predictresume(request):
    return render(request,"candidate/predict.html")