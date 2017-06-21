Feature: Validate user subscriptions

  @rp @ui @subscription
  Scenario: Validate subscriptions screen for user having no subscriptions
    Given a valid rp user having no subscriptions is logged into the application
    When user clicks on My subscriptions menu
    Then a message should be displayed saying user has no subscriptions