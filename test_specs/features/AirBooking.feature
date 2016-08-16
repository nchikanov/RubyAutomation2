Feature: Air Booking

Scenario Outline: AB001 - Round trip 1 Adult 2child lap seat Flex search PWP
  Given I login to the "Advanced Flight Search" page with "<user>" user
  When I set the What type of flight do you need radio button with "<type>" option
  And I set the "Where are you going" fields with "<from_location>" value and "<to_location>" value
  And I set the "When are you going Departure" field with "<date_departure>" value
  And I set the "When are you going Return" field with "<date_return>" value
  And I check the "Show me 3 days" checkbox
  And I set the "How many travelers" fields with "<adults>" value and "<children>" value
#  And I select the "Children Age" field with "child In lap" and "child In seat" value
#  And I click on the "Search Flights" button on "Book a Flight" page
#  Then I verify the "Interstitial" page is displayed
#  Then I verify the "Flex" page is displayed

Examples:
  |user      | type            | from_location                               | to_location                            | date_departure      |    date_return     | adults  |children |
  |PWP       | Round Trip      | Los Angeles Intl. Airport, CA, US (LAX)     | McCarran Intl. Airport, NV, US (LAS)   | 11/15/2016          |   11/18/2016       |  2      |   2     |

