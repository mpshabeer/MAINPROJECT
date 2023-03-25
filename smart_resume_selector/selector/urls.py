from django.urls import path

from selector import views

urlpatterns=[
    path('',views.main,name="main"),
    path('verifycompany', views.verifycompany, name="verifycompany"),
    path('viewcandidate',views.viewcandidate,name="viewcandidate"),
    path('addcareerguidance',views.addcareerguidance,name="addcareerguidance"),
    path('viewcareerguide',views.viewcareerguide,name="viewcareerguide"),
    path('viewcandidatecompliant',views.postcompcompliant,name="viewcandidatecompliant"),
    path('viewcompcompliant',views.viewcompcompliant,name="viewcompcompliant"),
    path('replycomplaint',views.replycomplaint,name="replycomplaint"),

    
    path('registercompnay',views.registercompnay,name="registercompnay"),
    path('addvacancy',views.addvacancy,name="addvacancy"),
    path('addquestion',views.addquestion,name="addquestion"),
    path('editquestion',views.editquestion,name="editquestion"),
    path('viewresult',views.viewresult,name="viewresult"),
    path('postcompcompliant',views.postcompcompliant,name="postcompcompliant"),
    path('viewcompcompliantreply',views.viewcompcompliantreply,name="viewcompcompliantreply"),
    path('viewfeedback',views.viewfeedback,name="viewfeedback"),

    path('registercandidate',views.registercandidate,name="registercandidate"),
    path('viewvacancy',views.viewvacancy,name="viewvacancy"),
    path('apply',views.apply,name="apply"),
    path('attendmock',views.attendmock,name="attendmock"),
    path('attendtest',views.attendtest,name="attendtest"),    
    path('cancompliantpost',views.cancompliantpost,name="cancompliantpost"),
    path('candidatteviewreply',views.candidatteviewreply,name="candidatteviewreply"),
    path('postfeedback',views.postfeedback,name="postfeedback"),
   
    path('addmockquestion',views.addmockquestion,name="addmockquestion"),
    path('editmockquestion',views.editmockquestion,name="editmockquestion"),
    path('viewmockresult',views.viewmockresult,name="viewmockresult"),
    path('addtips',views.addtips,name="addtips"),
    path('addvideos',views.addvideos,name="addvideos"),
    
    path('cmpreg',views.cmpreg,name="cmpreg"),
    path('cnreg',views.cnreg,name="cnreg"),
    path('careerreg',views.careerreg,name="careerreg"),
    
    
    
] 


































