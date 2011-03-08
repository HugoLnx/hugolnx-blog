require 'spec_helper'

module Infrastructure
  describe Postfile do
    it 'should find all post titles in spec/fixtures' do
      paths = PostfileFinder.find_all_in 'spec/fixtures'
      paths.should be == ['spec/fixtures/001-Testing Post 1.html',
                          'spec/fixtures/002-Testing Post 2.html']
    end

    it 'should find postfile of id 1 in spec/fixtures' do
      path = PostfileFinder.find(1,'spec/fixtures')
      path.should be == 'spec/fixtures/001-Testing Post 1.html'
    end
  end
end

