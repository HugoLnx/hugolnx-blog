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

    describe ".find(id_or_attributes)" do
      context "pass a fixnum or string, as argument" do
        it "return the post with id 1" do
          post_id1 = stub(:post, :id => 1)
          Post.instance_variable_set(:@all,[stub(:post, :id => 2),post_id1])
          Post.find(1).should be == post_id1
        end
      end

      context "pass a hash of attributes" do
        it "return the post with this attributes" do
          post_locationtype1 = stub(:post, :location => 'type1')
          post_locationtype2 = stub(:post, :location => 'type2')
          Post.instance_variable_set(:@all,[post_locationtype1,post_locationtype2])
          Post.find(location: 'type1').should be == post_locationtype1
          Post.find(location: 'type2').should be == post_locationtype2
        end
      end

      context "when the post dont exist" do
        it "raise a PostException" do
          impossible = 99999999999999
          Post.instance_variable_set(:@all,[])
          lambda{Post.find(impossible)}.should raise_error Infrastructure::PostException
        end
      end
    end

    describe ".find_all(attributes)" do
      it "return the posts with this attributes" do
        post_locationtype1 = stub(:post, :location => 'type1')
        post_locationtype2_1 = stub(:post, :location => 'type2')
        post_locationtype2_2 = stub(:post, :location => 'type2')
        Post.instance_variable_set(:@all,[post_locationtype1,post_locationtype2_1,post_locationtype2_2])
        Post.find_all(location: 'type1').should be == [post_locationtype1]
        Post.find_all(location: 'type2').should be == [post_locationtype2_1, post_locationtype2_2]
      end

      context "when the post dont exist" do
        it "return an empty array" do
          Post.instance_variable_set(:@all,[])
          Post.find_all(:location => :not_exist).should be == []
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
      it 'returns a friendly id based on relative_id and title' do
        post = Post.new :title => "Testing Post 1", :id => 1, :relative_id => 10
        post.friendly_id.should be == "10-testing-post-1"
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
