require 'spec_helper'

describe "Errors Routes" do
  describe 'GET to unknown routes' do
    describe 'GET /lol' do
      it {{:get => "/lol"}.should route_to :controller => 'errors', :action => 'call_ajax', :message => 'lol'}
    end

    describe 'GET /lol/wtf' do
      it {{:get => "/lol/wtf"}.should route_to :controller => 'errors', :action => 'call_ajax', :message => 'lol/wtf'}
    end

    describe 'GET /123/lol' do
      it {{:get => "/123lol"}.should route_to :controller => 'errors', :action => 'call_ajax', :message => '123lol'}
    end

    describe 'GET /lol123' do
      it {{:get => "/lol123"}.should route_to :controller => 'errors', :action => 'call_ajax', :message => 'lol123'}
    end

    describe 'GET /lol/#123' do
        it {{:get => "/lol/#123"}.should route_to :controller => 'errors', :action => 'call_ajax', :message => 'lol/'}
    end
  end

  describe 'GET /errors/show/4' do
    it {{:get => "/errors/show/4"}.should route_to :controller => 'errors', :action => 'show', :id => '4'}
  end
end
