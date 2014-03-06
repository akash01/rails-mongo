class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if session[:user_id]
    @feed_items = current_user.microposts.paginate(page: params[:page]) if session[:user_id]
  end

  def help
  end

  def contact
  end

  def about
  end
end
