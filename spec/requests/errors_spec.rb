require 'spec_helper'

describe 'requests to ErrorsController' do
  describe 'GET /9999' do
    before(:each) {get '/9999'}
    it {should redirect_to '/nao-encontrado'}
  end

  describe 'GET /notnumber' do
    before(:each) {get '/notnumber'}
    it {should render_template 'errors/show'}
    it {should render_template 'layouts/application'}
  end
end

