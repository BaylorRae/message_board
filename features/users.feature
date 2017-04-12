@users
Feature: users

  Scenario: create an account
    When bob creates an account
    Then bob should be logged into their account

  Scenario: log into an account
    When pending
