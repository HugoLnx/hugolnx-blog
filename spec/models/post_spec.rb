require 'spec_helper'

describe Post do
  it {should have_many :comments}

  it 'should delegates find of post to PostDsl' do
    Infrastructure::PostDsl.should_receive('find_and_build')
                               .with(1 ,:in => 'spec/fixtures/')
    Post.find 1 ,:in => 'spec/fixtures/'
  end

  it 'should delegates find of post titles to PostDsl' do
    Infrastructure::PostDsl.should_receive('find_all_post_titles_in')
                            .with('spec/fixtures/')
    Post.all_post_titles_in 'spec/fixtures/'
  end

  it 'should delegates find of id max to PostDsl' do
    Infrastructure::PostDsl.should_receive('find_id_max_in')
                            .with('spec/fixtures/')
    Post.id_max_in 'spec/fixtures/'
  end
end
