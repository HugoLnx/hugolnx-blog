require 'spec_helper'

describe Post do
  it 'should find the post with id 1 of directory spec/fixtures' do
    @post = Post.find 1 ,:in => 'spec/fixtures/'
    @post.title.should == "Testing Post 1"
    @post.body.should == "Testing Body 1"
  end

  it 'should find the post with id 2 of directory spec/fixtures' do
    @post = Post.find 2 ,:in => 'spec/fixtures/'
    @post.title.should == "Testing Post 2"
    @post.body.should == "Testing Body 2"
  end
end
