@users
Feature: users

  Scenario: create an account
    When bob creates an account
    Then bob should be logged into their account

  Scenario: log into an account
    Given bob has created an account
    When bob logs into their account
    Then bob should be logged into their account

  @wip
  Scenario: update account
    When pending
