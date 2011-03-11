require 'spec_helper'

describe "Errors Routes" do
  it 'should route get unknown routes to /errors/call_ajax/(route)' do
    {:get => "/lol"}.should route_to :controller => 'errors', :action => 'call_ajax', :tryied_path => 'lol'
    {:get => "/lol/wtf"}.should route_to :controller => 'errors', :action => 'call_ajax', :tryied_path => 'lol/wtf'
    {:get => "/123lol"}.should route_to :controller => 'errors', :action => 'call_ajax', :tryied_path => '123lol'
    {:get => "/lol123"}.should route_to :controller => 'errors', :action => 'call_ajax', :tryied_path => 'lol123'
    {:get => "/lol/#123"}.should route_to :controller => 'errors', :action => 'call_ajax', :tryied_path => 'lol/'
  end

  it 'should route get /errors/show/4 to /errors/show/4' do
    {:get => "/errors/show/4"}.should route_to :controller => 'errors', :action => 'show', :id => '4'
  end
end
