require 'spec_helper'

describe Post do
  it {should have_many :comments}

  describe ".find(id,:in)" do
    context "when called with all arguments" do
      after(:each) {Post.find 1 ,:in => 'spec/fixtures/'}
      it "calls PostDsl.find_and_build(id,:in)" do
        Infrastructure::PostDsl.should_receive('find_and_build')
                               .with(1 ,:in => 'spec/fixtures/')
      end
    end

    context "when called without posts directory argument" do
      after(:each) {Post.find 1 }
      it "calls PostDsl.find_and_build(id,POSTS_DIRECTORY)" do
        Post::POSTS_DIRECTORY = "spec/fixtures/"
        Infrastructure::PostDsl.should_receive('find_and_build')
                               .with(1 ,:in => 'spec/fixtures/')
      end
    end
  end

  describe '.all_post_titles_in(path)' do
    after(:each){Post.all_post_titles_in 'spec/fixtures/'}
    it "calls PostDsl.find_all_post_titles_in(path)" do
      Infrastructure::PostDsl.should_receive('find_all_post_titles_in')
                              .with('spec/fixtures/')
    end
  end

  describe ".id_max_in(path)" do
    after(:each){Post.id_max_in 'spec/fixtures/'}
    it 'calls PostDsl.find_id_max_in(path)' do
      Infrastructure::PostDsl.should_receive('find_id_max_in')
                              .with('spec/fixtures/')
    end
  end

  describe ".config(configurations)" do
    it "configure the default directory of posts" do
      Post.config :posts_directory => "/testing/dir"
      Post.class_variable_get("@@posts_directory").should == "/testing/dir"
    end
  end

  describe '#friendly_title' do
    it 'returns a title without space or special characters' do
      post = Post.find(1, :in => 'spec/fixtures')
      post.friendly_title.should be == "testing-post-1"
    end
  end

  describe '#friendly_id' do
    it 'returns a friendly id based on id and title' do
      post = Post.find(1, :in => 'spec/fixtures')
      post.friendly_id.should be == "1-testing-post-1"
    end
  end

  describe '#to_param' do
    it 'calls friendly_id' do
      post = Post.find(1, :in => 'spec/fixtures')
      post.should_receive :friendly_id
      post.to_param
    end
  end
end
