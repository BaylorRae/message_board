@pages
Feature: pages

  Scenario: home
    Given several posts and messages have been created
    Then the homepage should display a summary of each post

