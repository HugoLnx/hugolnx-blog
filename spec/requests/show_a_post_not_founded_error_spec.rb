require 'spec_helper'

describe 'requests to show an post not founded error:' do
  describe 'GET /9999' do
    before(:each) {get '/9999'}
    it {should render_template 'layouts/application'}
    it {should render_template 'errors/show'}
  end
end

