@javascript
@twitter
Feature: Log in twitter
  To manipulate comments
  As a post reader
  I should log in twitter

  Background:
    Given I am on newest post page

  @twitter_success
  Scenario: I sucessfully log in Twitter
    Given my twitter have:
      | name        | Hugo       |
      | nickname    | hugolnx    |
      | image       | avatar.jpg |
    When I follow "Logue no Twitter para comentar" within "div#commentForm"
    Then I should see "Deslogue do Twitter" within "div#commentForm"

  @twitter_fail_invalid_credentials
  Scenario: My Twitter have invalid credentials
    Given my twitter have invalid credentials
    When I follow "Logue no Twitter para comentar" within "div#commentForm"
    Then I should see "Suas credenciais estão incorretas"

  @twitter_fail_timeout
  Scenario: Connection with twitter takes to long
    Given twitter authentications have timeout
    When I follow "Logue no Twitter para comentar" within "div#commentForm"
    Then I should see "Não foi possivel conectar ao twitter"
