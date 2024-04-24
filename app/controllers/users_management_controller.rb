class UsersManagementController < ApplicationController
  before_action :set_user, only: %i[ show edit update remove_image destroy ]
  before_action :authenticate_user!
  before_action :check_if_is_admin

  def index
    @users = User.where.not(role_id: 1)
    date_filter = params[:date_filter]

    filtering_params(params).each do |key, value|
      if value.present? && !value.empty? && (date_filter.present? || key != "dates_range")
        @users = @users.public_send("filter_by_#{key}", value)
      end
    end

    @pagy, @users = pagy(@users)
  rescue Pagy::VariableError
    redirect_to users_management_index(page: 1)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    @user.skip_confirmation!

    if @user.save
      redirect_to users_management_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user.skip_confirmation!

    if @user.update(user_params)
      redirect_to users_management_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @user.destroy!
    redirect_to users_management_index_path
  end

  private
    def set_user
      @user = User.find(params[:id])
      redirect_to users_management_index(page: 1) if @user.is_an_admin?
    end

    def check_if_is_admin
      unless current_user.is_an_admin?
        redirect_to root_path, notice: "Only admins can manage users' data."
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :phone, :emergency_contact,
                                   :role_id, :image, :password, :password_confirmation)
    end

    def filtering_params(params)
      params.slice(:users_ids, :name, :email, :phone, :emergency_contact, :roles_ids)
    end
end
