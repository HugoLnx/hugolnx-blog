require 'spec_helper'

describe "Posts Routes" do
  get('/').should route_to(
    :controller => 'posts', 
    :action => 'index'
  )

  get("/4").should route_to(
    :controller => 'posts',
    :action => 'show',
    :id => '4'
  )

  get("/feed").should route_to(
    :controller => 'posts',
    :action => 'feed',
  )
end
