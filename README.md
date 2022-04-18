# Boiler Math

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Learn math, check Purdue Math past exams and review for upcoming midterms and finals with this math learning app for Purdue Student! Your professors won't provide sample questions and past exams? Don't know how to prepare for  math exams and tests? Want to find more valuable questions to practice? Get unstuck ASAP with our app for a variety of authentic past math exams in Purdue University.
We’ve got you covered from basic arithmetic to advanced calculus and geometry. You CAN do math!

### App Evaluation

- **Category:** Education
- **Mobile:** This app would be developed for ios.
- **Story:** Help students easily look up Purdue past math exams. Users can download every exam that they think is helpful and rate the difficulty of each exam. They can also comment their thoughts and solutions.
- **Market:** Any Purdue students who are taking Math classes or having trouble preparing for their upcoming exams.
- **Habit:** Purdue Students are using the app daily or before exams to check their performance and be well prepared.
- **Scope:** By using this app, students can prepare their Math exams more easily. They may form studying group and help each other to improve Math skills.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can create a new account(completed)
* User can login(completed)
* User can view an exam(completed)
* User can mark an exam(completed)
* User can post a new comment to exams(completed)
* User can like an exam
* User can rate the difficulty of an exam
* User can download an exam(completed)


**Optional Nice-to-have Stories**

* User can upload an exam
* User can share an exam
* User can view the exam they marked completed and liked.
* User can search for a specific exam
* User can follow other users
* User can view others' collection

### 2. Screen Archetypes

* Login Screen
   * User can log into their account
* Registration Screen
   * User can sign up a new account
* Stream 
   * User can view an exam
   * User can like an exam
   * User can mark an exam completed
   * User can download an exam
   * User can comment an exam
   * User can rate the difficulty of an exam
   * User can view the exam they marked completed and liked.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Page
* Completed exam Page
* Liked exam page

**Flow Navigation** (Screen to Screen)

* Login successful
   * => Home Page
* Registration successful
   * => Home Page
* Course
   * => which exam page
* Exam
   * => which date page
 * back
   * => move back page
 * logout
   * => log in page
   

## Wireframes
<img src="./flow.png" width=800>
![IMG_3872](https://user-images.githubusercontent.com/82489058/163751679-84ca7100-59e1-475e-a9b3-e1cc35f1c3ed.jpg)

### [BONUS] Digital Wireframes & Mockups
<img src="./flow.png" width=800>


## Schema 
### Models
| Property        | Type  | Description |
| -------------   | ----- | ----------- |
| user name       | String | The user name of an user            |
| password        | String  |   The password of an user         |
| confirmed password        | String  |   The confirmed password of an user         |
| exam url        | String  |   The url of an exam         |
| exam answer url      | String  |   The url of an exam answer       |
| exam solution url        | String  |   The url of an exam solution         |
| average rating     | Double  |   The average rating of difficulty among all users      |
| user rating     | Double  |   The rating of difficulty of one using      |
| exam date    | String  |   The date of one past exam      |
| completed tag    | Boolean  |   The status of an exam completed or not     |
| liked tag    | Boolean  |   The status of an exam liked or not     |

### Networking
#### List of network requests by screen
   - Login Screen
      - (Read/GET) Get the username
      - (Read/GET) Get the password
   - Registration Screen
      - (Create/POST) Create a username
      - (Create/POST) Create a password
   - Home Screen
      - (Read/GET) Get the average rating, user rating, course name
      - (Read/GET) Get course info
   - Detail Screen
      - (Read/GET) Get the exam list
   - Exams Screen
      - (Read/GET) Get exam_url, answer url, solution url, average rating, user rating, exam date, completed tag, liked tag
      - (Create/POST) Create a comment
      - (Update/PUT) Update user completed status
      - (Update/PUT) Update user liked status
   - Liked Screen
      - (Read/GET) Get exam_url, answer url, solution url, average rating, user rating, exam date, completed tag, liked tag
      - (Create/POST) Create a comment
      - (Update/PUT) Update user completed status
      - (Update/PUT) Update user liked status
   - Completed Screen
      - (Read/GET) Get exam_url, answer url, solution url, average rating, user rating, exam date, completed tag, liked tag
      - (Create/POST) Create a comment
      - (Update/PUT) Update user completed status
      - (Update/PUT) Update user liked status

##### An API Of Boiler Math
- Base URL - [http://45.56.103.124/](http://45.56.103.124/)

|HTTP Verb | Endpoint | Description| Link |
|----------|----------|------------|------|
| `GET`    | /exams | get exam_url, answer url, solution url|[http://45.56.103.124/exams](http://45.56.103.124/exams)|
| `GET`    | /exam_list| get exam lists for all time|[http://45.56.103.124/exam_list](http://45.56.103.124/exam_list)|
| `GET`    | /descriptions   | get course descriptions|[http://45.56.103.124/descriptions](http://45.56.103.124/descriptions)|
| `GET`    | /names | get course names|[http://45.56.103.124/names](http://45.56.103.124/names)|


## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://submissions.us-east-1.linodeobjects.com/ios_university/_Uyvo6-s.gif' title='Video Walkthrough1' width='' alt='Video Walkthrough1' />


<img src='https://submissions.us-east-1.linodeobjects.com/ios_university/H2ZXu5uO.gif
' title='Video Walkthrough2' width='' alt='Video Walkthrough2' />


<img src='https://submissions.us-east-1.linodeobjects.com/ios_university/4IfUSEr7.gif
' title='Video Walkthrough3' width='' alt='Video Walkthrough3' />

