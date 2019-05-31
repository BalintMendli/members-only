class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
  end

  def index
  end

  private

    def logged_in_user
      if !current_user
        flash[:danger] = "Please log in."
        redirect_to sign_in_path
      end
    end
end
