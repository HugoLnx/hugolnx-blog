require 'spec_helper'

module Infraestrutura
  describe PostFactory do
    it 'should build post with id 1 of directory spec/fixtures' do
      post = PostFactory.build_for_id 1 ,:in => 'spec/fixtures/'
      post.should be_a Post
    end

    it 'should find all posts in spec/fixtures' do
      posts = PostFactory.build_all_in 'spec/fixtures/'
      posts.should have(2).items
      posts.should be_all{|post| post.is_a? Post}
    end
  end
end
