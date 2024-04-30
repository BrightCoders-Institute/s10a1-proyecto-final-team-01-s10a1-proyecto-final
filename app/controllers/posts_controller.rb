class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :check_if_is_owner_or_admin, only: %i[ edit update destroy ]

  def index
    @posts = Post.all
    date_filter = params[:date_filter]

    filtering_params(params).each do |key, value|
      if value.present? && !value.empty? && (date_filter.present? || key != "dates_range")
        @posts = @posts.public_send("filter_by_#{key}", value)
      end
    end

    @pagy, @posts = pagy(@posts)
  rescue Pagy::VariableError
    redirect_to posts_path(page: 1)
  end

  def show
    @pagy, @comments = pagy(@post.comments)
  rescue Pagy::VariableError
    redirect_to post_path(@post, page: 1)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_url
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def check_if_is_owner_or_admin
      unless @post.user.id == current_user.id || current_user.is_an_admin?
        redirect_to posts_path(page: 1), notice: "Only owners and admin are allowed to manage posts."
      end
    end

    def post_params
      params.require(:post).permit(:user_id, :title, :content)
    end

    def filtering_params(params)
      params.slice(:users_ids, :title)
    end
end
