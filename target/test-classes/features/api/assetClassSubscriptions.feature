Feature: Validate asset class subscriptions API endpoint

  @rp @api @assetClassSubscriptions
  Scenario Outline: Validate asset class subscriptions API endpoint response status
    Given 'assetClassSubscriptions' API
    And a valid user having asset class subscriptions:
      |<userId>|
    When a GET request is made to the asset class subscriptions API
    Then asset class subscriptions API response should be OK

    Examples:
      |userId|
      |8613  |

  @rp @api @assetClassSubscriptions
  Scenario Outline: Validate asset class subscriptions API endpoint for Economics-regions
    Given 'assetClassSubscriptions' API
    And a valid user having asset class subscriptions:
      |<userId>|
    When a GET request is made to the asset class subscriptions API
    Then response should show valid region names for Economics:
      |<regionName1>|<regionName2>|<regionName3>|<regionName4>|<regionName5>|

  Examples:
  |userId|regionName1|regionName2|regionName3|regionName4|regionName5|
  |8613  |Africa|Americas|Asia               |Europe     |MENA     |

  @rp @api @assetClassSubscriptions
  Scenario Outline: Validate asset class subscriptions API endpoint for Fx-regions
    Given 'assetClassSubscriptions' API
    And a valid user having asset class subscriptions:
      |<userId>|
    When a GET request is made to the asset class subscriptions API
    Then response should show valid region names for Fx:
      |<regionName1>|<regionName2>|<regionName3>|<regionName4>|<regionName5>|

    Examples:
      |userId|regionName1|regionName2|regionName3|regionName4|regionName5|
      |8613  |Africa|Americas|Asia               |Europe     |MENA     |

  @rp @api @assetClassSubscriptions
  Scenario Outline: Validate asset class subscriptions API endpoint for Rates-regions
    Given 'assetClassSubscriptions' API
    And a valid user having asset class subscriptions:
      |<userId>|
    When a GET request is made to the asset class subscriptions API
    Then response should show valid region names for Rates:
      |<regionName1>|<regionName2>|<regionName3>|<regionName4>|

    Examples:
      |userId|regionName1|regionName2|regionName3|regionName4|
      |8613  |Africa|Americas|Asia               |Europe     |

  @rp @api @assetClassSubscriptions
  Scenario Outline: Validate asset class subscriptions API endpoint Credit-categories
    Given 'assetClassSubscriptions' API
    And a valid user having asset class subscriptions:
      |<userId>|
    When a GET request is made to the asset class subscriptions API
    Then response should show valid categories for Credit:
      |<category1>|<category2>|<category3>|<category4>|

    Examples:
      |userId|category1|category2|category3|category4|
      |8613  |Financials|High-grade corporates|High-yield corporates               |Sovereigns     |

  @rp @api @assetClassSubscriptions @ignore
  Scenario Outline: Validate asset class subscriptions API endpoint Commodity-categories
    Given 'assetClassSubscriptions' API
    And a valid user having asset class subscriptions:
      |<userId>|
    When a GET request is made to the asset class subscriptions API
    Then response should show valid categories for Commodities:
      |<category1>|<category2>|

    Examples:
      |userId|category1|category2|
      |8613  |Energy|Metals|