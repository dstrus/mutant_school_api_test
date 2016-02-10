Given(/^there is at least one (.*)$/) do |resource_name|
  klass = Object::const_get(resource_name.capitalize)
  instance_variable_set("@existing_#{resource_name}", klass.new(mutant_name: 'B', power: 'C'))
  instance_variable_get("@existing_#{resource_name}").save
end

When(/^I retrieve all mutants$/) do
  @mutants = Mutant.all
end

Then(/^I should have an array of mutants$/) do
  expect(@mutants).to be_an(Array)
  expect(@mutants.first).to be_a(Mutant)
end

When /I create (?:a|the) mutant with these attributes/ do |table|
  @created_mutant = Mutant.new(table.hashes.first)
  @created_mutant.save
end

When /I update (?:a|the) mutant I (found|created) with these attributes/ do |verb, table|
  mutant = instance_variable_get("@#{verb}_mutant")
  mutant.update_attributes(table.hashes.first)
  mutant.save
end

When /I find the mutant with the same ID as the one I (found|created)/ do |verb|
  mutant = instance_variable_get("@#{verb}_mutant")
  @found_mutant = Mutant.find(mutant.id)
end

Then /the mutant I (found|created) should have the following attributes/ do |verb, table|
  mutant = instance_variable_get("@#{verb}_mutant")
  table.hashes.first.each do |name, val|
    expect(mutant.send(name)).to eq(val)
  end
end

Then /the mutant I (found|created) should match the one I (found|created)/ do |verb, verb2|
  mutant = instance_variable_get("@#{verb}_mutant")
  second_mutant = instance_variable_get("@#{verb2}_mutant")
  expect(mutant.to_h).to eq(second_mutant.to_h)
end
