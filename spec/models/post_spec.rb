require 'spec_helper'

describe Post do
  it {should have_many :comments}

  describe ".find(id,:in)" do
    after(:each) {Post.find 1 ,:in => 'spec/fixtures/'}
    it "should call PostDsl.find_and_build(id,:in)" do
      Infrastructure::PostDsl.should_receive('find_and_build')
                             .with(1 ,:in => 'spec/fixtures/')
    end
  end

  describe '.all_post_titles_in(path)' do
    after(:each){Post.all_post_titles_in 'spec/fixtures/'}
    it "should call PostDsl.find_all_post_titles_in(path)" do
      Infrastructure::PostDsl.should_receive('find_all_post_titles_in')
                              .with('spec/fixtures/')
    end
  end

  describe ".id_max_in(path)" do
    after(:each){Post.id_max_in 'spec/fixtures/'}
    it 'should call PostDsl.find_id_max_in(path)' do
      Infrastructure::PostDsl.should_receive('find_id_max_in')
                              .with('spec/fixtures/')
    end
  end
end
