Given(/^there is at least one mutant$/) do
  @mutant = Mutant.new mutant_name: 'B', power: 'C'
  @mutant.save
end

When(/^I retrieve all mutants$/) do
  @mutants = Mutant.all
end

Then(/^I should have an array of mutants$/) do
  expect(@mutants).to be_an(Array)
  expect(@mutants.first).to be_a(Mutant)
end

When 'I create a mutant with these attributes' do |table|
  @mutant = Mutant.new(table.hashes.first)
  @mutant.save
end

When 'I find the mutant with the same ID' do
  @mutant = Mutant.find(@mutant.id)
end

Then 'the mutant should have the following attributes' do |table|
  table.hashes.first.each do |name, val|
    expect(@mutant.send(name)).to eq(val)
  end
end
