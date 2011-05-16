require 'spec_helper'

describe "Errors Routes" do
  get("/errors/show/4").should route_to(
    :controller => 'errors',
    :action => 'show',
    :id => '4'
  )

  describe 'GET to unknown routes' do
    get("/lol").should route_to(
      :controller => 'errors',
      :action => 'call_ajax',
      :message => 'lol'
    )

    get("/lol/wtf").should route_to(
      :controller => 'errors',
      :action => 'call_ajax',
      :message => 'lol/wtf'
    )

    get("/123lol").should route_to(
      :controller => 'errors',
      :action => 'call_ajax',
      :message => '123lol'
    )

    get("/lol123").should route_to(
      :controller => 'errors',
      :action => 'call_ajax',
      :message => 'lol123'
    )

    get("/lol/#123").should route_to(
      :controller => 'errors',
      :action => 'call_ajax',
      :message => 'lol/'
    )
  end
end
