Feature: Generate Activation Key and JWT

  @ab @activationKey
  Scenario: Validate activation key is generated successfully
    Given 'activationKey' API
    When a POST request is made to the activationKey API
    Then activationKey API response should be OK
    And content and key data should be generated

  @ab @jwt
  Scenario: Validate activation key is generated successfully
    Given 'activationKey' API
    When a POST request is made to the activationKey API
    And generated content and key is passed to the create token method
    Then token should be generated successfully

  @ab @registerMe
  Scenario: Validate user is able to register himself successfully
    Given 'activationKey and activate' API
    And user has valid SSL certificate
    And user has already generated the JWT token
    When a POST request is made to the activate API
    Then user should be registered successfully

