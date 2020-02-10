class SessionsController < Devise::SessionsController

    # POST /v1/login
    def create
        puts 'any user params??????'
        puts user_params
       
      @user = User.find_by_email(user_params[:email])
      puts @user
      return invalid_login_attempt unless @user
  
      if @user.valid_password?(user_params[:password])
        sign_in :user, @user
        render json: @user
      else
        invalid_login_attempt
      end
    end
  
    def destroy
        puts 'SIGN OUT'
      sign_out(@user)
      render json:  {:success=>true}
    end
  
  
      private
  
      def invalid_login_attempt
        puts 'ivalid!!!!!!!'
        warden.custom_failure!
        render json: {error: 'invalid login attempt'}, status: :unprocessable_entity
      end
  
      def user_params
         params.require(:user).permit(:email, :password)
      end
  
  end
