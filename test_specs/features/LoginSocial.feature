Feature: Social Media Login

  Scenario Outline: Verify that user logs in and landing page loads
    Given I navigate to the external "<web>" site
    When I login with the given "<user>"
    Then I verify the "<landing>" page is displayed



    Examples:
      | web        | user       | landing    |
      | gmail      | Peach      | Gmail Home |
      | facebook   | Peach      | FB Home    |
