# openCX-AgendApp Development Report

Welcome to the documentation pages of the AgendApp of **openCX**!

You can find here detailed about the AgendApp, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP): 

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

**FOR HELP: https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md#Product-Vision**

## Product Vision
At Agendapp our vision is to help conference attendees better manage the lectures they want to take part in. Agendapp is an agenda/schedule type application that offers the user the opportunity to create their own personal schedule based on their own interests, helping them create the perfect programme for their needs. Unlike the old way of checking a conference programme, our app gives the user the opportunity to focus only on the lectures he wants as well as sending him notifications when the talk is about to start and the ability of checking each lecture info on the go.

---
## Elevator Pitch
For the conference attendees who want to have their own custom agenda, Agendapp is an agenda app that offers the user the opportunity to create their own schedule based on their own interests. Our product lets the user choose only the lectures that interest him, sending him notifications when the talk is about to start and also recommending others based on his previous choices. With an user friendly interface and all the details the user needs to make the best possible schedule suited to him, Agendapp is definitely the agenda app you need.

---
## Requirements

TO DO

### Use case diagram 

TO DO: CHECK IF IT CORRECT AND ADD THE DESCRIPTIONS, ETC.

### User stories

User storie map can be accesed here:
https://trello.com/invite/b/12KL9wjB/406498b55294270a6c047feb57417c93/esof-agendapp-user-stories

**User interface mockups**.
In trello link above (check the Description).

**Acceptance tests**.
In trello link above (check the Description).

**Value and effort**.
In trello link above (check the tags).

### Domain model

![Domain Model](https://github.com/softeng-feup/open-cx-facas/blob/master/docs/UML%202.png)

---

## Architecture and Design
TO DO

### Logical architecture
TO DO

### Physical architecture
TO DO

### Prototype

We have implemented a vertical prototype, a thin slice of the system. The flowing user stories are present in our prototype:

1. As a conference atendee, I want to be presented with all talks available so that I can add them to my personal schedule.
2. As a conference atendee, I want to be able to edit my schedule so I can change my mind.
3. As a conference atendee, I want to be presented with all talks available so that I can remove a talk I previously added to my schedule
4. As a conference atendee, I want to be able see my personal schedule so that I can have a fast read of how I should organize myself.
5. As a user, I want to be able to login into the app so that I can get all my personal data saved and accessible trough any device.


---

## Implementation
During implementation, while not necessary, it 

It might be also useful to explain a few aspects of the code that have the greatest potential to confuse software engineers about how it works. 

Since the code should speak by itself, try to keep this section as short and simple as possible.

Use cross-links to the code repository and only embed real fragments of code when strictly needed, since they tend to become outdated very soon.

---
## Test

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

Software project management is an art and science of planning and leading software projects, in which software projects are planned, implemented, monitored and controlled.

In the context of ESOF, we expect that each team adopts a project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track their projects.

Example of tools to do this are:
  * [Trello.com](https://trello.com)
  * [Github Projects](https://github.com/features/project-management/com)
  * [Pivotal Tracker](https://www.pivotaltracker.com)
  * [Jira](https://www.atlassian.com/software/jira)

We recommend to use the simplest tool that can possibly work for the team.




