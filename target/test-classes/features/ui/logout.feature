Feature: Logout Research Portal

  @rp @ui @logoutx
  Scenario: Verify logout functionality-continue logout
    Given rp user already logged in to the application
    When user clicks on Logout button
    And user click on confirm logout
    #Verify Secure Logout text appears
    Then user should be able to logout successfully

  @rp @ui @logout
  Scenario: Verify logout functionality-cancel logout
    Given rp user already logged in to the application
    When user clicks on Logout button
    And user clicks on cancel logout
    Then user should remain logged in