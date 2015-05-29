class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or books_path
        if user.admin?
          message = "Welcome! you logged in as admin"
          flash[:success] = message
        elsif user.role == reader_role
          message = "Welcome! you logged in as reader"
          flash[:success] = message
        elsif user.role == librarian_role
          message = "Welcome! you logged in as librarian"
          flash[:success] = message
        end
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    forget(current_user)
    log_out
    redirect_to root_url
  end
end
