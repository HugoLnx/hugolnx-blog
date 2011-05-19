require 'spec_helper'

describe 'requests to show a post:' do
  describe 'GET /4' do
    before(:each) {get '/4'}
    it {should render_template 'posts/show'}
    it {should render_template 'layouts/application'}
  end

  #describe 'GET /posts/show/4 (via AJAX)' do
  #  before(:each) {get '/posts/show/4'}
  #  it {should render_template 'posts/show'}
  #  it {should_not render_template 'layouts/application'}
  #end
end
