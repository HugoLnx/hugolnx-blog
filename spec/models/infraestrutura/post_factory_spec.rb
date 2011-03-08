require 'spec_helper'

module Infraestrutura
  describe PostFactory do
    it 'should build post with id 1 of directory spec/fixtures' do
      post = PostFactory.build_for_id 1 ,:in => 'spec/fixtures/'
      post.should be_a Post
    end
  end
end
