require 'spec_helper'

describe 'requests to edit a comment' do
  describe 'GET /comments/1/editar?without_layout=true' do
    before(:each)  do
      comment = Comment.create!(:user_id => 1, :post_id => 1, :content => "test")
      get "/comments/#{comment.id}/editar",:without_layout => 'true'
    end
    it {should_not render_template 'layouts/application'}
    it {should render_template 'comments/_form'}
  end
end
