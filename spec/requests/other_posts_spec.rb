require 'spec_helper'

describe 'Requests to OtherPostsController' do
  describe 'GET /comunidade/ruby-on-rio' do
    before(:each){get '/comunidade/ruby-on-rio'}
    it {should render_template 'layouts/application'}
    it {should render_template 'posts/show'}
  end
end
