Feature: Validate researchReasons API endpoint

  @rp @api @researchReasons
  Scenario: Validate researchReasons API endpoint response status
    Given 'researchReasons' API
    When a GET request is made to the researchReasons API
    Then researchReasons API response should be OK

  @rp @api @researchReasons @ignore
  Scenario: Validate researchReasons API endpoint response for research reason codes
    Given 'researchReasons' API
    When a GET request is made to the researchReasons API
    Then response should show list of all research reason codes

  @rp @api @researchReasons @ignore
  Scenario: Validate researchReasons API endpoint response for research reason names
    Given 'researchReasons' API
    When a GET request is made to the researchReasons API
    Then response should show list of all names specific to research reason codes

  @rp @api @researchReasons @ignore
  Scenario: Validate researchReasons API endpoint response for isActive flag
    Given 'researchReasons' API
    When a GET request is made to the researchReasons API
    Then response should show list of all isActive flag specific to research reasons