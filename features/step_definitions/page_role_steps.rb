When /^I am editing a page$/ do
  When 'I have a page titled Home'
  When 'I go to the list of pages'
  When 'I follow "Edit this page"'
end

Given /^I click on the roles tab$/ do
  with_scope("#page_parts") do
    click_link("Roles")
  end
end

Then /^the "([^"]*)" role should be (unchecked|checked) for the (Read|Write) column$/ do |role_title, status, activity_name|
  raise NotImplementedError unless activity_name == "Read"
  role = Role.find_by_title(role_title)
  should = (status == 'unchecked' ? 'should not' : 'should')
  Then "the \"page_role_readable_#{role.id}\" checkbox within \"#role_#{role.id}\" #{should} be checked"
end

When /^I uncheck the "([^"]*)" role to (Read|Write)$/ do |role_title, activity_name|
  raise NotImplementedError unless activity_name == "Read"
  role = Role.find_by_title(role_title)
  When "I uncheck \"page_role_readable_#{role.id}\""
end

When /^I save the page$/ do
  When "I press \"Save\""
end
