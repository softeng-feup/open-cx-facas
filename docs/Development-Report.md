# openCX-AgendApp Development Report

Welcome to the documentation pages of the AgendApp of **openCX**!

You can find here detailed about the AgendApp, hereby mentioned as module, from a high-level vision to low-level implementation decisions: 

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 

Thank you!

Filipa Senra, Tiago Miller, Gustavo Magalhães, José Martins.

## Product Vision
At Agendapp our vision is to help conference attendees better manage the lectures they want to take part in. Agendapp is an agenda/schedule type application that offers the user the opportunity to create their own personal schedule based on their own interests, helping them create the perfect programme for their needs. Unlike the old way of checking a conference programme, our app gives the user the opportunity to focus only on the lectures he wants as well as sending him notifications when the talk is about to start and the ability of checking each lecture info on the go.

---
## Elevator Pitch
For the conference attendees who want to have their own custom agenda, Agendapp is an agenda app that offers the user the opportunity to create their own schedule based on their own interests. Our product lets the user choose only the lectures that interest him, sending him notifications when the talk is about to start and also recommending others based on his previous choices. With an user friendly interface and all the details the user needs to make the best possible schedule suited to him, Agendapp is definitely the agenda app you need.

---
## Requirements

The main requirements for AgendApp are for the user to be able see all the lectures a conference has and setting up his personal schedule for set conference. It is also important that the user is able to see the information of each lecture to better set up his schedule. 

### Use case diagram 

