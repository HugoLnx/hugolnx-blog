require 'spec_helper'

module Infrastructure
  describe PostfileArray do
    before :all do
      paths = PostfileFinder.find_all_in 'spec/fixtures'
      @array = paths.collect{|path| Postfile.new path}
      @postfile_newer = Postfile.new 'spec/fixtures/002-Testing Post 2.html'
    end

    it 'should find of all titles in spec/fixtures' do
      postfiles = PostfileArray.new @array
      postfiles.titles.should be == ['Testing Post 1', 'Testing Post 2']
    end

    it 'should delegate find id max' do
      postfiles = PostfileArray.new @array
      postfiles.newer.should be == @postfile_newer
    end
  end
end
