# Crazy Racoon Project

The project is a JEE webapp.
Your goal is to create both a client and an administration panel for an employee "mood of the month" app. When the administrator want, he can send an email to each employee to remember and redirect them to the MOTM (Mood Of The Month)  . When following the link, the employee will be able to give their mood (a 1 to 5 scale) for the current month, and eventually put an additional comment anonymously.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development.

### Prerequisites

-Wildfly 10
-Eclippse-jee-oxygen
-A MySql database with mysql-connector-java-5.1.40-bin.jar

##Features

Administration : 

To connect yourself as an admin please use :
Email: teurnier@emilie.fr
Password: ok

We can't add an new admin we can add it by the BDD by changing the statut (0: user and 1: admin)

-Dashboard : allows to see an overview of the current MOTM, access some shortcut
-Edit MOTM : allows the admin to edit the title and the message of the MOTM
-Report : allows to see the result of all the current and closed MOTM 
-Statistics : allows to see the fluctuation of the average mood of the users during the years. By clicking on the button, the admin can download a CSV file.
-Manage members : allow the admin to add, edit or delete members.
-Mail settings : allows to edit the subject and the content of the mail. By clicking on the button, the admin can send the email.
-Settings : allows the user to change his lastName, firstName, email, birthdate and password
-Logout : allows the user to log out of the website

User (employee) :

-MOTM : allows the user to to give his mood (a 1 to 5 scale) for the current month, and eventually put an additional comment anonymously. He can edit his comment buy remake the comment action.
-Previous moods : allows the user to see his previous mood. It also show his previous comments and his average mood.
-Statistics : allows the user to compare the fluctuation of the average mood of all the users to his own average mood during the years
-Settings : allows the user to change his lastName, firstName, email, birthdate and password
-Logout : allows the user to log out of the website

## Open the CSV file

1. Open Excel
2. Select "From a CSV file/Text" in the Data tab
3. Change the delimiteur by personnalise and choose "$"

## DataBase

We gave you adataBase with some data for improve your online experience 

## Limits

This website can't send automatic e-mail every Friday of the week to each employee. The admin have to manually send the e-mail.

When an email is sent we have an erreur ("ERROR [io.undertow.request] (default task-19) UT005023: Exception handling request to /crazy-racoon/WEB-INF/mail.jsp: java.lang.IllegalStateException: UT010019: Response already commited"), we don't know where she comes from ...


## Related project

Training Welcome Pool 2 : https://github.com/resourcepool/training-welcomepool-2/blob/master/README.md

## Authors

Lemoine Gwladys
Pequillat Guilhem
Turnier Emilie


