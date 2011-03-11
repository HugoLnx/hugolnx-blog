require 'spec_helper'

describe 'requests to show the latest post:' do
  describe 'GET /' do
    before(:each) {get '/'}
    it {should render_template 'layouts/application'}
  end

  describe 'GET /posts/show/4' do
    before(:each) {get '/posts/show/4'}
    it {should render_template 'posts/show'}
    it {should_not render_template 'layouts/application'}
  end
end
