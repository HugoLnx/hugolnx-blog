require 'spec_helper'

describe "WithoutLayout/Posts Routes" do
  get("/without_layout/4").should route_to(
    :controller => 'without_layout/posts',
    :action => 'show',
    :id => '4'
  )
end
