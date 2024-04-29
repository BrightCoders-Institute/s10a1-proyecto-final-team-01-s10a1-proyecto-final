class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ create destroy ]
  before_action :check_if_is_owner_or_admin, only: %i[ destroy ]

  def index; end

  def create
    comment = @post.comments.create!(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    comment = @post.comments.find(params[:id])
    comment.destroy
    redirect_to post_path(@post), status: :see_other
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def check_if_is_owner_or_admin
      unless @post.user.id == current_user.id || current_user.is_an_admin?
        redirect_to posts_path(page: 1), notice: "Only owners and admin are allowed to delete comments."
      end
    end

    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :title, :rating, :content)
    end
end
