require 'spec_helper'

describe 'Routes of Omniauth' do
  get('/auth/failure').should route_to(
    :controller => 'errors',
    :action => 'show'
  )

  get('/auth/twitter').should route_to(
    :controller => 'sessions',
    :action => 'setup',
    :provider => 'twitter'
  )

  get('/auth/twitter/callback').should route_to(
    :controller => 'sessions',
    :action => 'create',
    :provider => 'twitter'
  )
end
