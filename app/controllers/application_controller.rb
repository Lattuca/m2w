class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #  time out sessions
  auto_session_timeout 5.minutes

  protect_from_forgery with: :exception

  # load global functions
  require 'm2w'


  before_action :authorize

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_path, notice: "Please log in"
    else
      @current_user = User.find_by(id: session[:user_id])
      @user_full_name = "#{@current_user.first_name} #{@current_user.last_name}"
    end
  end

end
