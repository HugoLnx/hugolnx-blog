require 'spec_helper'

describe Post do
  it {should have_many :comments}

  context "Class" do
    describe ".all()" do
      it "return @all" do
        posts = [:post1,:post2,:post3,:postn]
        Post.instance_variable_set(:@all,posts)
        Post.all.should be == posts
      end
    end

    describe ".find(id)" do
      it "return the post with id 1" do
        post_id1 = mock(:post, :id => 1)
        Post.instance_variable_set(:@all,[mock(:post, :id => 2),post_id1])
        Post.find(1).should be == post_id1
      end

      context "when the post dont exist" do
        it "raise a PostException" do
          impossible = 99999999999999
          Post.instance_variable_set(:@all,[])
          lambda{Post.find(impossible)}.should raise_error Infrastructure::PostException
        end
      end
    end

    describe ".last()" do
      it "return the post with greatest id" do
        post_with_greatest_id = mock(:post, :id => 2)
        all_posts = [mock(:post, :id => 1),post_with_greatest_id]
        Post.instance_variable_set(:@all, all_posts)
        Post.last.should be == post_with_greatest_id
      end
    end
  end

  context "Instance" do
    describe '#friendly_id' do
      it 'returns a friendly id based on id and title' do
        post = Post.new :title => "Testing Post 1", :id => 1
        post.friendly_id.should be == "1-testing-post-1"
      end
    end

    describe '#to_param' do
      it 'calls friendly_id' do
        post = Post.new
        post.should_receive :friendly_id
        post.to_param
      end
    end

    describe '#friendly_title' do
      it 'returns a title without space or special characters' do
        post = Post.new :title => "Testing Post 1"
        post.friendly_title.should be == "testing-post-1"
      end
    end
  end
end
