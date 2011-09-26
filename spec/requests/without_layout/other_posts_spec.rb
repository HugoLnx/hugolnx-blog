require 'spec_helper'

describe 'Requests to WithoutLayout::OtherPostsController' do
  describe 'GET /without_layout/location/post-title' do
    before(:each) {get '/without_layout/comunidade/ruby-on-rio'}
    it {should render_template 'posts/show'}
    it {should_not render_template 'layouts/application'}
  end
end
