Feature: Validate regionsandcountries-RP Web API endpoint

  @rp @api @regionsandcountries
  Scenario: Validate regionsandcountries API endpoint response status
    Given 'regionsandcountries' API
    When a GET request is made to the regionsandcountries API
    Then regionsandcountries API response should be OK

  @rp @api @regionsandcountries
  Scenario Outline: Verify regionsandcountries API endpoint for valid region ids
    Given 'regionsandcountries' API
    When a GET request is made to the regionsandcountries API
    Then response should show valid region ids:
      |<regionId1>|<regionId2>|<regionId3>|<regionId4>|<regionId5>|

    Examples:
      |regionId1|regionId2|regionId3|regionId4|regionId5|
      |7326|9035|9045               |9037     |9039     |

  @rp @api @regionsandcountries
  Scenario Outline: Verify regionsandcountries API endpoint for valid region names
    Given 'regionsandcountries' API
    When a GET request is made to the regionsandcountries API
    Then response should show valid region names:
      |<regionName1>|<regionName2>|<regionName3>|<regionName4>|<regionName5>|

    Examples:
      |regionName1|regionName2|regionName3|regionName4|regionName5|
      |Asia|Africa|MENA               |Europe     |Americas     |

  @rp @api @regionsandcountries
  Scenario Outline: Verify regionsandcountries API endpoint for valid sub-region ids
    Given 'regionsandcountries' API
    When a GET request is made to the regionsandcountries API
    Then response should show valid sub-region ids:
      |<sub-regionId1>|<sub-regionId2>|<sub-regionId3>|<sub-regionId4>|<sub-regionId5>|

    Examples:
      |sub-regionId1|sub-regionId2|sub-regionId3|sub-regionId4|sub-regionId5|
      |7328|9046|9048                           |9049         |9050         |

  @rp @api @regionsandcountries
  Scenario Outline: Verify regionsandcountries API endpoint for valid sub-region names
    Given 'regionsandcountries' API
    When a GET request is made to the regionsandcountries API
    Then response should show valid sub-region names:
      |<sub-regionName1>|<sub-regionName2>|<sub-regionName3>|<sub-regionName4>|<sub-regionName5>|

    Examples:
      |sub-regionName1|sub-regionName2|sub-regionName3|sub-regionName4|sub-regionName5|
      |Greater China|Australasia|South Asia                           |South East Asia         |North East Asia         |

  @rp @api @regionsandcountries @ignore
  Scenario Outline: Verify regionsandcountries API endpoint for all sub-regions
    Given 'regionsandcountries' API
    When a GET request is made to the regionsandcountries API
    Then response should show valid sub-region ids:
      |<sub-regionId1>|<sub-regionId2>|<sub-regionId3>|<sub-regionId4>|<sub-regionId5>|<sub-regionId6>|<sub-regionId7>|<sub-regionId8>|<sub-regionId9>|<sub-regionId10>|<sub-regionId11>|

    Examples:
      |sub-regionId1|sub-regionId2|sub-regionId3|sub-regionId4|sub-regionId5|sub-regionId6|sub-regionId7|sub-regionId8|sub-regionId9|sub-regionId10|sub-regionId11|
      |7328|9046|9048                           |9049         |9050         |9051         |9040|9052|0|9041|9042|

  @rp @api @regionsandcountries
  Scenario Outline: Verify regionsandcountries API endpoint for country ids
    Given 'regionsandcountries' API
    When a GET request is made to the regionsandcountries API
    Then response should show valid country ids:
      |<countryId1>|<countryId2>|<countryId3>|

    Examples:
      |countryId1|countryId2|countryId3|
      |5017|917|937                    |

  @rp @api @regionsandcountries
  Scenario Outline: Verify regionsandcountries API endpoint for country names
    Given 'regionsandcountries' API
    When a GET request is made to the regionsandcountries API
    Then response should show valid country names:
      |<countryName1>|<countryName2>|<countryName3>|

    Examples:
      |countryName1|countryName2|countryName3|
      |China|Hong Kong|Taiwan                |