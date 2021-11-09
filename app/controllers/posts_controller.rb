class PostsController < ApplicationController
  before_action :authenticate_user!,        except: :index
  before_action :set_post,                  only: [:show, :update, :edit, :destroy]
  before_action :contributor_confirmation,  only: [:edit, :update, :destroy]
  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def update
    if @post.update(post_params)
        redirect_to root_path
    else
        render :edit
    end
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :content, :amount_id, :timing_id).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @post.user
  end

end
