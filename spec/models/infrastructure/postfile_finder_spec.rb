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

    describe '.find(id,directory)' do
      it 'return post path of id 1 in spec/fixtures' do
        path = PostfileFinder.find(1,'spec/fixtures')
        path.should be == 'spec/fixtures/001-Testing Post 1.html'
      end

      it 'return nil when try to find an nonexistent post' do
        PostfileFinder.find(3,'spec/fixtures').should be_nil
      end
    end
  end
end

