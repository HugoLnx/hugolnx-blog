class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :check_domain
private
  def check_domain
    p request.host
    head :moved_permanently, :location => "http://hugolnx.com/" if request.host == 'hugolnxtest.heroku'
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
