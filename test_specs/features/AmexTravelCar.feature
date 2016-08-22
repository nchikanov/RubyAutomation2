Feature: AmexTravel Car Booking

  Scenario Outline:
    Given I navigate to the external "cars" site
    When I set the radio buttons to "<type of rental>" and "<type of search>"
    And I set the "Where will you pick up the car" field with "<city or airport>" value
    And I select a date from the datepicker on the "pick-up" section
    And I select a date from the datepicker on the "drop-off" section
    And I set the "Car Rental Time" fields with "<time1>" value and "<time2>" value
    And I select "<car rental company>" option from the "car rental company" dropdown menu
    And I set the "Do you have any specific preferences" fields with "<air conditioning>" value and "<transmission>" value
    And I click on the "Search Cars" button on "AmexCars Booking" page
    #Add verifications


    Examples:
    | type of rental                    | type of search             | city or airport       | time1      | time2      | car rental company | air conditioning | transmission |
    | Drop-off location same as pick-up | Search by city or airport  | San Francisco, CA, US | 10:00 a.m. | 12:00 p.m. | No Preference      | Yes              | Automatic    |
