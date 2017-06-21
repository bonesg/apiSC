Feature: Validate Languages,Recommendations,Frequencies,Price and TimeZone APIs

  @rp @api @languages @staticData
  Scenario: Validate languages API endpoint response status
    Given 'languages' API
    When a GET request is made to the languages API
    Then API response should be OK

  @rp @api @recommendations @staticData
  Scenario: Validate recommendations API endpoint response status
    Given 'recommendations' API
    When a GET request is made to the recommendations API
    Then API response should be OK

  @rp @api @frequencies @staticData
  Scenario: Validate frequencies API endpoint response status
    Given 'frequencies' API
    When a GET request is made to the frequencies API
    Then API response should be OK

  @rp @api @price @staticData
  Scenario Outline: Validate price API endpoint response status
    Given 'price' API
    And a valid user entitled to price data:
      |<userId>|
    When a GET request is made to the price API
    Then API response should be OK

    Examples:
      |userId|
      |8613  |

  @rp @api @price @staticData
  Scenario Outline: Validate Fx-price API endpoint response status
    Given 'Fx-price' API
    And a valid user entitled to price data:
      |<userId>|
    When a GET request is made to the Fx-price API
    Then API response should be OK

  Examples:
  |userId|
  |8613  |

  @rp @api @price @staticData @ignore
  Scenario Outline: Validate Commodity-price API endpoint response status
    Given 'Commodity-price' API
    And a valid user entitled to price data:
      |<userId>|
    When a GET request is made to the Commodity-price API
    Then API response should be OK

  Examples:
  |userId|
  |8613  |

  @rp @api @timeZone @staticData
  Scenario: Validate Commodity-price API endpoint response status
    Given 'TimeZone' API
    When a GET request is made to the TimeZone API
    Then API response should be OK