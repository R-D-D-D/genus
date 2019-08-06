class RegistrationsController < ApplicationController
    
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def new
  end 

    def create
      puts user_params[:password]
      puts user_params[:password_confirmation]
      if user_params[:password] != user_params[:password_confirmation]
        # error handling
        flash[:danger] = "Password does not match confirmation password"
        render 'new'  
        return
      end

      user = User.new(user_params)

        if user.save
          redirect_to root_path
        else
          flash[:danger] = user.errors.full_messages
          render 'new'
        end
    end

    private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end