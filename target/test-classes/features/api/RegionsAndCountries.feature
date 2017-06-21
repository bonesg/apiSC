Feature: Validate RegionsAndCountries-Content Cache API endpoint

  @rp @api @RegionsAndCountries
  Scenario: Validate RegionsAndCountries API endpoint response status
    Given 'RegionsAndCountries' API
    When a GET request is made to the RegionsAndCountries API
    Then RegionsAndCountries API response should be OK

  @rp @api @RegionsAndCountries
  Scenario: Validate RegionsAndCountries API endpoint response for country ids
    Given 'RegionsAndCountries' API
    When a GET request is made to the RegionsAndCountries API
    Then response should show list of all country ids

  @rp @api @RegionsAndCountries
  Scenario: Validate regionsandcountries API endpoint response for country names
    Given 'RegionsAndCountries' API
    When a GET request is made to the RegionsAndCountries API
    Then response should show list of all country names

  @rp @api @RegionsAndCountries
  Scenario: Validate RegionsAndCountries API endpoint for parentId specific to countries
    Given 'RegionsAndCountries' API
    When a GET request is made to the RegionsAndCountries API
    Then response should show list of parentId specific to countries

  @rp @api @RegionsAndCountries
  Scenario: Validate RegionsAndCountries API endpoint for isRegion flag specific to countries
    Given 'RegionsAndCountries' API
    When a GET request is made to the RegionsAndCountries API
    Then response should show isRegion flag values specific to countries

  @rp @api @RegionsAndCountries
  Scenario: Validate RegionsAndCountries API endpoint for generalfootnote specific to countries
    Given 'RegionsAndCountries' API
    When a GET request is made to the RegionsAndCountries API
    Then response should show generalFootNote values specific to countries