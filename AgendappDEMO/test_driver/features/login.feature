Feature: login
User should be able see login after clicking filling form and pressing login button icon.

Scenario: Login into app successfully
Given A user wants to Log into the app
When User types username
  And User types password
  And User taps login button
Then User should be successfully logged