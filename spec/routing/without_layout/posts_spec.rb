require 'spec_helper'

describe "Routes to WithoutLayout::PostsController" do
  get("/without_layout/1-ola-a-todos").should route_to(
    :controller => 'without_layout/posts',
    :action => 'show',
    :id => '1-ola-a-todos'
  )
end
