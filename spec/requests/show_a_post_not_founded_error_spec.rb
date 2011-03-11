require 'spec_helper'

describe 'requests to show an post not founded error:' do
  describe 'GET /9999' do
    before(:each) {get '/9999'}
    it {should redirect_to '/#9999'}
  end

  describe 'GET /#9999' do
    before(:each) {get '/#9999'}
    it {should render_template 'layouts/application'}
  end

  describe 'GET /posts/show/9999' do
    before(:each) {get '/posts/show/9999'}
    it {should redirect_to '/errors/show/PostNotFounded'}
  end

  describe 'GET /errors/show/PostNotFounded' do
    before(:each) {get '/errors/show/PostNotFounded'}
    it {should render_template 'errors/show'}
    it {should_not render_template 'layouts/application'}
  end
end

