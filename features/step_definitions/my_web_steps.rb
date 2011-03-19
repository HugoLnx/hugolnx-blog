module MyWebHelpers
  def image_selector_for(image)
    "img[src='#{image}']"
  end
end
World(MyWebHelpers)

When /^(?:|I )fill in "([^"]*)" of "([^"]*)" with "([^"]*)"(?: within "([^"]*)")?$/ do |field, model, value, selector|
  with_scope(selector) do
    fill_in("#{model}[#{field}]", :with => value)
  end
end

Then /^I should see that the field to "([^"]*)" of "([^"]*)" have a "([^"]*)"$/ do |field, model, field_class|
  should have_selector "[name='#{model}[#{field}]'].#{field_class}"
end

Then /^I should not see that the field to "([^"]*)" of "([^"]*)" have a "([^"]*)"$/ do |field, model, field_class|
  should_not have_selector "[name='#{model}[#{field}]'].#{field_class}"
end

Then /^I should see the image "([^"]*)"(?: within "([^"]*)")?$/ do |image, selector|
  with_scope(selector) do
    should have_selector image_selector_for(image)
  end
end

Given /^I do nothing$/ do
end
