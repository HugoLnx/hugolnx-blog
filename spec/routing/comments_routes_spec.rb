require 'spec_helper'

describe 'Comments Routes' do
  post("/4/comments").should route_to(
    :controller => 'comments', 
    :action => 'create', 
    :post_id => '4'
  )

  put("comments/2").should route_to(
    :controller => 'comments', 
    :action => 'update', 
    :id => '2'
  )
end
