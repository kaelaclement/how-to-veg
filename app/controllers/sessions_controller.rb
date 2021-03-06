class SessionsController < ApplicationController
  def new
  end

  def create
    if auth
      if user = User.find_by(email: auth['info']['email'])
        session[:user_id] = user.id
        redirect_to recipes_path
      else
        user = User.create(name: auth['info']['name'], email: auth['info']['email'], password: SecureRandom.hex)
        session[:user_id] = user.id
        redirect_to recipes_path
      end
    else
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:alert] = "Please enter valid email and password"
        render :new
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private
    def auth
      request.env["omniauth.auth"]
    end
end
