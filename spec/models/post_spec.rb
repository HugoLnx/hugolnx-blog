require 'spec_helper'

describe Post do
  it 'should delegates find of post to PostFactory' do
    Infrastructure::PostFactory.should_receive('build_for_id')
                               .with(1 ,:in => 'spec/fixtures/')
    Post.find 1 ,:in => 'spec/fixtures/'
  end

  it 'should delegates find of post titles to Postfile' do
    Infrastructure::Postfile.should_receive('find_all_post_titles_in')
                            .with('spec/fixtures/')
    Post.all_post_titles_in 'spec/fixtures/'
  end

  it 'should delegates find of id max to Postfile' do
    Infrastructure::Postfile.should_receive('find_id_max_in')
                            .with('spec/fixtures/')
    Post.id_max_in 'spec/fixtures/'
  end
end
