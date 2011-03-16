When /^(?:|I )fill in "([^"]*)" of "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, model, value, selector|
  with_scope(selector) do
    fill_in("#{model}[#{field}]", :with => value)
  end
end

Then /^I should see "([^"]*)" with "([^"]*)"$/ do |field, field_class|
  should have_selector "#{field}.#{field_class}"
end
