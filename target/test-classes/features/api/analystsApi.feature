Feature: Validate analysts API endpoint

  @rp @api @analysts
  Scenario Outline: Validate analysts-assetClass API endpoint GET response status
    Given 'analysts' API
    And a valid assetClass:
      |<assetClass>|
    When a GET request is made to the analysts-assetClass API
    Then analysts API response should be OK

    Examples:
      |assetClass|
      |Rates     |
      |Credit    |
      |Fx        |
      |Economics |
      |Commodities|


  @rp @api @analysts
  Scenario: Validate analysts-countryId API endpoint GET response status
    Given 'analysts' API
    When a GET request is made to the analysts-countryId API
    Then analysts API response should be OK

  @rp @api @analysts
  Scenario Outline: Validate analysts-analystId API endpoint GET response status
    Given 'analysts' API
    And a valid analyst:
      |<analystId>|
    When a GET request is made to the analysts API
    Then analysts API response should be OK
    Examples:
      |analystId|
      |640     |
      |505     |


  @rp @api @analysts @ignore
  Scenario Outline: Validate analysts API endpoint response for analyst ids
    Given 'analysts' API
    And a valid assetClass:
      |<assetClass>|
    When a GET request is made to the analysts-assetClass API
    Then response should show list of all analyst ids

  Examples:
  |assetClass|
  |Economics |

  @rp @api @analysts
  Scenario Outline: Validate analysts API endpoint for analyst details
    Given 'analysts' API
    And a valid analyst:
      |<analystId>|
    When a GET request is made to the analysts API
    Then analysts API response should return valid analyst details:
    |<firstName>|<lastName>|<displayName>|<jobTitle>|<bio>|<telephone>|<title>|<glLevel>|<isTeamHead>|<id>|<email>|

    Examples:
      |analystId|firstName|lastName|displayName|jobTitle|bio|telephone|title|glLevel|isTeamHead|id|email|
      |506      |Razia    |Khan    |Razia Khan |Chief Economist, Africa|a well-known commentator on African markets|+44 20 7885 6914||GL2|true|506|Razia.er-techtest@sc.com|
      #|760      |Titiporn    |Phatpanichot    |Titiporn Phatpanichot|Credit Strategist|Titiporn is a credit strategist based in Singapore|+65 6596 4104||GL3|false|760|Titiporn.er-techtest@sc.com|

  @rp @api @analysts
  Scenario Outline: Validate analysts-assetClass API endpoint for analyst count
    Given 'analysts' API
    And a valid assetClass:
      |<assetClass>|
    When a GET request is made to the analysts-assetClass API
    Then verify analyst count is accurate as per asset class:
    |<analystCount>|

  Examples:
  |assetClass|analystCount|
  |FX|21|
  |Rates|24|
  |Economics|33|
  |Credit   |8|
  |Commodities|6|