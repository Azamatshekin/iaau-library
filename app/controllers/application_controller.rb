class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def user_library
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
      unless current_user.role==librarian_role
        store_location
        flash[:danger] = "You are not Librarian, Access denied!"
        redirect_to "not library"
      end
    end
end
