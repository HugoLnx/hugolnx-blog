require 'spec_helper'

module Infrastructure
  describe PostDsl do
    it 'should find and build the post of id 1 in spec/fixtures' do
      post = PostDsl.find_and_build(1,:in => 'spec/fixtures')
      post.should be_a Post
    end

    context 'delegates find of informations in postfiles' do
      it 'should delegate find of all titles' do
        postfiles = mock(:postfiles)
        PostfileArray.stub! :new => postfiles

        PostfileFinder.should_receive('find_all_in')
                      .with('spec/fixtures')
                      .and_return([])
        postfiles.should_receive('titles')
        PostDsl.find_all_post_titles_in 'spec/fixtures'
      end

      it 'should delegate find id max' do
        postfiles = mock(:postfiles)
        PostfileArray.stub! :new => postfiles

        PostfileFinder.should_receive('find_all_in')
                      .with('spec/fixtures')
                      .and_return([])
        postfiles.should_receive('newer')
                 .and_return(mock(:postfile, :id=>0))
        PostDsl.find_id_max_in 'spec/fixtures'
      end
    end
  end
end
