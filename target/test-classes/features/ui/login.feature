Feature: Login to Research Portal

  @rp @ui @login
  Scenario: Verify rp login with valid user id and password
    Given rp user having valid user credentials
    And user is on research portal home page
    When user enters valid user id and password
    And user clicks on Login button
    Then user should be able to login successfully

  @rp @ui @login
  Scenario: Verify rp login with invalid user id or password
    Given rp user having invalid user credentials
    And user is on research portal home page
    When user enters invalid user id or password
    And user clicks on Login button
    Then login error message should be displayed