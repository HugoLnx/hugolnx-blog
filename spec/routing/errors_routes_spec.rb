require 'spec_helper'

describe "Errors Routes" do
  get("/nao-encontrado").should route_to(
    :controller => 'errors',
    :action => 'show',
    :message => Infrastructure::PostException::PostNotFoundedMessage
  )

  describe 'GET to unknown routes' do
    get("/lol").should route_to(
      :controller => 'errors',
      :action => 'show',
      :message => 'lol'
    )

    get("/lol/wtf/fasd").should route_to(
      :controller => 'errors',
      :action => 'show',
      :message => 'lol/wtf/fasd'
    )

    get("/123lol").should route_to(
      :controller => 'errors',
      :action => 'show',
      :message => '123lol'
    )

    get("/lol123").should route_to(
      :controller => 'errors',
      :action => 'show',
      :message => 'lol123'
    )

    get("/lol/#123").should route_to(
      :controller => 'errors',
      :action => 'show',
      :message => 'lol/'
    )
  end
end
