@board
Feature: board/posts

  Scenario: create a new thread
    When bob creates a new thread
    Then the new post should be created
      | title         | body                         | author |
      | My First Post | The body of a great new post | bob    |

  Scenario: reply to thread
    Given bob has created a thread
    When alice replies
    Then the new post should be created
      | title         | body                                 | author |
      | My First Post | This is a response to a great thread | alice  |
