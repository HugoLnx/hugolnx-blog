@javascript
@comment
Feature: Coment a post
  To show my opnion about the post
  As a post reader
  I should write a coment and submit it

  Background:
    Given I am on newest post page
    And my twitter have:
      | name        | Hugo       |
      | nickname    | hugolnx    |
      | image       | avatar.jpg |
    And I follow "Logue no Twitter para comentar" within "div#commentForm"

  @comment_success
  Scenario: I fill author and content fields
    Given I fill in "content" of "comment" with "Testing comment" within "form#comment"
    When I press "Comentar" within "form#comment"
    Then I should see within "div#comments div#comment1" some informations:
      | name        | Hugo            |
      | nickname    | hugolnx         |
      | image       | avatar.jpg      |
      | content     | Testing comment |

  @comment_fail_empty_content
  Scenario: I don't fill content field
    Given I do nothing
    When I press "Comentar" within "form#comment"
    Then I should see that the field to "content" of "comment" have a "field_error"
