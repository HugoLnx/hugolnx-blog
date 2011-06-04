require 'spec_helper'

describe 'requests to show a post:' do
  describe 'GET /1' do
    before(:each) {get '/1'}
    it {should redirect_to '/1-ola-a-todos'}
  end

  describe 'GET /1-ola-a-todos' do
    before(:each) {get '/1-ola-a-todos'}
    it {should render_template 'posts/show'}
    it {should render_template 'layouts/application'}
  end

  describe 'GET /4?without_layout=true' do
    before(:each) {get '/4?without_layout=true'}
    it {should render_template 'posts/show'}
    it {should_not render_template 'layouts/application'}
  end
end
