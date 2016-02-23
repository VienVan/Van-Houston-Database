class UsersController < ApplicationController
      def index
          @users = User.all
      end

      def show
          @user = User.find(params[:id])
      end

      def new
          @user = User.new
      end

      def create
          @user = User.new(user_params)
          if  @user.save
              login(@user)
              redirect_to user_path(@user)
          else
              redirect_to new_user_path
          end
      end

      def edit
          @user = User.find(params[:id])
      end

      def update
          @user = User.find(params[:id])
          update_params = params.require(:user).permit(:email, :password)
          @user.update_attributes(update_params)
          redirect_to user_path(@user)
      end

      private
      def user_params
          user_params = params.require(:user).permit(:email, :username, :password, :phone, :first_name, :last_name)
      end
end
