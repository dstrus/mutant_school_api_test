Feature: Mutants

  Scenario: I can create a mutant
    When I create a mutant with these attributes
    | mutant_name | real_name | power      |
    | Whoevs      | Sally Jo  | levitation |
    And I find the mutant with the same ID as the one I created
    Then the mutant I found should have the following attributes
    | mutant_name | real_name | power      |
    | Whoevs      | Sally Jo  | levitation |


  Scenario: Get all mutants returns mutants
    Given there is at least one mutant
    When I retrieve all mutants
    Then I should have an array of mutants
