from django.urls import path

from selector import views

urlpatterns=[
    path('',views.main,name="main"),
    path('registercompnay',views.registercompnay,name="registercompnay"),
    path('registercandidate',views.registercandidate,name="registercandidate"),
    path('registercompnay',views.registercompnay,name="registercompnay"),
    path('verifycompany',views.verifycompany,name="verifycompany"),
    path('registercompnay',views.registercompnay,name="registercompnay"),
    path('viewcandidate',views.viewcandidate,name="viewcandidate"),
    path('viewcareerguide',views.viewcareerguide,name="viewcareerguide"),
    path('addvacancy',views.addvacancy,name="addvacancy"),
    path('viewvacancy',views.viewvacancy,name="viewvacancy"),
    path('apply',views.apply,name="apply"),
    path('addcareerguidance',views.addcareerguidance,name="addcareerguidance"),
    path('addquestion',views.addquestion,name="addquestion"),
    path('addmockquestion',views.addmockquestion,name="addmockquestion"),
    path('editquestion',views.editquestion,name="editquestion"),
    path('editmockquestion',views.editmockquestion,name="editmockquestion"),
    path('attendmock',views.attendmock,name="attendmock"),
    path('attendtest',views.attendtest,name="attendtest"),
    path('viewmockresult',views.viewmockresult,name="viewmockresult"),
    path('viewresult',views.viewresult,name="viewresult"),
    path('postcandidatecompliant',views.postcandidatecompliant,name="postcandidatecompliant"),
    path('viewcandidatecompliant',views.postcompcompliant,name="viewcandidatecompliant"),
    path('viewcompcompliant',views.viewcompcompliant,name="viewcompcompliant"),
    path('postfeedback',views.postfeedback,name="postfeedback"),
    path('addtips',views.addtips,name="addtips"),
    path('attendtest',views.attendtest,name="attendtest"),
    path('addvideos',views.addvideos,name="addvideos"),
    path('viewfeedback',views.viewfeedback,name="viewfeedback"),
] 


































