When /^(?:|I )fill in "([^"]*)" of "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, model, value, selector|
  with_scope(selector) do
    fill_in("#{model}[#{field}]", :with => value)
  end
end

Then /^I should see that the field to "([^"]*)" of "([^"]*)" have a "([^"]*)"$/ do |field, model, field_class|
  should have_selector "[name='#{model}[#{field}]'].#{field_class}", :visible => true
end

Then /^I should not see that the field to "([^"]*)" of "([^"]*)" have a "([^"]*)"$/ do |field, model, field_class|
  should_not have_selector "[name='#{model}[#{field}]'].#{field_class}", :visible => true
end

Then /^I should see a "([^"]*)"(?: within "([^"]*)")?$/ do |specific_selector,scope_selector|
  with_scope(scope_selector) do
    should have_selector specific_selector, :visible => true
  end
end

Then /^I should not see a "([^"]*)"(?: within "([^"]*)")?$/ do |specific_selector,scope_selector|
  with_scope(scope_selector) do
    should have_no_selector specific_selector, :visible => true
  end
end

Then /^I should see the image "([^"]*)"(?: within "([^"]*)")?$/ do |image, selector|
  with_scope(selector) do
    should have_selector image_selector_for(image), :visible => true
  end
end

Given /^I do nothing$/ do
end

Given /^I fill in "([^"]*)" of "([^"]*)" with a text with "([^"]*)" characters within "([^"]*)"$/ do |field, model, qnt, selector|
  with_scope (selector) do
    fill_in("#{model}[#{field}]", :with => text_with(qnt).characters)
  end
end

Then /^(?:|I )should see translate for "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    page.should have_content(I18n.translate(text))
  end
end

Then /^(?:|I )should not see translate for "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    page.should have_no_content(I18n.translate(text))
  end
end
