require 'spec_helper'

describe "Posts Routes" do
  get('/').should route_to(
    :controller => 'posts', 
    :action => 'master_layout'
  )

  get('/#anything').should route_to( 
    :controller => 'posts', 
    :action => 'master_layout'
  )

  get("/4").should route_to(
    :controller => 'posts',
    :action => 'call_ajax',
    :id => '4'
  )

  get("/posts/show/4").should route_to(
    :controller => 'posts',
    :action => 'show',
    :id => '4'
  )
end
