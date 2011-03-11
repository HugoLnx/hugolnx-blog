require 'spec_helper'

describe 'requests to show a routing error:' do
  describe 'GET /notnumber' do
    before(:each) {get '/notnumber'}
    it {should redirect_to '/#notnumber'}
  end

  describe 'GET /#notnumber' do
    before(:each) {get '/#notnumber'}
    it {should render_template 'layouts/application'}
  end

  describe 'GET /errors/show/notnumber' do
    before(:each) {get '/errors/show/notnumber'}
    it {should render_template 'errors/show'}
    it {should_not render_template 'layouts/application'}
  end
end
