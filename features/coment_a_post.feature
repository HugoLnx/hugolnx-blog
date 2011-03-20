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

  @comment_block_double_comment
  Scenario: I post one time and can't post again
    Given I fill in "content" of "comment" with "Testing comment" within "form#comment"
    When I press "Comentar" within "form#comment"
    Then I should see "Não comente duas vezes seguidas, edite o comentário anterior"

  @comment_show_comment_of_11_lines_bit_a_bit
  Scenario: I post a comment longer than 10 lines
    Given I fill in "content" of "comment" with a text with "11" lines within "form#comment"
    When I press "Comentar" within "form#comment"
    Then I should see "ver mais" within "div#comment1"

  @comment_show_comment_of_21_lines_bit_a_bit
  Scenario: I post a comment longer than 20 lines
    Given I fill in "content" of "comment" with a text with "21" lines within "form#comment"
    When I press "Comentar" within "form#comment"
    And I follow "ver mais" within "div#comment1"
    Then I should see "ver mais" within "div#comment1"
