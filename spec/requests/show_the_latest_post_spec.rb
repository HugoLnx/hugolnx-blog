require 'spec_helper'

describe 'requests to show the latest post:' do
  describe 'GET /' do
    before(:each) {get '/'}
    it {should render_template 'posts/show'}
    it {should render_template 'layouts/application'}
  end

  describe 'GET /4' do
    before(:each) {get '/4'}
    it {should render_template 'posts/show'}
    it {should render_template 'layouts/application'}
  end
end
