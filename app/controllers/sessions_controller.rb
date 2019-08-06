class SessionsController < ApplicationController
  include CurrentUserConcern

  def new
  end

    def create
        user = User.find_by(email: login_params["email"]).try(:authenticate, login_params["password"])
        if user 
          session[:user_id] = user.id
          session[:expires_at] = Time.current + 1.years
            redirect_to root_url

        else
          flash[:danger] = "Invalid password and account combination"
          render 'new'
        end
    end
  


  def logout
    reset_session
    redirect_to root_url
  end

  private
    def login_params
      params.require(:login).permit(:email, :password)
    end
end