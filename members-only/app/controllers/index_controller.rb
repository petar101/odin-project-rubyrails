class IndexController < ApplicationController
  def index
    if current_user
      @posts = Post.includes(:user).order(created_at: :desc)
    else
      redirect_to new_session_path
    end
  end
end
