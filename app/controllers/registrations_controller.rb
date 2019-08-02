class RegistrationsController < ApplicationController
    
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def new
  end 

    def create
        user = User.new(user_params)

        if user.save
          redirect_to root_path
        else
          flash[:register_errors] = user.errors.full_messages
          redirect_to root_path  
        end
    end

    private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end