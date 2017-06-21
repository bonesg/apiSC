Feature: Validate user API endpoint

  @ignore
  Scenario: Validate user API response status
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then user API response should be OK

  @ignore
  Scenario: Validate user API for valid user details
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show valid user details

  @ignore
  Scenario: Validate user API for user having single entitlement
    Given A valid user having single entitlement
    When a GET request is made to the user API
    Then response should show only asset class specific to the user

  @ignore
  Scenario: Validate user API for user having multiple entitlements
    Given A valid user having multiple entitlements
    When a GET request is made to the user API
    Then response should show all asset classes specific to the user

  @ignore
  Scenario: Validate user API for all Country Ids
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show Country Ids related to all entitlements

  @ignore
  Scenario: Validate user API for Country Ids specific to entitlements
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show Country Ids related to an entitlement

  @ignore
  Scenario: Validate user API for user publication tags
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show publication tags specific to the user

  @ignore
  Scenario: Validate user API for Analyst Ids
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show associated Analyst Ids

  @ignore
  Scenario: Validate user API for Investment Themes
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show associated Investment Themes to the user

  @ignore
  Scenario: Validate user API for all region Ids
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show all region Ids

  @ignore
  Scenario: Validate user API for region Ids specific to asset class
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show all region Ids specific to an asset class

  @ignore
  Scenario: Validate user API for included entitlements
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show included entitlements for the user

  @ignore
  Scenario: Validate user API for excluded entitlements
    Given A valid user having subscriptions
    When a GET request is made to the user API
    Then response should show excluded entitlements for the user

  @ignore
  Scenario: Validate user API for a logged in User having no subscriptions
    Given A valid user with no subscriptions
    When a GET request is made to the user API
    Then response should show 'no subscriptions found'

  @ignore
  Scenario: Validate user API for an unauthorized user
    Given An unauthorized user
    When a GET request is made to the user API
    Then response should say 'unauthorized user'
