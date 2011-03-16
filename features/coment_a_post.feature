@javascript
@comment
Feature: Coment a post
  To show my opnion about the post
  As a post reader
  I should write a coment and submit it

  @comment_success
  Scenario: I fill author and content fields
    Given I am on newest post page
    When I fill in "author" of "comment" with "HugoLnx" within "form#comment"
    And I fill in "content" of "comment" with "Testing comment" within "form#comment"
    And I press "Comentar" within "form#comment"
    Then I should see "HugoLnx" within "div#comments div#comment1 span.author"
    And I should see "Testing comment" within "div#comments div#comment1 span.content"

  @comment_fail_empty_author
  Scenario: I don't fill author field
    Given I am on newest post page
    And I fill in "content" of "comment" with "Testing comment" within "form#comment"
    And I press "Comentar" within "form#comment"
    Then I should see that the field to "author" of "comment" have a "field_error"

  @comment_fail_empty_content
  Scenario: I don't fill content field
    Given I am on newest post page
    When I fill in "author" of "comment" with "HugoLnx" within "form#comment"
    And I press "Comentar" within "form#comment"
    Then I should see that the field to "content" of "comment" have a "field_error"

  @comment_fail_half_fixed
  Scenario: I don't fill both fields, submit, and after fill author
    Given I am on newest post page
    When I press "Comentar" within "form#comment"
    And I fill in "author" of "comment" with "HugoLnx" within "form#comment"
    And I press "Comentar" within "form#comment"
    Then I should not see that the field to "author" of "comment" have a "field_error"
    Then I should see that the field to "content" of "comment" have a "field_error"
