Feature: Validate forecasts API endpoint

  @rp @api @forecasts
  Scenario Outline: Validate forecasts-rates API endpoint response status
    Given 'forecasts' API
    And a valid user having all entitlements:
    |<userId>|
    When a GET request is made to the forecasts-rates API
    Then forecasts API response should be OK

    Examples:
    |userId|
    |8613  |

  @rp @api @forecasts
  Scenario Outline: Validate forecasts-commodities API endpoint response status
    Given 'forecasts' API
    And a valid user having all entitlements:
      |<userId>|
    When a GET request is made to the forecasts-commodities API
    Then forecasts API response should be OK

    Examples:
      |userId|
      |8613  |

  @rp @api @forecasts
  Scenario Outline: Validate forecasts-economics API endpoint response status
    Given 'forecasts' API
    And a valid user having all entitlements:
      |<userId>|
    When a GET request is made to the forecasts-economics API
    Then forecasts API response should be OK

    Examples:
      |userId|
      |8613  |

  @rp @api @forecasts
  Scenario Outline: Validate forecasts-Fx API endpoint response status
    Given 'forecasts' API
    And a valid user having all entitlements:
      |<userId>|
    When a GET request is made to the forecasts-fx API
    Then forecasts API response should be OK

    Examples:
      |userId|
      |8613  |

  @rp @api @forecasts
  Scenario Outline: Validate forecasts-rates API endpoint for instrument names
    Given 'forecasts' API
    And a valid user having all entitlements:
      |<userId>|
    When a GET request is made to the forecasts-rates API
    Then following instrument names should exist in the response:
    |<instrumentName>|

  Examples:
    |userId|instrumentName|
    |8613|US Rates      |
    |8613|India Rates   |

  @rp @api @forecasts
  Scenario Outline: Validate forecasts-rates API endpoint for region names
    Given 'forecasts' API
    And a valid user having all entitlements:
      |<userId>|
    When a GET request is made to the forecasts-rates API
    Then following region names should exist in the response:
      |<regionName1>|<regionName2>|<regionName3>|<regionName4>|<regionName5>|

    Examples:
      |userId|regionName1|regionName2|regionName3|regionName4|regionName5|
      |8613|Majors     |Asia       |Africa     |Latin America|Europe     |


  @rp @api @forecasts @ignore
  Scenario Outline: Validate forecasts API POST response for FX assetClass
    Given 'forecasts' API
    And A valid user having forecast data:
      |<userId>|
    When a POST request is made to the forecasts API for specific asset class:
      |<assetClass>|
    Then response should show valid region ids for the given AssetClass:
      |<regionCode1>|<regionCode2>|

  Examples:
  |userId|assetClass|regionCode1|regionCode2|
  |1139|FX|3072|3073|

  @rp @api @forecasts @ignore
  Scenario Outline: Validate forecasts API POST response for region forecast
    Given 'forecasts' API
    And A valid user having trade data:
      |<userId>|
    When a POST request is made to the forecasts API for specific asset class:
      |<assetClass>|
    Then response should show forecast for the given asset class:
      |<1YrHistory>|<spot>|<3MWeighting>|<3M-12Weighting>|<Q3-16>|<Q4-16>|<Q1-17>|<Q2-17>|

    Examples:
      |userId|assetClass|1YrHistory|spot|3MWeighting|3M-12Weighting|Q3-16|Q4-16|Q1-17|Q2-17|
      |1139|FX|EURO-USD|1.09|underweight|underweight     |1.05 |1.05 |1.05 |1.05 |