Feature: Validate bonds API endpoint

  @rp @api @bonds @ignore
  Scenario: Validate bonds API endpoint POST response status
    Given 'bonds' API
    When a POST request is made to the bonds API
    Then bonds API response should be OK

  @rp @api @bonds @ignore
  Scenario Outline: Validate bonds API POST response for FX assetClass
    Given 'bonds' API
    When a POST request is made to the bonds API
    Then response should show bonds details:
      |<country>|<broadSector>|<sector>|<type>|<bondName>|<pickAndPan>|

  Examples:
  |country|broadSector|sector|type|bondName|pickAndPan|
  |China|Financial|Bank|Senior    |AMIPEA 2 16|PAN    |
  |China|Financial|Bank|Senior    |AMIPEA 2 16|PICK    |
  |China|Financial|Bank|Senior    |AMIPEA 2 16|    |