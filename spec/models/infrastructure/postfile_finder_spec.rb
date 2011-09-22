require 'spec_helper'

module Infrastructure
  describe PostfileFinder do
    it 'should find all post titles in spec/fixtures' do
      paths = PostfileFinder.find_all_in 'spec/fixtures'
      paths.sort!
      paths.should be == ['spec/fixtures/001-Testing Post 1.html',
                          'spec/fixtures/002-Testing Post 2.html']
    end

    it 'should find postfile of id 1 in spec/fixtures' do
      path = PostfileFinder.find(1,'spec/fixtures')
      path.should be == 'spec/fixtures/001-Testing Post 1.html'
    end

    it 'should return nil when try to find postfile 3 in spec/fixtures' do
      PostfileFinder.find(3,'spec/fixtures').should be_nil
    end
  end
end

