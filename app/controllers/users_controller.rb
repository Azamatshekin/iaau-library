class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      remember user
      flash[:success] = "You are Registered! Welcome to the Sample App!"
      redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end
    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
end
