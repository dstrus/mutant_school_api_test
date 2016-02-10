Given(/^there is at least one (.*)$/) do |resource_name|
  klass = class_from_resource_name(resource_name)
  resource = factory_from_resource_name(resource_name).build
  instance_variable_set("@existing_#{resource_name}", resource)
  resource.save
end

When(/^I retrieve all (.*)s$/) do |resource_name|
  klass = Object::const_get(resource_name.capitalize)
  instance_variable_set("@#{resource_name}s", klass.all)
end

Then(/^I should have an array of (.*)s$/) do |resource_name|
  klass = Object::const_get(resource_name.capitalize)
  resources = instance_variable_get("@#{resource_name}s")
  expect(resources).to be_an(Array)
  expect(resources.first).to be_a(klass)
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
