class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end


  def create
      user = User.find_by(login: params[:login])
      puts :login
      if (user and user.authenticate(params[:password]))
        session[:user_id] = user.id
        redirect_to m2w_path
      else
        redirect_to login_path, alert: "Invalid user or password combination"
      end
    end

    def destroy
      session[:user_id] =  nil
      redirect_to login_path, notice: "Logged out"
    end

end
