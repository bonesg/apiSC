Feature: Validate user subscriptions

  @ignore
  Scenario: Validate subscriptions for user having subscriptions
    Given a valid rp user having subscriptions
    And user is logged in to research-portal
    When user clicks on My subscriptions menu
    Then user should be able to view his latest publications

  @ignore
  Scenario: Validate subscriptions for user having subscriptions
    Given a valid rp user having no subscriptions
    And user is logged in to research-portal
    When user clicks on My subscriptions menu
    Then user should not see any subscriptions assigned to him
    And warning message will appear

  @ignore
  Scenario: Verify List view
    Given a valid rp user having subscriptions
    And user is logged in to research-portal
    And user has chosen list view
    When user clicks on My subscriptions menu
    Then user should see the list view
    And list view should contain the following sections 'publication type' 'title' 'analyst' and 'publication date'
    And list view should contain the following sections 'synopsis' 'thumbnail image' and 'thumbnail icons'
