from django.shortcuts import render

# Create your views here.

def main(request):
    return render(request,"Login.html")

def registercompnay(request):
    return render(request,"Company registration.html")

def registercandidate(request):
    return render(request,"Candidate registration.html")

def verifycompany(request):
    return render(request,"verify company.html")

def viewcandidate(request):
    return render(request,"view candidate.html")
    
def viewcareerguide(request):
    return render(request,"view carrer guide.html")

def addvacancy(request):
    return render(request,"addvacancy.html")

def viewvacancy(request):
    return render(request,"view_vacancy.html")

def apply(request):
    return render(request,"Apply.html")

def  addcareerguidance(request):
    return render(request,"addcareerguidence.html")

def  viewcareerguidance(request):
    return render(request,"view carrer guide.html")

def addquestion(request):
    return render(request,"add question.html")

def addmockquestion(request):
    return render(request,"add Mock question.html")

def editquestion(request):
    return render(request,"edit Qustions.html")

def editmockquestion(request):
    return render(request,"editMock Qustions.html")

def attendmock(request):
    return render(request,"attendmocktest.html")

def attendtest(request):
    return render(request,"attendtest.html")

def viewmockresult(request):
    return render(request,"Mocktest_result.html")

def viewresult(request):
    return render(request,"test_result.html")

def postcandidatecompliant(request):
    return render(request,"candcomplaintpost.html")

def postcompcompliant(request):
    return render(request,"compcomplaintpost.html")


def viewcandidatecompliant(request):
    return render(request,"viewcandidatecomplaint.html")

def viewcompcompliant(request):
    return render(request,"candidateviewreply.html")

def viewcandidatecompliantreply(request):
    return render(request,"candcomplaintpost.html")

def viewcompcompliantreply(request):
    return render(request,"company View replay.html")

def postfeedback(request):
    return render(request,"Feedback.html")

def addtips(request):
    return render(request,"upload Tips.html")

def addvideos(request):
    return render(request,"upload videos.html")

def viewfeedback(request):
    return render(request,"View_feedback.html")








    

    