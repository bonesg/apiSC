Feature: Validate globalSearch API endpoint

  @rp @api @globalSearch @ignore
  Scenario Outline: Validate globalSearch API endpoint POST response status
    Given 'globalSearch' API
    When a POST request is made to the globalSearch API with search item and result limits:
      |<searchItem>|<reports>|<analysts>|<assetClasses>|
    Then globalSearch API response should be OK

  Examples:
  |searchItem|reports|analysts|assetClasses|
  |china AND credit|3|2       |3           |

  @rp @api @globalSearch @ignore
  Scenario Outline: Validate globalSearch API POST response for results count
    Given 'globalSearch' API
    When a POST request is made to the globalSearch API with search item and result limits:
      |<searchItem>|<reports>|<analysts>|<assetClasses>|
    Then response should show valid resultsCount for reports analysts and asset classes

  Examples:
    |searchItem|reports|analysts|assetClasses|
    |china AND credit|3|2       |3           |

  @rp @api @globalSearch @ignore
  Scenario Outline: Validate globalSearch API POST response for report details
    Given 'globalSearch' API
    When a POST request is made to the globalSearch API with search item and result limits:
      |<searchItem>|<reports>|<analysts>|<assetClasses>|
    Then response should show valid report details:
      |<reportId>|<title>|<highlightedTitle>|<publicationType>|

    Examples:
      |searchItem|reports|analysts|assetClasses|reportId|title|highlightedTitle|publicationType|
      |china AND credit|3|2       |3           |81024   |Economics Weekly|Economics Weekly|ECON_WKLY|
