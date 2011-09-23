# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/rails/extra/routing'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

TEST_POSTS_DIRECTORY = 'spec/fixtures/posts'
TEST_POSTS_IN_TYPE_1 = Dir.glob(File.join(TEST_POSTS_DIRECTORY,'type1/*.html'))
TEST_POSTS_IN_TYPE_2 = Dir.glob(File.join(TEST_POSTS_DIRECTORY,'type2/*.html'))

def no_warning(&block)
  old_verbose = $VERBOSE
  $VERBOSE = nil
  yield
  $VERBOSE = old_verbose
end

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.around :each, :stub_posts_directory_constant => true do |example|
    posts_directory = Post::POSTS_DIRECTORY
    no_warning do
      Post::POSTS_DIRECTORY = TEST_POSTS_DIRECTORY
    end
    example.run
    no_warning do
      Post::POSTS_DIRECTORY = posts_directory
    end
  end
end
