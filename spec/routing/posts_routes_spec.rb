require 'spec_helper'

describe "Posts Routes" do
  get('/').should route_to(
    :controller => 'posts', 
    :action => 'index'
  )

  get("/4").should route_to(
    :controller => 'posts',
    :action => 'redirect_to_right_path',
    :id => '4'
  )

  get("/4-testando-post").should route_to(
    :controller => 'posts',
    :action => 'show',
    :id => '4-testando-post'
  )

  get("/feed").should route_to(
    :controller => 'posts',
    :action => 'feed',
  )

  get("/sitemap").should route_to(
    :controller => 'posts',
    :action => 'sitemap',
  )
end
