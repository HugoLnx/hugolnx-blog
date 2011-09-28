When /^(?:|I )fill in "([^"]*)" of "([^"]*)" with "([^"]*)"$/ do |field, model, value|
  fill_in("#{model}[#{field}]", :with => value)
end

Then /^I should see that the field to "([^"]*)" of "([^"]*)" have a "([^"]*)"$/ do |field, model, field_class|
  should have_selector "[name='#{model}[#{field}]'].#{field_class}", :visible => true
end

Then /^I should not see that the field to "([^"]*)" of "([^"]*)" have a "([^"]*)"$/ do |field, model, field_class|
  should_not have_selector "[name='#{model}[#{field}]'].#{field_class}", :visible => true
end

Then /^I should see a "([^"]*)"$/ do |specific_selector|
  should have_selector specific_selector, :visible => true
end

Then /^I should not see a "([^"]*)"$/ do |specific_selector|
  should have_no_selector specific_selector, :visible => true
end

Then /^I should see the image "([^"]*)"$/ do |image|
  should have_selector image_selector_for(image)
end

Given /^I do nothing$/ do
end

Given /^I fill in "([^"]*)" of "([^"]*)" with a text with "([^"]*)" characters$/ do |field, model, qnt|
  fill_in("#{model}[#{field}]", :with => text_with(qnt).characters)
end

Then /^(?:|I )should see translate for "([^"]*)"$/ do |text|
  page.should have_content(I18n.translate(text))
end

Then /^(?:|I )should not see translate for "([^"]*)"$/ do |text|
  page.should have_no_content(I18n.translate(text))
end
