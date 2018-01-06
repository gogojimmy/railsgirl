class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(form_params)
    if @post.save
      redirect_to posts_path, notice: 'created'
      redirect_to posts_path, { :notice => 'created' }
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(form_params)
      redirect_to posts_path, notice: 'updated'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def form_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end


end
