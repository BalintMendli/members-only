class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      def log_in(user)
        update_attribute(:remember_digest, User.set_remember_digest)
        log_in user
        redirect_to user
      end
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def delete
    sign_out
  end
end
