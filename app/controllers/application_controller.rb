class ApplicationController < ActionController::Base
  helper_method :current_user

  def log_in(user)
    session[:user_id] = user.id
    current_user = user
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif cookies[:remember_digest]
      @current_user ||= User.find_by(remember_digest: cookies[:remember_digest])
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    forget(current_user)
    session.delete(:user_id)
    cookies.delete(:remember_digest)
    current_user = nil
  end

  def remember(user)
    user.remember
    cookies.permanent[:remember_digest] = user.remember_digest
  end

  def forget(user)
    user.forget 
    cookies.delete(:user_id)
    cookies.delete(:remember_digest)
  end
end
