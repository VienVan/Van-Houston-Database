class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def confirm_login
      unless session[:user_id]
          flash[:notice] = "Please log in"
          redirect_to :controller => 'sessions', :action => 'sign-in'
          return false
      end
  end

  include SessionsHelper
end
