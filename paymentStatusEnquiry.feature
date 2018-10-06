Feature: Individual API scenarios - Payment Status Enquiry API

  @paymentInitiationGenie
  Scenario Outline: Verify successful Payment initiation - Positive scenario
    When user hits the 'OpenAPIPaymentInitiation' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIPaymentMessageID|openAPIPaymentReferenceID' and group '<GroupID>'
      | openAPIPaymentAmount | openAPIPaymentCurrency | openAPIPaymentDebitAccountNumber | openAPIPaymentCreditAccountNumber | openAPIPaymentDebitBIC | openAPIPaymentCreditBIC | openAPIPaymentdebitName | openAPIPaymentcreditName | openAPIPaymentcreditCountry | openAPIPaymentdebitCountry | openAPIPaymentType | openAPIPaymentCountry | openAPIPaymentdebitPostalAddressCountry | openAPIClearingSystemId   | openAPIPaymentTypePreference   | openAPICreditorAgentName   |
      | <Amount>             | <Currency>             | <DebitAccountNumber>             | <CreditAccountNumber>             | <DebitBIC>             | <CreditBIC>             | <DebitName>             | <CreditName>             | <CreditCountry>             | <DebitCountry>             | <paymentType>      | <CreditCountry>       | <CreditCountry>                         | <openAPIClearingSystemId> | <openAPIPaymentTypePreference> | <openAPICreditorAgentName> |
    Then the 'OpenAPIPaymentInitiation' response should be displayed with same random 'openAPIPaymentResponseClientReferenceId'
    Then the 'OpenAPIPaymentInitiation' response should be displayed with status code as '200'
    Examples:
      | GroupID | Amount | Currency | DebitAccountNumber | CreditAccountNumber | DebitBIC    | CreditBIC   | DebitName   | CreditName | CreditCountry | DebitCountry | paymentType | openAPIClearingSystemId | openAPIPaymentTypePreference | RssponseStatusCode | lastAssignee | reasonCode | additionalInformation | reasonInformation     | openAPICreditorAgentName |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | /          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | -          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | ?          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | :          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | (          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | )          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | .          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | ,          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | ''         | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | +          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | abcd  efgh | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | ui deploy                |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | /           -            |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | ?                        |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | :                        |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | (                        |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | )                        |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | .                        |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | ,                        |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | ''                       |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | +                        |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname |            | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed | abcdfgh               |

  @regression
  Scenario Outline: Verify successful Payment initiation - Positive scenario
    Given a POST request is made to the activationKey API for group '<GroupID>'
    And user has already generated the JWT token for the group '<GroupID>'
    When a POST request is made to axway endpoint for the group '<GroupID>'
    When user hits the 'OpenAPIPaymentInitiation' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIPaymentMessageID|openAPIPaymentReferenceID' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'OpenAPIPaymentInitiation' response should be displayed with same random 'openAPIPaymentResponseClientReferenceId'
    Then the 'OpenAPIPaymentInitiation' response should be displayed with status code as '200'
    When user hits the 'OpenAPIPaymentStatusEnquiry' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIClientReferenceIds' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with same random 'openAPIPaymentStatusEndToEndId|openAPIPaymentStatusClientIdentifier'
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with status code as '200'
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <RssponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |
    Examples:
      | GroupID | Amount | Currency | DebitAccountNumber | CreditAccountNumber | DebitBIC    | CreditBIC   | DebitName   | CreditName | CreditCountry | DebitCountry | paymentType | openAPIClearingSystemId | openAPIPaymentTypePreference | RssponseStatusCode | lastAssignee | reasonCode | additionalInformation | reasonInformation     | openAPICreditorAgentName |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | /          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |

  @paymentSuccessfulGenieLoad @regression
  Scenario Outline: Verify successful Payment initiation - Positive scenario with volume
    Given a POST request is made to the activationKey API for group '<GroupID>'
    And user has already generated the JWT token for the group '<GroupID>'
    When a POST request is made to axway endpoint for the group '<GroupID>'
    When user hits 'OpenAPIPaymentInitiation' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIPaymentMessageID|openAPIPaymentReferenceID' and group '<GroupID>' for '100000' times with value
      | NothingtoPass |
      |               |
    Then All submitted payments are successful within '30000' milliseconds for Group '<GroupID>'
    Examples:
    |GroupID|
    | INDGRP1      |


  @regression  @paymentSuccessfulGenie
  Scenario Outline: Verify successful PayNow - Positive scenario
    Given a POST request is made to the activationKey API for group '<GroupID>'
    And user has already generated the JWT token for the group '<GroupID>'
    When a POST request is made to axway endpoint for the group '<GroupID>'
    Then user should be registered successfully
    When user hits the 'OpenAPIPayNow' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIPaymentMessageID|openAPIPaymentReferenceID' and group '<GroupID>'
      | openAPIPaymentAmount | openAPIPaymentMessageSender   | openAPIPaymentCurrency | openAPIPaymentDebitAccountNumber | openAPIPaymentDebitBIC | openAPIPaymentdebitName | openAPIPaymentdebitCountry | openAPIPaymentdebitPostalAddressCountry | openAPIPaymentTypePreference   | openAPIPaymentTimestamp   | openAPIRequiredExecutionDate   | openAPIPurpose   | openAPIDebitorName   | openAPIDebitorAgentBIC   | openAPIPaymentCountry   | openAPICreditorId   | openAPICreditoridentityType   |
      | <Amount>             | <openAPIPaymentMessageSender> | <Currency>             | <DebitAccountNumber>             | <DebitBIC>             | <DebitName>             | <DebitCountry>             | SG                                      | <openAPIPaymentTypePreference> | <openAPIPaymentTimestamp> | <openAPIRequiredExecutionDate> | <openAPIPurpose> | <openAPIDebitorName> | <openAPIDebitorAgentBIC> | <openAPIPaymentCountry> | <openAPICreditorId> | <openAPICreditoridentityType> |
    Then the 'OpenAPIPayNow' response should be displayed with same random 'openAPIPaymentResponseClientReferenceId'
    Then the 'OpenAPIPayNow' response should be displayed with status code as '200'
    When user hits the 'OpenAPIPaymentStatusEnquiry' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIClientReferenceIds' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with same random 'openAPIPaymentStatusEndToEndId'
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with status code as '200'
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <ResponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |
    Examples:
      | GroupID  | Amount | openAPIPaymentMessageSender | Currency | DebitAccountNumber | DebitBIC    | DebitName   | DebitCountry | openAPIPaymentCountry | openAPIPaymentTypePreference | openAPIPaymentTimestamp | openAPIRequiredExecutionDate | openAPIPurpose | openAPIDebitorName | openAPIDebitorAgentBIC | openAPICreditorId | openAPICreditoridentityType | ResponseStatusCode | lastAssignee | reasonCode | additionalInformation | reasonInformation     |
      | APINTST2 | 2      | NTUC                        | SGD      | 0100042406         | SCBLSGS0XXX | NTUC Income | SG           | SG                    | Fastest                      | 1531995117              | 2018-07-19                   | CASH           | NTUC Income        | SCBLSGS0XXX            | +6583834952       | RetMSISDN                   | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |
      | APINTST2 |1     | NTUC                        | SGD      | 0100042406         | SCBLSGS0XXX | NTUC Income      | SG        | SG                    | Fastest                      | 1531995117              | 2018-07-19                   | CASH           | NTUC Income        | SCBLSGS0XXX            | S8801405G         |RetNRIC                    |91|     STS                                  |64|Ok, Request completed |    Ok, Request completed|
      | APINTST2 |1     | NTUC                        | SGD      | 0100042406         | SCBLSGS0XXX | NTUC Income      | SG        | SG                    | Fastest                      | 1531995117              | 2018-07-19                   | CASH           | NTUC Income        | SCBLSGS0XXX            | +6597860798         |RetMSISDN                 |459|     STS                                  |44|SJ-Rejected by beneficiary bank for unspecified reason (1100) |    SJ-Rejected by beneficiary bank for unspecified reason (1100)  |

  @paymentReconcilliation
  Scenario Outline: Verify new SG PayNow payments posted are displayed in the reconcilliation response
    When user hits the 'Consume' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    When user hits the 'OpenAPIPayNow' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIPaymentMessageID|openAPIPaymentReferenceID' and group '<GroupID>'
      | openAPIPaymentAmount | openAPIPaymentMessageSender   | openAPIPaymentCurrency | openAPIPaymentDebitAccountNumber | openAPIPaymentDebitBIC | openAPIPaymentdebitName | openAPIPaymentdebitCountry | openAPIPaymentdebitPostalAddressCountry | openAPIPaymentTypePreference   | openAPIPaymentTimestamp   | openAPIRequiredExecutionDate   | openAPIPurpose   | openAPIDebitorName   | openAPIDebitorAgentBIC   | openAPIPaymentCountry   | openAPICreditorId   | openAPICreditoridentityType   |
      | <Amount>             | <openAPIPaymentMessageSender> | <Currency>             | <DebitAccountNumber>             | <DebitBIC>             | <DebitName>             | <DebitCountry>             | SG                                      | <openAPIPaymentTypePreference> | <openAPIPaymentTimestamp> | <openAPIRequiredExecutionDate> | <openAPIPurpose> | <openAPIDebitorName> | <openAPIDebitorAgentBIC> | <openAPIPaymentCountry> | <openAPICreditorId> | <openAPICreditoridentityType> |
    Then the 'OpenAPIPayNow' response should be displayed with same random 'openAPIPaymentResponseClientReferenceId'
    Then the 'OpenAPIPayNow' response should be displayed with status code as '200'
    When user hits the 'OpenAPIPaymentStatusEnquiry' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIClientReferenceIds' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with same random 'openAPIPaymentStatusEndToEndId'
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with status code as '200'
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <ResponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |
    When user hits the 'Peek' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'Peek' response should be displayed with same random 'openAPIPaymentStatusEndToEndId'
    And the 'Peek' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <ResponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |
    And The 'Peek' response should displayed with '2' number of transactions for the group '<GroupID>'
    And The 'Peek' response should not be displayed with Credit/Debit Advice
    And The 'Peek' response should not be displayed with Custody Message
    When user hits the 'Consume' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'Consume' response should be displayed with same random 'openAPIPaymentStatusEndToEndId'
    And the 'Consume' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <ResponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |

    And The 'Consume' response should not be displayed with Credit/Debit Advice
    And The 'Consume' response should not be displayed with Custody Message
    And The 'Consume' response should displayed with '2' number of transactions for the group '<GroupID>'
    When user hits the 'Recover' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'Recover' response should be displayed with same random 'openAPIPaymentStatusEndToEndId'
    And the 'Recover' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <ResponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |

    And The 'Recover' response should not be displayed with Credit/Debit Advice
    And The 'Recover' response should not be displayed with Custody Message
    And The 'Recover' response should displayed with '2' number of transactions for the group '<GroupID>'
    Examples:
      | GroupID  | Amount | openAPIPaymentMessageSender | Currency | DebitAccountNumber | DebitBIC    | DebitName   | DebitCountry | openAPIPaymentCountry | openAPIPaymentTypePreference | openAPIPaymentTimestamp | openAPIRequiredExecutionDate | openAPIPurpose | openAPIDebitorName | openAPIDebitorAgentBIC | openAPICreditorId | openAPICreditoridentityType | ResponseStatusCode | lastAssignee | reasonCode | additionalInformation | reasonInformation     |
      | APINTST2 | 1      | NTUC                        | SGD      | 0100042406         | SCBLSGS0XXX | NTUC Income | SG           | SG                    | Fastest                      | 1531995117              | 2018-07-19                   | CASH           | NTUC Income        | SCBLSGS0XXX            | +6583834952       | RetMSISDN                   | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |


  Scenario Outline: Verify IMPS transactions posted are displayed in the Reconcilliation response

    When user hits the 'Consume' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    When user hits the 'OpenAPIPaymentInitiation' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIPaymentMessageID|openAPIPaymentReferenceID' and group '<GroupID>'
      | openAPIPaymentAmount | openAPIPaymentCurrency | openAPIPaymentDebitAccountNumber | openAPIPaymentCreditAccountNumber | openAPIPaymentDebitBIC | openAPIPaymentCreditBIC | openAPIPaymentdebitName | openAPIPaymentcreditName | openAPIPaymentcreditCountry | openAPIPaymentdebitCountry | openAPIPaymentType | openAPIPaymentCountry | openAPIPaymentdebitPostalAddressCountry | openAPIClearingSystemId   | openAPIPaymentTypePreference   | openAPICreditorAgentName   |
      | <Amount>             | <Currency>             | <DebitAccountNumber>             | <CreditAccountNumber>             | <DebitBIC>             | <CreditBIC>             | <DebitName>             | <CreditName>             | <CreditCountry>             | <DebitCountry>             | <paymentType>      | <CreditCountry>       | <CreditCountry>                         | <openAPIClearingSystemId> | <openAPIPaymentTypePreference> | <openAPICreditorAgentName> |
    Then the 'OpenAPIPayNow' response should be displayed with same random 'openAPIPaymentResponseClientReferenceId'
    Then the 'OpenAPIPayNow' response should be displayed with status code as '200'
    When user hits the 'OpenAPIPaymentStatusEnquiry' API with requestType 'POST' with params '' with headers 'ResponseEncryptionType-non' with random number for 'openAPIClientReferenceIds' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with same random 'openAPIPaymentStatusEndToEndId'
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with status code as '200'
    Then the 'OpenAPIPaymentStatusEnquiry' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <ResponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |
    When user hits the 'Peek' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'Peek' response should be displayed with same random 'openAPIPaymentStatusEndToEndId'
    And the 'Peek' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <ResponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |
    And The 'Peek' response should displayed with '2' number of transactions for the group '<GroupID>'
    And The 'Peek' response should not be displayed with Credit/Debit Advice
    And The 'Peek' response should not be displayed with Custody Message
    When user hits the 'Consume' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    When user hits the 'Statistics' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    And the 'Statistics' response should be displayed with the details
    |messageCount|
    |      2      |

    Then the 'Consume' response should be displayed with same random 'openAPIPaymentStatusEndToEndId'
    And the 'Consume' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <ResponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |
    And The 'Consume' response should not be displayed with Credit/Debit Advice
    And The 'Consume' response should not be displayed with Custody Message
    And The 'Consume' response should displayed with '2' number of transactions for the group '<GroupID>'
    When user hits the 'Statistics' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    And the 'Statistics' response should be displayed with the details
      |messageCount|
      |      0      |
    When user hits the 'Recover' API with requestType 'GET' with params 'eventType=PaymentTransactionStatus' with headers 'ResponseEncryptionType-non' with random number for '' and group '<GroupID>'
      | NothingtoPass |
      |               |
    Then the 'Recover' response should be displayed with same random 'openAPIPaymentStatusEndToEndId'
    And the 'Recover' response should be displayed with the details
      | openAPIPaymentStatusStatusCode | openAPIPaymentStatusLastAssignee | openAPIPaymentStatusReasonCode | openAPIPaymentStatusAdditionalInformation | openAPIPaymentStatusReasonInformation |
      | <ResponseStatusCode>           | <lastAssignee>                   | <reasonCode>                   | <additionalInformation>                   | <reasonInformation>                   |

    And The 'Recover' response should not be displayed with Credit/Debit Advice
    And The 'Recover' response should not be displayed with Custody Message
    And The 'Recover' response should displayed with '2' number of transactions for the group '<GroupID>'
    Examples:
      | GroupID | Amount | Currency | DebitAccountNumber | CreditAccountNumber | DebitBIC    | CreditBIC   | DebitName   | CreditName | CreditCountry | DebitCountry | paymentType | openAPIClearingSystemId | openAPIPaymentTypePreference | ResponseStatusCode | lastAssignee | reasonCode | additionalInformation | reasonInformation     | openAPICreditorAgentName |
      | INDGRP1 | 2      | INR      | 45505367867        | S658238741025       | SCBLINBBXXX | SPSL0000001 | 3520 -sname | /          | IN            | IN           | IBFT        |                         | Fastest                      | 91                 | STS          | 64         | Ok, Request completed | Ok, Request completed |                          |
