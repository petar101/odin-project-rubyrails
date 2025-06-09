class PostsController < ApplicationController
  before_action :require_member, only: [ :create, :new ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :require_author, only: [ :edit, :update, :destroy ]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end

  def require_member
    unless member?
      redirect_to root_path, alert: "You must be a member to create posts."
    end
  end

  def require_author
    unless current_user == @post.user
      redirect_to root_path, alert: "You can only edit or delete your own posts."
    end
  end
end
