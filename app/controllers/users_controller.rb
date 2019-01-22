class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      # or do I want a specific user homepage??
      redirect_to user_path(@user)
    else
      flash[:alert] = "Please enter a valid email and password"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
