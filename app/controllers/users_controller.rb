class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = current_user == @user ? @user.posts : @user.public_posts
  end
end
