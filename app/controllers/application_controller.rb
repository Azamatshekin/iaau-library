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
      if logged_in?
        unless current_user.role==librarian_role
          store_location
          flash[:danger] = "You are not Librarian, Access denied!"
          redirect_to access_denied_url
        end
      else
        store_location
        flash[:danger] = "You are unAuthorized Please log in."
        redirect_to login_url
      end
    end

    def user_admin
      if logged_in?
        unless current_user.admin?
          store_location
          flash[:danger] = "You are not Librarian, Access denied!"
          redirect_to access_denied_url
        end
      else
        store_location
        flash[:danger] = "You are unAuthorized Please log in."
        redirect_to login_url
      end
    end
  def user_admin_or_library
    if logged_in?
      if current_user.admin? or current_user.role==librarian_role
      else
        store_location
        flash[:danger] = "You are not Librarian, Access denied!"
        redirect_to access_denied_url
      end
    else
      store_location
      flash[:danger] = "You are unAuthorized Please log in."
      redirect_to login_url
    end
  end
end
