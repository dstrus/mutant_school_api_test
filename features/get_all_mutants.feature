Feature: Get all mutants.

  Scenario: Get all mutants returns mutants
    Given there is at least one mutant
    When I retrieve all mutants
    Then I should have an array of mutants
