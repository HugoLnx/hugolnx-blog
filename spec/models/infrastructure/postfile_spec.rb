require 'spec_helper'

module Infrastructure
  describe Postfile, :stub_posts_directory_constant => true do
    describe '#<=>(obj)' do
      it 'is compared by id' do
        postfile1 = Postfile.new('spec/fixtures/posts/type1/001-Testing Post 1.html')
        postfile2 = Postfile.new('spec/fixtures/posts/type1/002-Testing Post 2.html')
        postfile1.should be < postfile2
      end
    end

    describe '#title()' do
      it 'return title based on path' do
        postfile = Postfile.new('spec/fixtures/posts/type1/001-Testing Post 1.html')
        postfile.title.should be == 'Testing Post 1'
      end
    end

    describe '#location()' do
      it 'return location based on path' do
        postfile = Postfile.new('spec/fixtures/posts/type1/001-Testing Post 1.html')
        postfile.location.should be == 'type1'
      end
    end
  end
end
