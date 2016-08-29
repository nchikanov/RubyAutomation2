Feature: AmexTravel Hotel

  #Ask how Pamela would handle setting the date, so then I could verify the date more easily

  Scenario Outline: Book a hotel room for one adult
    Given I navigate to the external "hotel search" site
    When I set the radio button to "Search by city or landmark"
    And I set the "Where are you going Hotel" field with "<city or landmark>" value
    #how she set the dates, set these in examples.
    #And I set the "When are you going Departure" field with "<date_departure>" value
    #And I set the "When are you going Return" field with "<date_return>" value

    #Could also send the date from example using this step
    #Look into how to use custom dates with datepicker
    And I select a date from the datepicker on the "check-in date" section
    And I select a date from the datepicker on the "check-out date" section
    And I set the "How many rooms and guests" fields with "<room>" value and "<adults>" and "<children>" value of ages "1" and "17"
    And I click on the "Search Hotels" button on "AmexHotel Booking" page
    Then I verify that hotels in "<city or landmark>" for "<adults>" and "<children>" and "<room>" is displayed
    And I click on the "Select best value hotel" button on "AmexHotel Booking" page
    Then I verify the "Hotel Rooms & Rates" page is displayed
    And I click on the "Book Hotel" button on "AmexHotel Booking" page
    And I print out total cost of "Hotel Reservation"
    Then I verify "<room>" value, "<adults>" value, and "<children>" value on "Hotel Final Booking" page
    And I set the "Traveler Information Hotel" fields with "<room>" and "<user1>", "<user2>", "<user3>", and "<user4> values
    And I set the "Payment Information Hotel" fields with "<user1>"
    And I click on the "Review and Submit Hotel" button on "AmexHotel Booking" page

    #Only issue right now is with the card_type drop down. Element not clickable b/c the scroll skips right over it. Otherwise it works!

    ##QUESTIONS & NOTES:
    #Scrolling too fast or something...some elements are not clickable b/c the page frame is not centered over them
    #Added a bunch of sleeps. Does that help? Correct way to handle it?
    #Phone number in Traveler Information field is getting jumbled...why?
    # ^ When I change it to send_keys, then it enters it backwards...If I manually reverse it is that okay?


    Examples:
  | city or landmark | room | adults | children | user1 | user2 | user3 | user4 |
  | Paris, FR        | 4    | 1      | 1        | Nina  | Mario | Luigi | Peach |