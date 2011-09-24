require 'spec_helper'

describe 'requests to PostsController' do
  fixtures :users
  describe 'GET /' do
    before(:each) {get '/'}
    it {should render_template 'posts/show'}
    it {should render_template 'layouts/application'}
  end

  describe 'GET /1' do
    before(:each) {get '/1'}
    it {should redirect_to '/1-ola-a-todos'}
  end

  describe 'GET /1-ola-a-todos' do
    before(:each) do
      Comment.destroy_all
      Comment.create! :user_id => User.first.id, :post_id => 1, :content => 'testing'
      get '/1-ola-a-todos'
    end
    it {should render_template 'posts/show'}
    it {should render_template 'layouts/application'}
  end
end
