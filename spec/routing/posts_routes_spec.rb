require 'spec_helper'

describe "Posts Routes" do
  describe 'GET /' do
    it {{:get => '/'}.should route_to :controller => 'posts', :action => 'master_layout'}
  end

  describe 'GET /#anything' do
    it {{:get => '/#anything'}.should route_to :controller => 'posts', :action => 'master_layout'}
  end

  describe 'GET /4' do
    it {{:get => "/4"}.should route_to :controller => 'posts', :action => 'call_ajax', :id => '4'}
  end

  describe 'GET /posts/show/4' do
    it {{:get => "/posts/show/4"}.should route_to :controller => 'posts', :action => 'show', :id => '4'}
  end
end
