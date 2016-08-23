Feature: AmexTravel Hotel

  Scenario Outline: Book a hotel room for one adult
    Given I navigate to the external "hotel search" site
    When I set the radio button to "Search by city or landmark"
    And I set the "Where are you going - Hotel" field with "<city or landmark>" value
    #And I select a date from the datepicker on the "check-in date" section
    #And I select a date from the datepicker on the "check-out date" section
    #And I set the "How many rooms and guests" fields with "<room>" value and "<adults>" value
    #And I click on the "Search Hotels" button on "AmexHotel Booking" page

    Examples:
  | city or landmark | room | adults |
  | Paris, FR        | 1    | 1      |