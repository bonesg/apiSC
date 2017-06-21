Feature: Validate team API endpoint

  @rp @api @team
  Scenario: Validate team API endpoint response status
    Given 'team' API
    When a GET request is made to the team API
    Then team API response should be OK

  @rp @api @team
  Scenario Outline: Verify team API endpoint for valid group names
    Given 'team' API
    When a GET request is made to the team API
    Then response should show valid group names:
      |<groupName1>|<groupName2>|<groupName3>|<groupName4>|<groupName5>|<groupName6>|<groupName7>|

    Examples:
      |groupName1|groupName2|groupName3|groupName4|groupName5|groupName6|groupName7|
      |All Analysts|Economics|Macro Strategy and FX               |Rates     |Credit     |Commodities|Thematics, Geopolitics, Flows|


  @rp @api @team
  Scenario Outline: Verify team API endpoint for sub group names
    Given 'team' API
    When a GET request is made to the team API
    Then response should show valid sub-group names:
      |<sub-groupName1>|<sub-groupName2>|<sub-groupName3>|<sub-groupName4>|<sub-groupName5>|<sub-groupName6>|<sub-groupName7>|

    Examples:
      |sub-groupName1|sub-groupName2|sub-groupName3|sub-groupName4|sub-groupName5|sub-groupName6|sub-groupName7|
      |Africa|Asia|Europe                           |MENA         |Thematic         |Geopolitics|Flows         |


  @rp @api @team
  Scenario Outline: Verify team API endpoint for analyst details
    Given 'team' API
    When a GET request is made to the team API
    Then response should show valid analyst details:
      |<firstName>|<lastName>|<displayName>|<jobTitle>|<bio>|<telephone>|<title>|<glLevel>|<isTeamHead>|<id>|<email>|

    Examples:
      |firstName|lastName|displayName|jobTitle|bio|telephone|title|glLevel|isTeamHead|id|email|
      |Marios    |Maratheftis    |Marios Maratheftis |Chief Economist|Marios is the Bank’s Chief Economist|+971 4508 3311||GL1|false|507|Marios.er-techtest@sc.com|
