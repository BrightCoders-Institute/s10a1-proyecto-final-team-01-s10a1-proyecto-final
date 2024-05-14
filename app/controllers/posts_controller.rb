class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show edit update destroy switch_user_favorite ]
  before_action :check_if_is_owner_or_admin, only: %i[ edit update destroy ]

  def index
    @posts = Post.all
    date_filter = params[:date_filter]
    user_favorites = params[:user_favorites]

    filtering_params(params).each do |key, value|
      if value.present? && !value.empty? && (date_filter.present? || key != "dates_range") &&
        (user_favorites.present? || key != "user_favorites")
        @posts = @posts.public_send("filter_by_#{key}",  key == "user_favorites" ? current_user.id : value)
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


  def switch_user_favorite
    favorite_mark_exists = current_user.post_favorite_marking_exists?(@post.id)
    favorite_marking = FavoritePost.find_or_create_by(user_id: current_user.id, post_id: @post.id)

    if favorite_mark_exists
      favorite_marking.update(favorite: !favorite_marking.favorite)
    else
      favorite_marking.update(favorite: true)
    end

    favorite_marking.save!
    redirect_back(fallback_location: request.referer)
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
      params.slice(:users_ids, :title, :user_favorites)
    end
end
