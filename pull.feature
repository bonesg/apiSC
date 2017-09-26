Feature: Pull Mechanism scenarios
@ab @peekAndConsume @regression @pull @pull1
Scenario Outline: TC_PULL_001 - When both webhook is down, verify messages for Peek of Group A and Group B
    #When Add Group Services of CADM is called for the group '<GroupID>' to disable the group
    #Then APIBanking should be disabled in CADM for the group '<GroupID>'
  Given 'activationKey and activate' API
  And user has valid SSL certificate
  And user has already generated the JWT token for the group '<GroupIDA>'
  When a POST request is made to axway endpoint for the group '<GroupIDA>'
  Then user should be registered successfully
  And APIBanking should be enabled in CADM for the group '<GroupIDA>'
  Given user has already generated the JWT token for the group '<GroupIDB>'
  When a POST request is made to axway endpoint for the group '<GroupIDB>'
  Then user should be registered successfully
  And APIBanking should be enabled in CADM for the group '<GroupIDB>'
      #When user modifies Stub with amount '<Amount>' account number '<AccountNo>' transaction type '<CreditDebit>' Currency Code 'INR' BIC 'SCBLINBBXXX'
  Then Peek response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDA>'
  Then Peek response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDB>'
Examples:
| Amount | AccountNo | CreditDebit | GroupIDA | GroupIDB|
| 5555   | 17082017  | D        | INDGROUP | INDGRP|

  @ab @peekAndConsume @regression @pull @pull2
  Scenario Outline: TC_PULL_002 - When both webhook is down, verify messages for Peek of Group A and Consume of Group B
      #When Add Group Services of CADM is called for the group '<GroupID>' to disable the group
      #Then APIBanking should be disabled in CADM for the group '<GroupID>'
    Given 'activationKey and activate' API
    And user has valid SSL certificate
    And user has already generated the JWT token for the group '<GroupIDA>'
    When a POST request is made to axway endpoint for the group '<GroupIDA>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDA>'
    Given user has already generated the JWT token for the group '<GroupIDB>'
    When a POST request is made to axway endpoint for the group '<GroupIDB>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDB>'
        #When user modifies Stub with amount '<Amount>' account number '<AccountNo>' transaction type '<CreditDebit>' Currency Code 'INR' BIC 'SCBLINBBXXX'
    Then Peek response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDA>'
    Then Consume response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDB>'
  Examples:
    | Amount | AccountNo | CreditDebit | GroupIDA | GroupIDB|
    | 5555   | 17082017  | D        | INDGROUP | INDGRP|


  @ab @peekAndConsume @regression @pull @pull3
  Scenario Outline: TC_PULL_003 - When both webhook is down, verify messages for Peek of Group A and Recover of Group B
      #When Add Group Services of CADM is called for the group '<GroupID>' to disable the group
      #Then APIBanking should be disabled in CADM for the group '<GroupID>'
    Given 'activationKey and activate' API
    And user has valid SSL certificate
    And user has already generated the JWT token for the group '<GroupIDA>'
    When a POST request is made to axway endpoint for the group '<GroupIDA>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDA>'
    Given user has already generated the JWT token for the group '<GroupIDB>'
    When a POST request is made to axway endpoint for the group '<GroupIDB>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDB>'
        #When user modifies Stub with amount '<Amount>' account number '<AccountNo>' transaction type '<CreditDebit>' Currency Code 'INR' BIC 'SCBLINBBXXX'
    Then Peek response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDA>'
    Then Recover response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDB>'
  Examples:
    | Amount | AccountNo | CreditDebit | GroupIDA | GroupIDB|
    | 5555   | 17082017  | D        | INDGROUP | INDGRP|

  @ab @peekAndConsume @regression @pull @pull4
  Scenario Outline: TC_PULL_004 - When both webhook is down, verify messages for Peek of Group A and Group B
      #When Add Group Services of CADM is called for the group '<GroupID>' to disable the group
      #Then APIBanking should be disabled in CADM for the group '<GroupID>'
    Given 'activationKey and activate' API
    And user has valid SSL certificate
    And user has already generated the JWT token for the group '<GroupIDA>'
    When a POST request is made to axway endpoint for the group '<GroupIDA>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDA>'
    Given user has already generated the JWT token for the group '<GroupIDB>'
    When a POST request is made to axway endpoint for the group '<GroupIDB>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDB>'
        #When user modifies Stub with amount '<Amount>' account number '<AccountNo>' transaction type '<CreditDebit>' Currency Code 'INR' BIC 'SCBLINBBXXX'
    Then Consume response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDA>'
    Then Peek response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDB>'
  Examples:
    | Amount | AccountNo | CreditDebit | GroupIDA | GroupIDB|
    | 5555   | 17082017  | D        | INDGROUP | INDGRP|

  @ab @peekAndConsume @regression @pull @pull5
  Scenario Outline: TC_PULL_005 - When both webhook is down, verify messages for Peek of Group A and Consume of Group B
      #When Add Group Services of CADM is called for the group '<GroupID>' to disable the group
      #Then APIBanking should be disabled in CADM for the group '<GroupID>'
    Given 'activationKey and activate' API
    And user has valid SSL certificate
    And user has already generated the JWT token for the group '<GroupIDA>'
    When a POST request is made to axway endpoint for the group '<GroupIDA>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDA>'
    Given user has already generated the JWT token for the group '<GroupIDB>'
    When a POST request is made to axway endpoint for the group '<GroupIDB>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDB>'
        #When user modifies Stub with amount '<Amount>' account number '<AccountNo>' transaction type '<CreditDebit>' Currency Code 'INR' BIC 'SCBLINBBXXX'
    Then Consume response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDA>'
    Then Consume response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDB>'
  Examples:
    | Amount | AccountNo | CreditDebit | GroupIDA | GroupIDB|
    | 5555   | 17082017  | D        | INDGROUP | INDGRP|


  @ab @peekAndConsume @regression @pull @pull6
  Scenario Outline: TC_PULL_006 - When both webhook is down, verify messages for Peek of Group A and Recover of Group B
      #When Add Group Services of CADM is called for the group '<GroupID>' to disable the group
      #Then APIBanking should be disabled in CADM for the group '<GroupID>'
    Given 'activationKey and activate' API
    And user has valid SSL certificate
    And user has already generated the JWT token for the group '<GroupIDA>'
    When a POST request is made to axway endpoint for the group '<GroupIDA>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDA>'
    Given user has already generated the JWT token for the group '<GroupIDB>'
    When a POST request is made to axway endpoint for the group '<GroupIDB>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDB>'
        #When user modifies Stub with amount '<Amount>' account number '<AccountNo>' transaction type '<CreditDebit>' Currency Code 'INR' BIC 'SCBLINBBXXX'
    Then Consume response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDA>'
    Then Recover response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDB>'
  Examples:
    | Amount | AccountNo | CreditDebit | GroupIDA | GroupIDB|
    | 5555   | 17082017  | D        | INDGROUP | INDGRP|


  @ab @peekAndConsume @regression @pull @pull7
  Scenario Outline: TC_PULL_007 - When both webhook is down, verify messages for Peek of Group A and Group B
      #When Add Group Services of CADM is called for the group '<GroupID>' to disable the group
      #Then APIBanking should be disabled in CADM for the group '<GroupID>'
    Given 'activationKey and activate' API
    And user has valid SSL certificate
    And user has already generated the JWT token for the group '<GroupIDA>'
    When a POST request is made to axway endpoint for the group '<GroupIDA>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDA>'
    Given user has already generated the JWT token for the group '<GroupIDB>'
    When a POST request is made to axway endpoint for the group '<GroupIDB>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDB>'
        #When user modifies Stub with amount '<Amount>' account number '<AccountNo>' transaction type '<CreditDebit>' Currency Code 'INR' BIC 'SCBLINBBXXX'
    Then Recover response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDA>'
    Then Peek response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDB>'
  Examples:
    | Amount | AccountNo | CreditDebit | GroupIDA | GroupIDB|
    | 5555   | 17082017  | D        | INDGROUP | INDGRP|

  @ab @peekAndConsume @regression @pull @pull8
  Scenario Outline: TC_PULL_008 - When both webhook is down, verify messages for Peek of Group A and Consume of Group B
      #When Add Group Services of CADM is called for the group '<GroupID>' to disable the group
      #Then APIBanking should be disabled in CADM for the group '<GroupID>'
    Given 'activationKey and activate' API
    And user has valid SSL certificate
    And user has already generated the JWT token for the group '<GroupIDA>'
    When a POST request is made to axway endpoint for the group '<GroupIDA>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDA>'
    Given user has already generated the JWT token for the group '<GroupIDB>'
    When a POST request is made to axway endpoint for the group '<GroupIDB>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDB>'
        #When user modifies Stub with amount '<Amount>' account number '<AccountNo>' transaction type '<CreditDebit>' Currency Code 'INR' BIC 'SCBLINBBXXX'
    Then Recover response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDA>'
    Then Consume response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDB>'
  Examples:
    | Amount | AccountNo | CreditDebit | GroupIDA | GroupIDB|
    | 5555   | 17082017  | D        | INDGROUP | INDGRP|


  @ab @peekAndConsume @regression @pull @pull9
  Scenario Outline: TC_PULL_009 - When both webhook is down, verify messages for Peek of Group A and Recover of Group B
      #When Add Group Services of CADM is called for the group '<GroupID>' to disable the group
      #Then APIBanking should be disabled in CADM for the group '<GroupID>'
    Given 'activationKey and activate' API
    And user has valid SSL certificate
    And user has already generated the JWT token for the group '<GroupIDA>'
    When a POST request is made to axway endpoint for the group '<GroupIDA>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDA>'
    Given user has already generated the JWT token for the group '<GroupIDB>'
    When a POST request is made to axway endpoint for the group '<GroupIDB>'
    Then user should be registered successfully
    And APIBanking should be enabled in CADM for the group '<GroupIDB>'
        #When user modifies Stub with amount '<Amount>' account number '<AccountNo>' transaction type '<CreditDebit>' Currency Code 'INR' BIC 'SCBLINBBXXX'
    Then Recover response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDA>'
    Then Recover response should be displayed with amount '<Amount>' accountNo '<AccountNo>' transactionType '<CreditDebit>' the expected value for the group '<GroupIDB>'
  Examples:
    | Amount | AccountNo | CreditDebit | GroupIDA | GroupIDB|
    | 5555   | 17082017  | D        | INDGROUP | INDGRP|