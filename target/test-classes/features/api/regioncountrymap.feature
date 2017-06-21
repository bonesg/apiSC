Feature: Validate regioncountrymap API endpoint

  @rp @api @regioncountrymap @ignore
  Scenario: Validate regioncountrymap API endpoint response status
    Given 'regioncountrymap' API
    When a GET request is made to the regioncountrymap API
    Then regioncountrymap API response should be OK

  @rp @api @regioncountrymap @ignore
  Scenario: Validate regioncountrymap API endpoint response for region ids
    Given 'regioncountrymap' API
    When a GET request is made to the regioncountrymap API
    Then response should show list of all region ids

  @rp @api @regioncountrymap @ignore
  Scenario: Validate regioncountrymap API endpoint response for country ids
    Given 'regioncountrymap' API
    When a GET request is made to the regioncountrymap API
    Then response should show list of all country ids specific to regions