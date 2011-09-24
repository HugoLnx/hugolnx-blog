require 'spec_helper'

describe 'Requests to WithoutLayout::PostsController' do
  describe 'GET /without_layout/4' do
    before(:each) {get '/without_layout/4'}
    it {should render_template 'posts/show'}
    it {should_not render_template 'layouts/application'}
  end
end
