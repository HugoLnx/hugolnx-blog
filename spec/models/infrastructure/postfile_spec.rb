require 'spec_helper'

module Infrastructure
  describe Postfile do
    it 'should be compared by id' do
      postfile1 = Postfile.new('spec/fixtures/001-Testing Post 1.html')
      postfile2 = Postfile.new('spec/fixtures/002-Testing Post 2.html')
      postfile1.should be < postfile2
    end

    it 'should know title based on path' do
      postfile = Postfile.new('spec/fixtures/001-Testing Post 1.html')
      postfile.title.should be == 'Testing Post 1'
    end
  end
end
