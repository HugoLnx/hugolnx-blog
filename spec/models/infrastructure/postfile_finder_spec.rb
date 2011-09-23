require 'spec_helper'

module Infrastructure
  describe PostfileFinder do
    describe '.find_all_in(directory)' do
      it "return an array with all post paths in TEST_POSTS_DIRECTORY/*" do
        paths = PostfileFinder.find_all_in TEST_POSTS_DIRECTORY
        paths.sort!
        paths.should be == TEST_POSTS_IN_TYPE_1 + TEST_POSTS_IN_TYPE_2
      end
    end
  end
end
