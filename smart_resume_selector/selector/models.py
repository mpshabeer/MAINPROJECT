from django.db import models

# Create your models here.

class login(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    utype=models.CharField(max_length=100)

class company(models.Model):
    lid=models.ForeignKey(login,on_delete=models.CASCADE)
    cname=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    # pin=models.IntegerField
    phone=models.BigIntegerField
    mail=models.CharField(max_length=100)

class candidate(models.Model):
    lid=models.ForeignKey(login,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)
    address=models.CharField( max_length=150)
    phone=models.BigIntegerField()
    mail=models.CharField(max_length=100)

class career_guidance(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    lid = models.ForeignKey(login, on_delete=models.CASCADE)

class vacancy(models.Model):
    cid=models.ForeignKey(company,on_delete=models.CASCADE)
    vacancy=models.CharField(max_length=100)
    requirments=models.TextField()
    experiance=models.IntegerField()
    no_of_vacancy=models.IntegerField()

class applied(models.Model):
    vid=models.ForeignKey(vacancy,on_delete=models.CASCADE)
    candidate_id=models.ForeignKey(candidate,on_delete=models.CASCADE)
    predicted_score=models.FloatField(max_length=500)
    status=models.CharField(max_length=100)
    resume=models.FileField()

class mock_test_questions(models.Model):
    cg_id=models.ForeignKey(career_guidance,on_delete=models.CASCADE)
    question=models.CharField(max_length=500)
    option1=models.CharField(max_length=100)
    option2=models.CharField(max_length=100)
    option3=models.CharField(max_length=100)
    option4=models.CharField(max_length=100)
    answer=models.CharField(max_length=100)

class test_questions(models.Model):
    vid=models.ForeignKey(vacancy,on_delete=models.CASCADE)
    question=models.CharField(max_length=500)
    option1=models.CharField(max_length=100)
    option2=models.CharField(max_length=100)
    option3=models.CharField(max_length=100)
    option4=models.CharField(max_length=100)
    answer=models.CharField(max_length=100)

class mock_result(models.Model):

    question_id = models.ForeignKey(mock_test_questions, on_delete=models.CASCADE)
    candidate_id=models.ForeignKey(candidate,on_delete=models.CASCADE)
    mark=models.FloatField
    date=models.DateField()

class test_result(models.Model):
    candidate_id=models.ForeignKey(candidate,on_delete=models.CASCADE)
    question_id=models.ForeignKey(test_questions,on_delete=models.CASCADE)
    mark=models.IntegerField()
    date=models.DateField()

class company_complaint(models.Model):
    cid=models.ForeignKey(company,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=500)
    reply=models.CharField(max_length=500)
    date=models.DateField()

class candidate_complaint(models.Model):
    candidate_id=models.ForeignKey(candidate,on_delete=models.CASCADE)
    type=models.CharField( max_length=50)
    complaint=models.CharField(max_length=500)
    reply=models.CharField(max_length=500)
    date=models.DateField()


class feedback(models.Model):
    candidate_id=models.ForeignKey(candidate,on_delete=models.CASCADE)
    feedback=models.CharField(max_length=500)


class tips(models.Model):
    date=models.DateField()
    tips=models.CharField(max_length=500)

class videos(models.Model):

    date = models.DateField()
    video=models.FileField()

class rating(models.Model):
    candidate_id=models.ForeignKey(candidate,on_delete=models.CASCADE)
    cid=models.ForeignKey(company,on_delete=models.CASCADE)
    candidate_id=models.ForeignKey(candidate,on_delete=models.CASCADE)
    rating=models.BigIntegerField()






