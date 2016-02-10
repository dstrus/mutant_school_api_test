Given(/^there is at least one mutant$/) do
  @mutant = Mutant.new real_name: 'A', mutant_name: 'B', power: 'C'
  @mutant.save
end

When(/^I retrieve all mutants$/) do
  @mutants = Mutant.all
end

Then(/^I should have an array of mutants$/) do
  expect(@mutants).to be_an(Array)
  expect(@mutants.first).to be_a(Mutant)
end
