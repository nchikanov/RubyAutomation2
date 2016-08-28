Feature: AmexTravel Flight Booking

  Scenario Outline: Book a nonstop, round trip flight for 1 adult, 2 children
    Given I navigate to the external "flights" site
    When I set the radio button to "<type of flight>"
    And I set the "Where are you going" fields with "<starting point>" value and "<ending point>" value
    And I select a date from the datepicker on the "dep" section
    And I select a date from the datepicker on the "ret" section
    And I set the "When are you going" fields with "<time>" value and "<time2>" value
    And I click on the "Show me +/- 3 days" button
    And I click on the "number of travelers" button with "<seniors>", "<adults>", and "<children>"
    And I set the "Children Age" fields with "child in lap" value and "child in seat" value
    And I click on the "nonstop flight" button
    And I select "<class type>" option from the "fare class" dropdown menu
    And I click on the "Search" button on "AmexFlight Booking" page
    #And I verify the "Interstitial" page is displayed
    Then I verify the "Flex" page is displayed
    And I click on the lowest price option in flex matrix
    Then I verify that flight info from "<airport>" to "<airport2>" with "<seniors>", "<adults>", and "<children>" in "<class type>" is displayed on "Flex" page
    And I click on "<codeAirline>" on the flight Matrix
    And I click on the "Select on the first Airline flight card" button on "Flex" page
    Then I verify the "Review Your Trip" page is displayed
    And I print out total cost of "Roundtrip Flight"
    Then I verify that flight info from "<airport>" to "<airport2>" with "<seniors>", "<adults>", and "<children>" in "<class type>" is displayed on "Review Your Trip" page
    #And I click on the "Add cheapest hotel" button on "AmexFlight Booking" page  -- COME BACK TO THIS, TRICKY W/ ARRAYS, TRY TO CONTINUE W/O FOR NOW

    
    ##TO DO:
    #Fill out name, info, etc. Don't submit
    #Finish the other two scenarios w/ verifications and everything

    Examples:
    | type of flight | starting point | airport | ending point | airport2 | time     | time2    | seniors | adults | children | class type       | codeAirline     |
    | Round Trip     | SFO            | SFO     | MSP          | MSP      | Anytime  | Anytime  | 0       | 1      | 2        | Economy          | United Airlines |

  Scenario Outline: Book a nonstop, one way flight for 1 adult, 2 children
    Given I navigate to the external "flights" site
    When I set the radio button to "<type of flight>"
    And I set the "Where are you going" fields with "<starting point>" value and "<ending point>" value
    And I select a date from the datepicker on the "dep" section
    And I set the "When are you going" field with "<time>" value
    And I click on the "number of travelers" button with "<seniors>", "<adults>", and "<children>"
    And I set the "Children Age" fields with "child in lap" value and "child in seat" value
    And I click on the "nonstop flight" button
    And I select "<class type>" option from the "fare class" dropdown menu
    And I click on the "search flights" button
    Then I verify that flight info from "<airport>" to "<airport2>" with "<seniors>", "<adults>", and "<children>" in "<class type>" is displayed

    Examples:
     | type of flight | starting point | airport | ending point | airport2 | time     | seniors | adults | children | class type       |
     | One Way        | SFO            | SFO     | LAX          | LAX      | 4pm-8pm  | 0       | 1      | 2        | Economy          |

    Scenario Outline: Book a nonstop, 3-city flight itinerary for 1 adult and 1 senior
      Given I navigate to the external "flights" site
      When I set the radio button to "<type of flight>"
      And I set the "Where and when are you going" fields with "<place 1>", "<place 2>", "<place 3>", "<time>", "<time2>" and "<time3> values
      And I click on the "number of travelers" button with "<seniors>", "<adults>", and "<children>"
      #And I set the "Children Age" fields with "child in lap" value and "child in seat" value
      And I click on the "nonstop flight" button
      And I select "<class type>" option from the "fare class" dropdown menu
      And I click on the "search flights" button
      Then I verify that flight info from "<place 1>" to "<place 2>" to "<place 3>" with "<seniors>", "<adults>", and "<children>" in "<class type>" is displayed

    Examples:
     | type of flight | place 1 | place 2 | place 3 | time    | time2   | time3   | seniors | adults | children | class type |
     | Multi-City     | SFO     | STL     | LAX     | Anytime | Anytime | Anytime | 1       | 1      | 0        | Economy    |

      #Complete these test cases with steps I'm missing
      #Execute with a cucumber comment in the terminal and create an HTML report