require 'spec_helper'

describe 'Comments Routes' do
  get("/4/comments/1").should route_to(
    :controller => 'comments',
    :action => 'show',
    :id => '1',
    :post_id => '4'
  )

  get("/4/comments").should route_to(
    :controller => 'comments',
    :action => 'index',
    :post_id => '4'
  )

  post("/4/comments").should route_to(
    :controller => 'comments', 
    :action => 'create', 
    :post_id => '4'
  )
end
