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
    Given I fill in "content" of "comment" with "Testing comment" within "form#indexCommentForm"
    When I press "Comentar" within "form#indexCommentForm"
    Then I should see within "div#comments div#comment1" some informations:
      | name        | Hugo            |
      | nickname    | hugolnx         |
      | image       | avatar.jpg      |
      | content     | Testing comment |

  @comment_fail_empty_content
  Scenario: I don't fill content field
    Given I do nothing
    When I press "Comentar" within "form#indexCommentForm"
    Then I should see that the field to "content" of "comment" have a "field_error"

  @comment_block_double_comment
  Scenario: I post one time and reload page
    When I fill in "content" of "comment" with "Testing comment" within "form#indexCommentForm"
    And I press "Comentar" within "form#indexCommentForm"
    And I go to newest post page
    Then I should see translate for "dont_do_double_comment"
    And I should not see a "form#indexCommentForm" within "div#commentForm"

  @comment_block_double_comment_after_comment
  Scenario: I post one time and can't post again
    When I fill in "content" of "comment" with "Testing comment" within "form#indexCommentForm"
    And I press "Comentar" within "form#indexCommentForm"
    Then I should see translate for "dont_do_double_comment"
    And I should not see a "form#indexCommentForm" within "div#commentForm"

  @comment_show_comment_of_801_characters_bit_a_bit
  Scenario: I post a comment longer than 800 characters
    Given I fill in "content" of "comment" with a text with "801" characters within "form#indexCommentForm"
    When I press "Comentar" within "form#indexCommentForm"
    Then I should see "ler mais" within "div#comment1"

  @comment_show_comment_of_1601_characters_bit_a_bit
  Scenario: I post a comment longer than 1600 characters
    Given I fill in "content" of "comment" with a text with "1601" characters within "form#indexCommentForm"
    When I press "Comentar" within "form#indexCommentForm"
    And I press "ler mais" within "div#comment1"
    Then I should see "ler mais" within "div#comment1"
