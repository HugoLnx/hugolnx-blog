module Infraestrutura
  describe PostFile do
    it 'should find the file post path by id in directory' do
      post_file = PostFile.find 1, :in => 'spec/fixtures/'
      post_file.should be_a PostFile
    end

    it 'should extraxt title from filename' do
      post_file = PostFile.find 1, :in => 'spec/fixtures/'
      post_file.title_from_filename.should == 'Testing Post 1'
    end

    it 'should read contents of post_file' do
      post_file = PostFile.find 1, :in => 'spec/fixtures/'
      post_file.read.should == 'Testing Body 1'
    end
  end
end
