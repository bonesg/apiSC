Feature: Validate user API endpoint

  @rp @api @user
  Scenario Outline: Validate user API response status
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then user API response should be OK

    Examples:
      |userId|
      #|1139  |
      |1124  |
      |8377  |

  @rp @api @user @ignore
  Scenario Outline: Verify user details
    Given A valid user having subscriptions:
    |<userId>|
    When a GET request is made to the user API
    Then response should show valid user details:
      |<userId>|<isActive>|<name>|<firstName>|<lastName>|<email>|<languageCode>|<companyName>|

    Examples:
      |userId|isActive|name|firstName|lastName|email|languageCode|companyName|
      #|1139|true|Abdeslam Bennani|Abdeslam|Bennani|Abdeslam.Bennani@sc.com|EN|SCB Hong Kong Ltd.|
      |8377|true|Client Ex MYNDR Test|Client Ex MYNDR|Test|Client-Ex-MYNDR@sc.test.com|EN|Test Rite Group|

  @rp @api @user
  Scenario Outline: Verify user subscriptions - asset Classes
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show all asset classes specific to the user:
      |<assetClass1>|<assetClass2>|<assetClass3>|<assetClass4>|<assetClass5>|

    Examples:
      |userId|assetClass1|assetClass2|assetClass3|assetClass4|assetClass5|
      |8377|COMMODITIES|CREDIT|ECONOMICS|FX|RATES|

  @rp @api @user @ignore
  Scenario Outline: Verify user subscriptions - publication tags
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show all publication tags specific to the user:
      |<publicationTag1>|<publicationTag2>|<publicationTag3>|<publicationTag4>|<publicationTag5>|

    Examples:
      |userId|publicationTag1|publicationTag2|publicationTag3|publicationTag4|publicationTag5|
      |1683|ACT|AFR_CRED_CPDM|ASIA_CRED_CPDM|COMM_ALT|COMM_METALS_STD|

  @rp @api @user @ignore
  Scenario Outline: Verify user subscriptions - languages
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show all languages specific to the user:
      |<language1>|<language2>|

    Examples:
      |userId|language1|language2|
      |1683|ENG|TRAD_CHN|

  @rp @api @user @ignore
  Scenario Outline: Verify user subscriptions - analyst ids
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show all analyst ids specific to the user:
      |<analystId1>|<analystId2>|

    Examples:
      |userId|analystId1|analystId2|
      |1683|545|724|

  @rp @api @user @ignore
  Scenario Outline: Verify user subscriptions - investment themes
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show all investment themes specific to the user:
      |<investmentTheme1>|<investmentTheme2>|

    Examples:
      |userId|investmentTheme1|investmentTheme2|
      |1683|GDP_GROWTH|FUND_ANALYSIS|

  @rp @api @user @ignore
  Scenario Outline: Verify user subscriptions - regions
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show all regions specific to the user:
      |<regionId1>|<regionId2>|

    Examples:
      |userId|regionId1|regionId2|
      |1683|7328|9037|

  @rp @api @user @ignore
  Scenario Outline: Verify user subscriptions - countries
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show all countries specific to the user:
      |<countryId1>|<countryId2>|<countryId3>|<countryId4>|<countryId5>|<countryId6>|

    Examples:
      |userId|countryId1|countryId2|countryId3|countryId4|countryId5|countryId6|
      |1683|901|903|904                       |905       |906       |915|

  @rp @api @user
  Scenario Outline: Verify included entitlements
    Given A valid Research Portal user:
      |<userId>|
    When a GET request is made to the user API
    Then response should show included entitlements for the user:
      |<includedEntitlement1>|<includedEntitlement2>|<includedEntitlement3>|<includedEntitlement4>|<includedEntitlement5>|

    Examples:
      |userId|includedEntitlement1|includedEntitlement2|includedEntitlement3|includedEntitlement4|includedEntitlement5|
      |8377|CREDIT|ECONOMICS  |  |     |         |
      |8613|CREDIT|COMMODITIES|FX|RATES |ECONOMICS|

  @rp @api @user
  Scenario Outline: Verify excluded entitlements
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show excluded entitlements for the user:
      |<excludedEntitlement1>|<excludedEntitlement2>|<excludedEntitlement3>|<excludedEntitlement4>|

    Examples:
      |userId|excludedEntitlement1|excludedEntitlement2|excludedEntitlement3|excludedEntitlement4|
      |8616|MYNDR||||

  @rp @api @user
  Scenario Outline: Verify alertSettings-sendNotificationsToCodes
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show the codes to send notifications:
      |<code1>|<code2>|<code3>|

    Examples:
      |userId|code1|code2|code3|
      #|1139|EML|MBL|WBS|
      |8377|EML|MBL|WBS|

  @rp @api @user
  Scenario Outline: Verify alertSettings-frequencyCode and TimeZone
    Given A valid user having subscriptions:
      |<userId>|
    When a GET request is made to the user API
    Then response should show the frequency code and timezone:
      |<frequencyCode>|<timeZone>|

    Examples:
      |userId|frequencyCode|timeZone|
      #|1139|IMM|China Standard Time|
      |8377|IMM|Singapore Standard Time|

  @rp @api @user
  Scenario Outline: Validate user API response for invalid user
    Given an invalid rp user:
      |<userId>|
    When a GET request is made to the user API
    Then user API response should state that-User not found

    Examples:
      |userId|
      |99999 |

  @rp @api @user
  Scenario Outline: Validate user API response for valid user having no entitlements
    Given an invalid rp user:
      |<userId>|
    When a GET request is made to the user API
    Then user API response should state that-entitlements not found

    Examples:
      |userId|
      |9999  |