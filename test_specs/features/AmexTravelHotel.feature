Feature: AmexTravel Hotel

  #Ask how Pamela would handle setting the date, so then I could verify the date more easily

  Scenario Outline: Book a hotel room for one adult
    Given I navigate to the external "hotel search" site
    When I set the radio button to "Search by city or landmark"
    And I set the "Where are you going Hotel" field with "<city or landmark>" value
    And I select a date from the datepicker on the "check-in date" section
    And I select a date from the datepicker on the "check-out date" section
    And I set the "How many rooms and guests" fields with "<room>" value and "<adults>" and "<children>" value of ages "1" and "17"
    And I click on the "Search Hotels" button on "AmexHotel Booking" page
    Then I verify that hotels in "<city or landmark>" for "<adults>" and "<children>" and "<room>" is displayed
    And I click on the "Select best value hotel" button
    Then I verify the "Hotel Rooms & Rates" page is displayed
    And I click on the "Book Hotel" button on "AmexHotel Booking" page
    #Double check below v
    And I print out total cost of "Hotel Reservation"

    ##TO DO:
    #Verify correct info again
    #Update all verifications to contain date (after asking Pamela)
    #Fill out name etc for Hotel Car and Flight

    Examples:
  | city or landmark | room | adults | children |
  | Paris, FR        | 4    | 1      | 1        |