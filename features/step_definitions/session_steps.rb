Given /^my twitter have:$/ do |informations_table|
  user_info = informations_table.rows_hash

  OmniAuth.config.mock_auth[:twitter] = {
    'uid' => '123',
    'provider' => 'twitter',
    'user_info' => user_info
  }
end

Given /^my twitter have invalid credentials$/ do
  OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
end

Given /^twitter authentications have timeout$/ do
  OmniAuth.config.mock_auth[:twitter] = :timeout
end
