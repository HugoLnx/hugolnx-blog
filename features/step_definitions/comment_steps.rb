Then /^I should see within "([^"]*)" some informations:$/ do |selector,informations_table|
  row = informations_table.rows_hash
  with_scope (selector) do
    Then %Q{I should see the image "#{row['image']}"}
    And %Q{I should see "(#{row['nickname']})"}
    And %Q{I should see "#{row['name']}"}
    And %Q{I should see "#{row['content']}"}
  end
end
