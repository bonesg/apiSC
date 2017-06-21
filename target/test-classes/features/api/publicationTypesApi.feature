Feature: Validate publicationTypes API endpoint

  @rp @api @publicationTypes
  Scenario: Validate publicationTypes API endpoint response status
    Given 'publicationTypes' API
    When a GET request is made to the publicationTypes API
    Then publicationTypes API response should be OK

  @rp @api @publicationTypes
  Scenario: Validate publicationTypes API endpoint response for publication type codes
    Given 'publicationTypes' API
    When a GET request is made to the publicationTypes API
    Then response should show list of all publication type codes

  @rp @api @publicationTypes
  Scenario: Validate publicationTypes API endpoint response for publication type names
    Given 'publicationTypes' API
    When a GET request is made to the publicationTypes API
    Then response should show all names specific to publication type codes

  @rp @api @publicationTypes @ignore
  Scenario: Validate publicationTypes API endpoint response for isActive flag
    Given 'publicationTypes' API
    When a GET request is made to the publicationTypes API
    Then response should show list of all isActive flag specific to publication type