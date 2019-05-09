class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticated
  helper_method :current_cart


  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authenticated
  redirect_to login_path unless logged_in?
  end

  def current_cart
    session[:cart] ||= []
  end



end
