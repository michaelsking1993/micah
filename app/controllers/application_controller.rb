class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_team

  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def current_team
    @current_team = Team.first #just use our team for now...
  end
end
