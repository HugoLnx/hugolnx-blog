class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    user ||= User.create_with_omniauth(auth)
    session['user_id'] = user.id
    origin = request.env['omniauth.origin']
    origin = File.join(origin,"#" + params['hash']) if params.has_key? 'hash'
    redirect_to origin || '/'
  end

  def destroy
    session['user_id'] = nil
    redirect_to '/'
  end

  def setup
    render :nothing => true, :status => 404
  end
end
