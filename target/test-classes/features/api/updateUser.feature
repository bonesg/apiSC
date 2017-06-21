Feature: Validate user update API endpoint

  @rp @api @updateUser
  Scenario Outline: Validate asset class details are updated
    Given A valid user having subscriptions:
      |<userId>|
    When a POST request is made to the user API
    Then user API response should be OK

    Examples:
      |userId|
      |7479  |

  @rp @api @updateUser @ignore
  Scenario Outline: Validate asset class details are updated
    Given A valid user having subscriptions:
      |<userId>|
    When a PUT request is made to the user API to update user subscriptions-assetClass
    Then user API response should be OK
    And verify that assetClass details are updated

    Examples:
      |userId|
      |1683  |

  @rp @api @updateUser @ignore
  Scenario Outline: Validate investment themes are updated
    Given A valid user having subscriptions:
      |<userId>|
    When a PUT request is made to the user API to update user subscriptions-invThemes
    Then user API response should be OK
    And verify that investment themes details are updated

    Examples:
      |userId|
      |1683  |

  @rp @api @updateUser @ignore
  Scenario Outline: Validate publication tags are updated
    Given A valid user having subscriptions:
      |<userId>|
    When a PUT request is made to the user API to update user subscriptions-publicationTags
    Then user API response should be OK
    And verify that publication tag details are updated

    Examples:
      |userId|
      |1683  |

  @rp @api @updateUser @ignore
  Scenario Outline: Validate language details are updated
    Given A valid user having subscriptions:
      |<userId>|
    When a PUT request is made to the user API to update user subscriptions-languages
    Then user API response should be OK
    And verify that language details are updated

    Examples:
      |userId|
      |1683  |

  @rp @api @updateUser @ignore
  Scenario Outline: Validate user details are reverted to original
    Given A valid user having subscriptions:
      |<userId>|
    When a PUT request is made to the user API to revert changes
    Then user API response should be OK
    And verify that user details are updated correctly

    Examples:
      |userId|
      |1683  |