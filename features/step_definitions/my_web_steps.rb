When /^(?:|I )fill in "([^"]*)" of "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, model, value, selector|
  with_scope(selector) do
    fill_in("#{model}[#{field}]", :with => value)
  end
end

Then /^I should see that the field to "([^"]*)" of "([^"]*)" have a "([^"]*)"$/ do |field, model, field_class|
  should have_selector "[name='#{model}[#{field}]'].#{field_class}"
end
