require 'spec_helper'

module Infrastructure
  describe PostfileFinder do
    describe '.find_all_in(directory)' do
      it 'return an array with all post paths in spec/fixtures' do
        paths = PostfileFinder.find_all_in 'spec/fixtures'
        paths.sort!
        paths.should be == ['spec/fixtures/001-Testing Post 1.html',
                            'spec/fixtures/002-Testing Post 2.html']
      end
    end
  end
end
