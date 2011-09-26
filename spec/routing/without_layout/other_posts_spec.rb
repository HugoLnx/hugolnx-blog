require 'spec_helper'

describe "Routes to WithoutLayout::OtherPostsController" do
  get("/without_layout/location/post-title").should route_to(
    :controller => 'without_layout/other_posts',
    :action => 'show',
    :location => 'location',
    :id => 'post-title'
  )
end
