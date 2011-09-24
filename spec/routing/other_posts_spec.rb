require 'spec_helper'

describe 'Routes to OtherPostsController' do
  get('/location/post-name').should route_to(
    :controller => 'other_posts',
    :action => 'show',
    :location => 'location',
    :id => 'post-name'
  )
end
