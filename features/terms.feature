Feature: Terms

  Scenario: Get all terms
    When I retrieve all terms
    Then I should have an array of terms
