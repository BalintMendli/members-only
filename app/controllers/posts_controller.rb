class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
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

    def post_params
      params.require(:post).permit(:title,:body)
    end
end
