require 'spec_helper'

describe "Posts Routes" do
  it 'should route get / to /posts/master_layout' do
    {:get => '/'}.should route_to :controller => 'posts', :action => 'master_layout'
  end

  it 'should route get /#anything to /posts/master_layout' do
    {:get => '/#anything'}.should route_to :controller => 'posts', :action => 'master_layout'
  end

  it 'should route get /4 to /posts/call_ajax/4' do
    {:get => "/4"}.should route_to :controller => 'posts', :action => 'call_ajax', :id => '4'
  end

  it 'should route get /posts/show/4 to /posts/show/4' do
    {:get => "/posts/show/4"}.should route_to :controller => 'posts', :action => 'show', :id => '4'
  end
end
