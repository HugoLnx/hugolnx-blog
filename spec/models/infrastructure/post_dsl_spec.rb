require 'spec_helper'

module Infrastructure
  describe PostDsl do
    describe '.wrap_postfile_from(path)', :stub_posts_directory_constant => true do
      it 'return postfile and postfile_content from path' do
        postfile, postfile_content = 
          PostDsl.wrap_postfile_from(TEST_POSTS_IN_TYPE_1.first)
        postfile.should be_a Postfile
        postfile_content.should be_a PostfileContent
      end
    end

    describe '.build(postfile,postfile_content)' do
      before :each do
        @postfile = stub :postfile,
          :title => 'some title',
          :id => 999,
          :location => '/commons'
        @postfile_content = stub :postfile_content,
          :catch_attributes => {
            :body => "body of post",
            :creation_date => :creation_date_of_post
          }
        @id = 1
        @post = PostDsl.build(@postfile,@postfile_content,@id)
      end

      it 'return a new post' do
        @post.should be_a Post
      end

      context 'with' do
        it 'relative_id from postfile' do
          @post.relative_id.should be == @postfile.id
        end

        it 'id is passed as argument' do
          @post.id.should be == @id
        end

        it 'title from postfile' do
          @post.title.should be == @postfile.title
        end

        it 'location from postfile' do
          @post.location.should be == @postfile.location
        end

        it 'body from postfile_content' do
          @post.body.should be == @postfile_content.catch_attributes[:body]
        end

        it 'creation date from postfile_content' do
          @post.creation_date.should be == 
            @postfile_content.catch_attributes[:creation_date]
        end
      end
    end

    describe '.build_all_in' do
      it 'build all posts in some directory', :stub_posts_directory_constant => true do
        posts = PostDsl.build_all_in TEST_POSTS_DIRECTORY
        posts.should be_all {|post| post.is_a? Post}
        posts.should have(2).posts
      end
    end
  end
end
