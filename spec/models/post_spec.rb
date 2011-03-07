require 'spec_helper'

describe Post do
  it 'should delegates find of post to PostFactory' do
    Infraestrutura::PostFactory.should_receive('build_for_id')
                               .with(1 ,:in => 'spec/fixtures/')
    Post.find 1 ,:in => 'spec/fixtures/'
  end
end
