class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :owner_log_in, only: [:create]

  def create
    @user ||= User.find(params[:user_id])
    @post = Post.new(post_params)
    if @user.create_post(@post)
      redirect_to user_path(@user), notice: 'Post created'
    else
      redirect_to user_path(@user), alert: 'Invalid post'
    end
  end

  private
    def owner_log_in
      @user = User.find(params[:user_id])
      unless current_user == @user
        redirect_to new_user_session_path, alert: "Please log in to your account"
      end
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
