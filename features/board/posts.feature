@board
Feature: board/posts

  Scenario: create a new post
    When bob creates a new post
    Then the new post should be created
      | title         | body                         | author |
      | My First Post | The body of a great new post | bob    |
