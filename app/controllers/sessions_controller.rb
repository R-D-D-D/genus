class SessionsController < ApplicationController
  include CurrentUserConcern

  def new
  end

    def create
        user = User.find_by(email: login_params["email"]).try(:authenticate, login_params["password"])
        if user 
          session[:user_id] = user.id
          session[:expires_at] = Time.current + 24.hours
          render json: {
              status: :created,
              logged_in: true,
              user: user
          }
        else
          render json: { status: 401 }
        end
    end



  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end

  private
    def login_params
      params.require(:login).permit(:email, :password)
    end
end