class SessionsController < ApplicationController
  auto_session_timeout_actions
  skip_before_action :authorize


  def active
   render_session_status
  end

  def timeout
    flash[:error] = "Your session has timed out."
    render_session_timeout
  end

  def new
  end


  def create
      user = User.find_by(login: params[:login])
      if (user and user.authenticate(params[:password]))
        session[:user_id] = user.id
        current_user = session[:user_id]
        redirect_to m2w_path
      else
        redirect_to login_path, alert: "Invalid user or password combination"
      end
    end

    def destroy
      session[:user_id] =  nil
      redirect_to login_path, notice: "Logged out"
    end

    def full_name
        "#{first_name} #{last_name}"
    end
end
