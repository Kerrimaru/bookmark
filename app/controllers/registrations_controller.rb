# class RegistrationsController < Devise::RegistrationsController

#   private

#   def sign_up_params
#     params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
#   end

#   def account_update_params
#     params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
#   end
# end

class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(user_params)
    puts @user
    if @user.save
      render json: @user
    else
      warden.custom_failure!
      render json: { error: 'signup error' }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find_by_email(user_params[:email])

    if @user.update_attributes(user_params)
      render json: @user
    else
      warden.custom_failure!
      render :json=> @user.errors, :status=>422
    end
 end

  def destroy
    @user = User.find_by_email(user_params[:email])
    if @user.destroy
      render :json=> { success: 'user was successfully deleted' }, :status=>201
    else
      render :json=> { error: 'user could not be deleted' }, :status=>422
    end
  end

  private

  def user_params
     params.require(:user).permit(:email, :password, :password_confirmation)
  end
end