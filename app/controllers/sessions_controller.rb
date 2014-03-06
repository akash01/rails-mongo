class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:session][:email].downcase).first
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash[:error] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  # def signed_in_user
  #   redirect_to signin_url, notice: "Please sign in." unless session[:user_id]
  # end
end
