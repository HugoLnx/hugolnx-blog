@coment
Feature: Coment a post
  To show my opnion about the post
  As a post reader
  I should write a coment and submit it

  @javascript
  @coment_success
  Scenario: successfuly submit
    Given I am on newest post page
    When I fill in "author" of "comment" with "HugoLnx" within "form#comment"
    And I fill in "content" of "comment" with "Testing comment" within "form#comment"
    And I press "Comentar" within "form#comment"
    Then I should see "HugoLnx" within "div#comments div#comment1 span.author"
    And I should see "Testing comment" within "div#comments div#comment1 span.content"
