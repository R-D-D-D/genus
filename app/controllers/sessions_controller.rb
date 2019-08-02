class SessionsController < ApplicationController
  include CurrentUserConcern

  def new
  end

  def create
    user = User.find_by(email: params[:session]["email"]).try(:authenticate, params[:session]["password"])
    if user
      session[:user_id] = user.id
      respond_to do |format|
        format.html {
          redirect_to root_url
        }
        format.json {
          status = "created"
          logged_in = true
          user = user
        }
      end
    else
      flash[:danger] = "Invalid password and account combination"
      render 'new'
    end
  end

  def logged_in
    if @current_user
      render json: {
          logged_in: true,
          user: @current_user
      }
    else
      render json: {
          logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {status: 200, logged_out: true}
  end
end