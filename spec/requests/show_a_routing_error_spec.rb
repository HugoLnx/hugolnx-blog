require 'spec_helper'

describe 'requests to show a routing error:' do
  describe 'GET /notnumber' do
    before(:each) {get '/notnumber'}
    it {should render_template 'errors/show'}
    it {should render_template 'layouts/application'}
  end
end