![Use case diagram](https://github.com/softeng-feup/open-cx-facas/blob/master/docs/UML%20USE%20CASE.png)

#### View Schedule:
* **Actor:** Attendee (the conference staff can also use the app like a normal user).
* **Description:** The attendee can view his personalise schedule.
* **Preconditions:** The attendee must be logged in.
* **Postconditions:** The are none.
* **Normal Flow:**
  * Actor selects the option to view the schedule.
  * Actor views his personalize schedule.
  * Actor returns to the home page.
  
#### Edit Schedule:
* **Actor:** Attendee (the conference staff can also use the app like a normal user).
* **Description:** The attendee can edit his personalise schedule.
* **Preconditions:** The attendee must be logged in.
* **Postconditions:** The are none.
* **Normal Flow:**
  * Actor selects the option to see all the talks.
  * Actor views all the talks.
  * Actor selects or unselects one or several talks.
  * Actor returns to the home page.
* **Alternate flow:**
  * Actor selects the option to view his schedule.
  * Actor views his personalize schedule.
  * Actor unselects one or several talks.
  * Actor returns to the home page.
  
#### View Talk Info:
* **Actor:** Attendee (the conference staff can also use the app like a normal user).
* **Description:** The attendee can view the info of a talk.
* **Preconditions:** The attendee must be logged in.
* **Postconditions:** The are none.
* **Normal Flow:**
  * Actor selects the option to view the schedule or to view all talks.
  * Actor views his personalize schedule or all talks.
  * Actor taps a talk block.
  * Actor views a Talk Info.
  * Actor returns to the home page.
  
#### View Alls Talks:
* **Actor:** Attendee (the conference staff can also use the app like a normal user).
* **Description:** The attendee can view all the talks avaiable at the conference.
* **Preconditions:** The attendee must be logged in.
* **Postconditions:** The are none.
* **Normal Flow:**
  * Actor selects the option to see all the talks.
  * Actor views all the talks.
  * Actor returns to the home page.
  
#### Select/Edit Interests:
* **Actor:** Attendee (the conference staff can also use the app like a normal user).
* **Description:** The attendee select or edit his interests.
* **Preconditions:** The attendee must be logged in.
* **Postconditions:** The are none.
* **Normal Flow:**
  * Actor selects the option to see his personal page.
  * Actor taps edit in the section 'My Interests'.
  * Actor selects or unselects interests.
  * Actor returns to the home page.
  
#### View Recommended Talks:
* **Actor:** Attendee (the conference staff can also use the app like a normal user).
* **Description:** The attendee can view his Recommended Talks.
* **Preconditions:** The attendee must be logged in and have interests selected.
* **Postconditions:** The are none.
* **Normal Flow:**
  * Actor selects the option to view recommended talks.
  * Actor views his recommended talks.
  * Actor can select talks to add to his schedule.
  * Actor returns to the home page.
  
#### Add Talk:
* **Actor:** Conference Staff.
* **Description:** A member of the conference staff can add a talk to the conference.
* **Preconditions:** The member of staff should have the permition to add a talk to the conference.
* **Postconditions:** The new talk will be displayed in the option 'View All Talks'.
* **Normal Flow:**
  * Actor selects the option to add a talk to the system.
  * Actor fill all the information of a talk.
  * Actor selects the button to add a new talk.
  * Actor returns to the home page.
  
#### Edit Talk:
* **Actor:** Conference Staff.
* **Description:** A member of the conference staff can edit a talk of the conference.
* **Preconditions:** The member of staff should have the permition to edit the talk.
* **Postconditions:** The attendees that had selected this talk will be notify that its information has been updated.
* **Normal Flow:**
  * Actor selects a talk.
  * Actor selects the option to edit the information of set talk.
  * Actor edits the information of the talk.
  * Actor selects the button to confirm the changes make to the information of a talk.
  * Actor returns to the home page.
  
#### Delete Talk:
* **Actor:** Conference staff.
* **Description:** A member of the conference can delete a talk of the conference.
* **Preconditions:** The member of staff should have the permition to delete the talk.
* **Postconditions:** The attendees that had selected this talk will be notify that the talk has been removed.
* **Normal Flow:**
  * Actor selects a talk.
  * Actor selects the option to remove set talk.
  * Actor returns to the home page.
  

### User stories

The user stories can be acess [here](https://trello.com/invite/b/12KL9wjB/406498b55294270a6c047feb57417c93/esof-agendapp-user-stories).

**User Stories Map**
![User Story Map](https://github.com/softeng-feup/open-cx-facas/blob/master/docs/User%20Map%20Story%20-%20User.jpg)
![Organization Story Map](https://github.com/softeng-feup/open-cx-facas/blob/master/docs/User%20Map%20Story%20-%20Organization.jpg)

**User interface mockups**.

In trello [link](https://trello.com/invite/b/12KL9wjB/406498b55294270a6c047feb57417c93/esof-agendapp-user-stories).

**Acceptance tests**.

In trello [link](https://trello.com/invite/b/12KL9wjB/406498b55294270a6c047feb57417c93/esof-agendapp-user-stories).

**Value and effort**.

In trello [link](https://trello.com/invite/b/12KL9wjB/406498b55294270a6c047feb57417c93/esof-agendapp-user-stories).


### Domain model

![Domain Model](https://github.com/softeng-feup/open-cx-facas/blob/master/docs/UML%20Domain%20Model.jpeg)

---

## Architecture and Design

This section will describe the overall components of the project and their interrelations.

---

### Logical architecture

We have decided to structure our code with the MVC(*Model-View-Controller*) design pattern. The model directly manages the data, logic and rules of the application. The view (our Screens) represents the model in a particular format. The controller responds to the user input and performs interactions on the data model objects. 
We have find it difficult to separate the Controller from the View due to the way flutter is structured.
![Package Diagram UML](https://github.com/softeng-feup/open-cx-facas/blob/master/docs/package%20diagram%20UML.png)

---

### Physical architecture

The AgendApp will be install in the user's smarthphone. The app will request the info from the database from the server each time it loads a page. It will also send requests to the server to alter the database. The user will also received notifications: pushed or schedule. 

We opted to use Flutter as the framework for our mobile application for the following reasons:
 - App runs on both IOS and Android;
 - Programming language, Dart, is fast, easy to learn and object oriented;
 - Has high performance.

![Physical architecture](https://github.com/softeng-feup/open-cx-facas/blob/master/docs/Physical%20architecture.jpeg)

---

### Prototype

We have implemented a vertical prototype, a thin slice of the system. The flowing user stories are present in our prototype:

1. As a conference atendee, I want to be presented with all talks available so that I can remove a talk I previously added to my schedule.
2. As a conference atendee, I want to be able to edit my schedule so I can change my mind.
3. As a user, I want to have a bottom navigation bar so that I can easily navigate trough the different menus.
4. As a conference attendee, I want to be able to create a personal schedule so that I can better organize myself and attend my personal needs.
5. As a conference attendee, I want to be presented with all talks available so that I can add them to my personal schedule.
6. As a conference attendee, I want to be able see my personal schedule so that I can have a fast read of how I should organize myself.
7. As a conference attendee, I want to able to touch a talk block so that I can see the info associated with that talk.
8. As a conference attendee, I want to be able to see talk info so that can have a fast read of conferences available
9. As a user, i want to have an account page so that I can manage all my personal information.
10. As an attendee of a conference, I want to be presented with suggestions of talks I should attend based on my interests and my schedule so I can take the most from the conference.
11. As a conference atendee, I want to able to update my interested areas so that i can get better recomendations.
12. As a conference atendee, i want to be able to choose my interested areas so that i can get talk recommendations.
13. As an attendee of a talk, I want to be notified when a talk I have on my schedule is about to start so that I don't get late.
14. As a conference atendee I want to be notified if there are any changes relative to a talk I want to attend so that I don't get confused.

We have also implemented the screens (front-end) of the following user-stories:
1. As a user, I want to be able recover my password in case I forgot it so that I can regain access to my account.
2. As a user, I want to be able to log off my account so that my session is over on the device that I used.
3. As a user, I want to be able to register so that I have my own credentials to access the app.
4. As a user, I want to be able to login into the app so that I can get all my personal data saved and accessible trough any device.
5. As user, I want to be able to make my profile so that I can be better identified.

---

## Implementation

All releases can be found on the [Releases page](https://github.com/softeng-feup/open-cx-facas/releases).

---
## Test

TODO: 
There are several ways of documenting testing activities, and quality assurance in general, being the most common: a strategy, a plan, test case specifications, and test checklists.

In this section it is only expected to include the following:
* test plan describing the list of features to be tested and the testing methods and tools;
* test case specifications to verify the functionalities, using unit tests and acceptance tests.
 
A good practice is to simplify this, avoiding repetitions, and automating the testing actions as much as possible.

---
## Configuration and change management

Configuration and change management are key activities to control change to, and maintain the integrity of, a project’s artifacts (code, models, documents).

For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub flow](https://guides.github.com/introduction/flow/).


---

## Project management

To plan and manage our project we used *Trello*: https://trello.com/invite/b/12KL9wjB/406498b55294270a6c047feb57417c93/esof-agendapp-user-stories
