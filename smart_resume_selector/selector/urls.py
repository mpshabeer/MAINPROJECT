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
    path('replycomplaint/<int:id>',views.replycomplaint,name="replycomplaint"),
    path('postreply',views.postreply,name="postreply"),
    path('attendmock',views.attendmock,name="attendmock"),

    path('registercompnay',views.registercompnay,name="registercompnay"),
    path('managevacancy',views.managevacancy,name="managevacancy"),
    path('verifcmp/<int:id>',views.verifcmp,name="verifcmp"),
    path('reject/<int:id>',views.reject,name="reject"),
    path('vacancyadd',views.vacancyadd,name="vacancyadd"),


    path('addvacancy',views.addvacancy,name="addvacancy"),
    path('addquestion/<int:id>',views.addquestion,name="addquestion"),
    path('editquestion/<int:id>',views.editquestion,name="editquestion"),
    path('viewresult/<int:id>',views.viewresult,name="viewresult"),
    path('postcompcompliant',views.postcompcompliant,name="postcompcompliant"),
    path('viewcompcompliantreply',views.viewcompcompliantreply,name="viewcompcompliantreply"),
    path('viewfeedback',views.viewfeedback,name="viewfeedback"),
    path('deletecompliant/<int:id>', views.deletecompliant, name="deletecompliant"),
    path('postcompliant', views.postcompliant, name="postcompliant"),
    path('deletevacancy/<int:id>', views.deletevacancy, name="deletevacancy"),
    path('postqestions', views.postqestions, name="postqestions"),

    path('registercandidate',views.registercandidate,name="registercandidate"),
    path('viewvacancy',views.viewvacancy,name="viewvacancy"),
    path('apply/<int:id>',views.apply,name="apply"),
    path('attendmock',views.attendmock,name="attendmock"),
    path('attendtest',views.attendtest,name="attendtest"),    
    path('cancompliantpost',views.cancompliantpost,name="cancompliantpost"),
    path('candidatteviewreply',views.candidatteviewreply,name="candidatteviewreply"),
    path('viewvideos',views.viewvideos,name="viewvideos"),
    path('viewtips',views.viewtips,name="viewtips"),
    path('postfeed', views.postfeed, name="postfeed"),
    path('postfeedback', views.postfeedback, name="postfeedback"),
    path('appliedstatus', views.appliedstatus, name="appliedstatus"),
    path('uploadresume', views.uploadresume, name="uploadresume"),
    path('viewterms/<int:id>', views.viewterms, name="viewterms"),
    path('mockterms', views.mockterms, name="mockterms"),
    path('atexam', views.atexam, name="atexam"),
    path('addmockquestion',views.addmockquestion,name="addmockquestion"),
    path('editmockquestion',views.editmockquestion,name="editmockquestion"),
    path('viewmockresult',views.viewmockresult,name="viewmockresult"),
    path('addtips',views.addtips,name="addtips"),
    path('addvideos',views.addvideos,name="addvideos"),
    path('postmockqestions',views.postmockqestions,name="postmockqestions"),
    path('posttips', views.posttips, name="posttips"),
    path('countdown', views.countdown, name="countdown"),

    path('cmpreg',views.cmpreg,name="cmpreg"),
    path('cnreg',views.cnreg,name="cnreg"),
    path('careerreg',views.careerreg,name="careerreg"),

    path('adminhome', views.adminhome, name="adminhome"),
    path('cmphome',views.cmphome,name="cmphome"),
    path('cndhome', views.cndhome, name="cndhome"),
    path('careerhome',views.careerhome,name="careerhome"),
    path('logincode',views.logincode,name="logincode"),
    

    path('uploadvideo',views.uploadvideo,name="uploadvideo"),
    path('deletetips/<int:id>', views.deletetips, name="deletetips"),
    path('deletequestion/<int:id>', views.deletequestion, name="deletequestion"),
    path('deletemockquestion/<int:id>', views.deletemockquestion, name="deletemockquestion"),

    path('deletevideo/<int:id>', views.deletevideo, name="deletevideo"),
    path('viewcnresult',views.viewcnresult,name="viewcnresult"),

    path('deleteresume/<int:id>', views.deleteresume, name="deleteresume"),

    path('logout', views.logout, name="logout"),
    path('resumescore', views.resumescore, name="resumescore"),
    path('rankscore<int:id>', views.rankscore, name="rankscore"),
] 


































