Given(/^there is at least one mutant$/) do
  @existing_mutant = Mutant.new mutant_name: 'B', power: 'C'
  @existing_mutant.save
end

When(/^I retrieve all mutants$/) do
  @mutants = Mutant.all
end

Then(/^I should have an array of mutants$/) do
  expect(@mutants).to be_an(Array)
  expect(@mutants.first).to be_a(Mutant)
end

When 'I create a mutant with these attributes' do |table|
  @created_mutant = Mutant.new(table.hashes.first)
  @created_mutant.save
end

When 'I find the mutant with the same ID as the one I created' do
  @found_mutant = Mutant.find(@created_mutant.id)
end

Then 'the mutant I found should have the following attributes' do |table|
  table.hashes.first.each do |name, val|
    expect(@found_mutant.send(name)).to eq(val)
  end
end
