class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
