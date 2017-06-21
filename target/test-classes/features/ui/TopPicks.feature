Feature: Home Page Configuration-Toppicks

  @ignore
  Scenario: Validate the Toppicks layout is displaying in UI as mentioned in config file
    Given the rp user is logged in
    And in Home Page
    Then the user should be able to view default layout with 3 columns left,middle and right
    And the user should be able to view the publication type as mentioned in config file
    And the images for the publications if available

  # Default layout template is 1,2 and 5
  @ignore
  Scenario: Validate when the user clicks on any of the publication title navigates to report view page of the correct report
    Given the rp user is logged in
    And in Home Page
    When the user clicks on any publication title
    Then the user should be displayed with the Report view page of the actual report

  @ignore
  Scenario: Validate when the product owner changes the page layout
    Given the rp user is logged in
    And in Home Page
    When the page layout is changed by product owner
    Then the user should be able to view the changed page layout for the Toppicks area with publication types as mentioned in config file

  # Change page layout to 2,3,4
  @ignore
  Scenario: Validate the user is displayed with synopsis text when the image is not available
    Given the rp user is logged in
    And in Home Page
    When the images are not available for any of the publications in Toppicks area
    Then the user should be displayed with synopsis text and the synopsis text is limited to 398 characters

  @ignore
  Scenario: Validate the user is displayed with ellipsis at the end of the text when the synopsis text is more than 398 characters
    Given the rp user is logged in
    And in Home Page
    When the images are not available for any of the publications in Toppicks area
    And the synopsis text is more than 398 characters
    Then the the user should be displayed with synopsis text and ellipsis (…) at the end of the text

  @ignore
  Scenario: Validate the user is not displayed with duplicate reports in Toppicks area
    Given the rp user is logged in
    And in Home Page
    When the the config file is changed such that same publication type is selected in 2 places
    Then the user should not be displayed with duplicate reports in Toppicks

  @ignore
  Scenario: Validate the user is displayed with Trade Idea when the publication type is ACT
    Given the rp user is logged in
    And in Home Page
    When the Publication Type is equal to ACT
    Then the user should be displayed with the orange text 'Trade Idea' next to the ACT in Home page
