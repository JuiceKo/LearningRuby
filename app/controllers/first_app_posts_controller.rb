class FirstAppPostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show]
  before_action :set_first_app_post, except: [:index, :new, :create] #only: [:show, :edit, :update, :destroy]


  def index
    @first_app_posts = user_signed_in? ? FirstAppPost.sorted : FirstAppPost.published.sorted
  end

  def show
  end

  def new
    #if user_signed_in?
    @first_app_post = FirstAppPost.new
      #else
      #redirect_to root_path
  end

  def create
    @first_app_post = FirstAppPost.new(first_app_post_params)
    if @first_app_post.save
      redirect_to @first_app_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @first_app_post.update(first_app_post_params)
      redirect_to @first_app_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @first_app_post.destroy
    redirect_to root_path
  end

  private

  def set_first_app_post
    @first_app_post = user_signed_in? ? FirstAppPost.find(params[:id]) : FirstAppPost.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def first_app_post_params
    params.require(:first_app_post).permit(:titl, :content, :published_at)
  end

end