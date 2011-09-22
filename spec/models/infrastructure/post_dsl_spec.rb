require 'spec_helper'

module Infrastructure
  describe PostDsl do
    describe '.find(id,{:directory})' do
      it 'return postfile and postfile_content of a post' do
        postfile, postfile_content = 
          PostDsl.find(1,:in => 'spec/fixtures')
        postfile.should be_a Postfile
        postfile_content.should be_a PostfileContent
        
      end
    end

    describe '.build(postfile,postfile_content)' do
      before :each do
        @postfile = stub :postfile,
          :title => 'some title',
          :id => 999
        @postfile_content = stub :postfile_content,
          :catch_attributes => {
            :body => "body of post",
            :creation_date => :creation_date_of_post
          }
        @post = PostDsl.build(@postfile,@postfile_content)
      end

      it 'return a new post' do
        @post.should be_a Post
      end

      context 'with' do
        it 'id from postfile' do
          @post.id.should be == @postfile.id
        end

        it 'title from postfile' do
          @post.title.should be == @postfile.title
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

    describe '.find_all_in' do
      it 'find all posts in some directory' do
        posts = PostDsl.find_all_in 'spec/fixtures/posts'
        posts.should be_all {|post| post.is_a? Post}
        posts.should have(2).posts
      end
    end
  end
end
