Then /^I should see some informations:$/ do |informations_table|
  row = informations_table.rows_hash
  Then %Q{I should see the image "#{row['image']}"}
  And %Q{I should see "(#{row['nickname']})"}
  And %Q{I should see "#{row['name']}"}
  And %Q{I should see "#{row['content']}"}
end
