module SessionsHelper

  def sign_in(user)
    session[:user_id] = user._id
    session[:firstname] = user.firstname
    flash[:notice] = "You are now logged in"
    self.current_user = user
  end


  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    user == current_user
  end

   # def signed_in?
   #   !current_user.nil?
   # end

  def sign_out
    session[:user_id] = nil
    session[:firstname] = nil
    self.current_user = nil
    flash[:notice] = "Logout successful"
  end

  def signed_in_user
   redirect_to signin_url, notice: "Please sign in." unless session[:user_id]
  end
end
