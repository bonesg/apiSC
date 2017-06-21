Feature: Validate tradeIdeas API endpoint

  @rp @api @tradeIdeas
  Scenario Outline: Validate tradeIdeas-Fx API endpoint response status
    Given 'tradeIdeas' API
    And A valid user having trade data:
      |<userId>|
    When a GET request is made to the tradeIdeas-Fx API
    Then tradeIdeas API response should be OK

  Examples:
  |userId|
  |8613  |

  @rp @api @tradeIdeas
  Scenario Outline: Validate tradeIdeas-Rates API endpoint response status
    Given 'tradeIdeas' API
    And A valid user having trade data:
      |<userId>|
    When a GET request is made to the tradeIdeas-Rates API
    Then tradeIdeas API response should be OK

    Examples:
      |userId|
      |8613  |

  @rp @api @tradeIdeas @ignore
  Scenario Outline: Validate tradeIdeas API endpoint POST response status
    Given 'tradeIdeas' API
    And A valid user having trade data:
      |<userId>|
    When a POST request is made to the tradeIdeas API for specific asset class:
      |<assetClass>|<status>|
    Then tradeIdeas API response should be OK

  Examples:
  |userId|assetClass|status|
  |1139  |Fx|open          |

  @rp @api @tradeIdeas @ignore
  Scenario Outline: Validate tradeIdeas API POST response for FX assetClass
    Given 'tradeIdeas' API
    And A valid user having trade data:
      |<userId>|
    When a POST request is made to the tradeIdeas API for specific asset class:
      |<assetClass>|<status>|
    Then response should show valid report ids:
      |<reportId1>|<reportId2>|<reportId3>|<reportId4>|

  Examples:
  |userId|assetClass|status|reportId1|reportId2|reportId3|reportId4|
  |1139|Fx|open          |3456|7890|0|156|

  @rp @api @tradeIdeas @ignore
  Scenario Outline: Validate tradeIdeas API POST response for trade details
    Given 'tradeIdeas' API
    And A valid user having trade data:
      |<userId>|
    When a POST request is made to the tradeIdeas API for specific asset class:
      |<assetClass>|<status>|
    Then response should show trade details for the given asset class:
      |<action>|<description>|<entryLevel>|<entryDate>|<isOpen>|<reportId>|<target>|<stopLoss>|

    Examples:
      |userId|assetClass|status|action|description|entryLevel|entryDate|isOpen|reportId|target|stopLoss|
      |1139|Fx|open            |SELL|             SGD-INR|49.6|        2017-01-02T16:00:00.000Z|true|3456|59.3|47.5|