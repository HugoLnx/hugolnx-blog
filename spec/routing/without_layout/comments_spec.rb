require 'spec_helper'

describe "Routes to WithoutLayout::CommentsController" do
  get("/without_layout/comments/1/edit").should route_to(
    :controller => 'without_layout/comments',
    :action => 'edit',
    :id => '1'
  )
end
