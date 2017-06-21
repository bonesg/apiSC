Feature: Validate getServiceContext API endpoint

  @rp @api @getServiceContext @ignore
  Scenario: Validate getServiceContext API endpoint response status
    Given 'getServiceContext' API
    When a POST request is made to the getServiceContext API
    Then getServiceContext API response should be OK

  @rp @api @getServiceContext @ignore
  Scenario: Validate getServiceContext API endpoint for serviceContext details
    Given 'getServiceContext' API
    When a POST request is made to the getServiceContext API
    Then response should show valid serviceContext details