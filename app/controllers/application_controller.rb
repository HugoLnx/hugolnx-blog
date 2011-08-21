class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :check_domain
  before_filter :define_robots_metatag_content
private
  def check_domain
    head :moved_permanently, :location => "http://hugolnx.com/" if request.host == 'hugolnx.heroku.com'
  end

  def define_robots_metatag_content
    if request.host != 'hugolnx.com' || controller_name == 'errors'
      @robots_metatag = 'noindex'
    else
      @robots_metatag = 'index'
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
