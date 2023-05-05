
import csv
rows = []
i=0
with open(r"C:\Main_project\smart_resume_selector\selector\UpdatedResumeDataSet.csv", 'r',encoding='utf-8') as file:

        csvreader = csv.reader(file)
        header = next(csvreader)
        for row in csvreader:
            rows.append(row)


# print(header)
print(rows[0])
print(len(rows))
import joblib
twt=[]
type=[]
dtype=[]
ii=0
for i in rows:

    try:
        twt.append(i[1].lower())
        type.append(i[0].lower())
        if i[0].lower() not in dtype:
            dtype.append(i[0].lower())

    except:
        pass



print(dtype)

fulltxt=" ".join(twt)

txtlist=[]



import re, math
from collections import Counter
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
WORD = re.compile(r'\w+')


def text_to_vector(text):
    words = WORD.findall(text)
    return words


def sr(txt):
     stop_words = set(stopwords.words('english'))

     word_tokens = word_tokenize(txt)

     filtered_sentence = [w for w in word_tokens if not w.lower() in stop_words]

     return filtered_sentence

onlytext=text_to_vector(fulltxt)




onlytext=' '.join(onlytext).lower()

newtxt=sr(onlytext)

distwds=[]
for i in newtxt:
    if i not in distwds:
        distwds.append(i)

print(len(distwds),"=====",distwds)


x=[]
y=[]

for i in range(0,len(twt)):
    ctw=twt[i]
    yy=dtype.index(type[i])
    y.append(yy)
    row=[]
    ctwt=text_to_vector(ctw)
    ctwt=' '.join(ctwt).lower()
    ctwt=sr(ctwt)
    row=[]
    for ii in distwds:
        if ii in ctwt:
            row.append(1)
        else:
            row.append(0)
    x.append(row)


from sklearn.datasets import make_classification
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import classification_report

from sklearn.naive_bayes import GaussianNB

X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.20)
# %%
# model = DecisionTreeClassifier(criterion = "gini",random_state = 100,max_depth=3, min_samples_leaf=5)
model = GaussianNB()

model.fit(X_train, y_train)

# Predict using the SVM model
predictions = model.predict(X_test)


predictions = model.predict(X_test)
accuracy = model.score(X_test, y_test)
print("Accuracy of NB:", accuracy)
from sklearn.metrics import confusion_matrix
cm=confusion_matrix(y_test, predictions)
print("Confusion Matrix")
print (cm)

print("\nClassification Report=\n",
          classification_report(y_test, predictions))

def predictfn(txt):
    ot = text_to_vector(txt.lower())
    ot = ' '.join(ot).lower()

    nt = sr(ot)
    row = []
    for ii in distwds:
        if ii in nt:
            row.append(1)
        else:
            row.append(0)
    res=model.predict([row])
    res=dtype[res[0]]
    return res

# txt='''MUHAMMED SHABEER M P
#
# EDUCATIONAL QUALIFICATIONS
# •	MCA-MASTER OF COMPUTER APPLICATION - Kerala Technological   University (KTU), MES engineering college Kuttipuram ,  2021-2023
# •	BCA-BACHLOR OF COMPUTER APPLICATION –Calicut University, India, Kerala , Grace Valley Arts and Science College ,Kadampuzha , 2018-2021
# •	Higher Secondary- Kerala Higher Secondary Examination Board,
# IKTHS Cherukulamba,  2016-2018
# •	High School-Kerala General Education Department, IKTHS Cherukulamba,  2016
# SKILLS
# •	C
# •	C++
# •	JAVA
# •	PYTHON
# •	ANDROID
#
# •	R
# •	SQL
# •	CSS
#
#
# PROJECT
# SMART SIGNAL (An IOT Based Smart traffic surveillance system)
# ▪	 Front End: HTML,CSS
# ▪	 Coding language: Python ,JAVA
# ▪	Backend: MySQL
# ▪	IDE:JetbrainsPyCharm3.6(web), Eclipse(Android)
# COURSE
# •	DATA MINING (Online Course) –NPTEL IIT Kharagpur
# •	Introduction to Operating System (Online Course) –NPTEL IIT Kharagpur
# EXPERIENCE
# Internship Trainee –BLUGEN SOLUTION
# •	Python & Android Framework
# •	AUG 2020- JAN 2021
# '''
# print(predictfn(txt))