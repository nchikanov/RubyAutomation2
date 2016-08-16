Feature: Search a Flight

  Scenario Outline: 1 - Search a Flight for different airports
    Given I login to the "Book a Flight" page with "<user>" user
    When I set the What type of flight do you need radio button with "<type>" option
    And I set the "Where are you going" fields with "<from_location>" value and "<to_location>" value
    And I set the "When are you going" field with "<date>" value
    And I set the "How many travelers" fields with "<adults>" value and "<children>" value
    And I select the "Children Age" field with "child In lap" and "child In seat" value
    And I click on the "Search Flights" button on "Book a Flight" page


    Examples:
      | from_location                            | type         |to_location                                 |date          | adults  |children  | user    |pickup_time  |dropoff_year | dropoff_month |dropoff_day |dropoff_time |
      | Denver Intl. Airport, CO, US (DEN)       | One Way      |John F. Kennedy Intl. Airport, NY, US (JFK) |12/23/2015    |     1   |   2      |  PWD    |  8:00 AM    |2015         |    December   |     8      |  2:00 PM    |


  Scenario Outline: 4 IHG-70 - 4 - Cancellation Confirmation state
    Given I navigate to the "Book a Flight" Page
    When I set the What type of flight do you need radio button with "<type>" option
    And I set the "Where are you going" fields with "<from_location>" value and "<to_location>" value
    And I set the "When are you going" field with "<date>" value
    And I set the "How many travelers" fields with "<adults>" value and "<children>" value
    And I select the "Children Age" field with "child In lap" and "child In seat" value
    And I click on the "Search Flights" button on "Book a Flight" page

#    And I verify the "Cancel Reservation" button is displayed
#    And I click on the "Cancel Reservation" button on "Manage car Reservation" page
#    Then I verify the "Cancel Car Reservation" page is displayed


    Examples:
      | from_location                            | type         |to_location                                 |date          | adults  |children  | user    |pickup_time  |dropoff_year | dropoff_month |dropoff_day |dropoff_time |
      | Denver Intl. Airport, CO, US (DEN)      | One Way      |John F. Kennedy Intl. Airport, NY, US (JFK) |12/23/2015    |     1   |   2      |  PWD    |  8:00 AM    |2015         |    December   |     8      |  2:00 PM    |





