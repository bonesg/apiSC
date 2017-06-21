Feature: Validate researchObject API endpoint

  @api @researchObject @ignore
  Scenario Outline: Validate researchObject API endpoint POST response status
    Given 'researchObject' API
    When a POST request is made to the researchObject API for specific asset class:
      |<objId>|<assetClass>|
    Then researchObject API response should be OK

  Examples:
  |objId|assetClass|
  |11000|FX|

  @api @researchObject @ignore
  Scenario Outline: Validate researchObject API POST response for FX assetClass
    Given 'researchObject' API
    When a POST request is made to the researchObject API for specific asset class:
      |<objId>|<assetClass>|
    Then response should show valid region ids for the given AssetClass:
      |<regionCode1>|<regionCode2>|

  Examples:
  |objId|assetClass|regionCode1|regionCode2|
  |11000|FX|3072|3073|