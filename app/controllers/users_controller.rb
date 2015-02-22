class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You're ready to go!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update
    else
      render 'edit'
    end
  end

  private
  # private since user_params will only be used internally
  # by the Users controller and need not be exposed to 
  # external users via the web

    def user_params
      params.require(:user).permit(:email, :password, 
        :password_confirmation, :orientation, :gender,
        :birthday, :zipcode, :country, :username, :userbio)
    end
end