class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Ruby and MongoDb App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    
  end

  def delete
    
  end

  private
    def user_params
      params.require(:user).permit(:firstname,:lastname,:email,:password,:password_confirmation)
    end
end
