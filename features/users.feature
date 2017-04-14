@users
Feature: users

  Scenario: create an account
    When bob creates an account
    Then bob should be logged into their account

  Scenario: log into an account
    Given bob has created an account
    When bob logs into their account
    Then bob should be logged into their account

  Scenario: update account
    Given bob has logged in
    When bob updates their email
    Then bob should have an updated email
