require 'spec_helper'

describe 'requests to edit a comment' do
  fixtures :users, :posts, :comments

  describe 'GET /comments/1/editar?without_layout=true' do
    before(:each) {get "/comments/#{Comment.first.id}/editar",:without_layout => 'true'}
    it {should_not render_template 'layouts/application'}
    it {should render_template 'comments/_form'}
  end
end
