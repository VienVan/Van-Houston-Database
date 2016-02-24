class SessionsController < ApplicationController

      def new
          @user = User.new
      end

      def create
          user_params = params.require(:user).permit(:email, :password)
          @user = User.confirm(user_params)
          if @user
            login(@user)
            p @user
            p "logged in"
            redirect_to "/users/#{@user.id}"
          else
            redirect_to "/sign-in"
          end
      end

      def destroy
          session.delete(:user_id)
          redirect_to "/sign-in"
      end

end
