class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :autorize_admin, only:[:edit, :update, :destroy]

  def index
    @users = User.select(:id, :name, :email, :admin).order(created_at: "DESC")
  end

  def new
    @user = User.new
    if logged_in?
      redirect_to admin_users_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "new user added"
      redirect_to admin_users_path(@user.id)
    else
      flash.now[:danger]="user failed"
      render :new
    end
  end

  def show
    @tasks= Task.where(user_id: @user.id).page(params[:page]).per 3
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id), success: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if (current_user == user) && (current_user.admin?)
    flash[:error] = "You cannot delete own admin account!"
    redirect_to admin_users_path
    elsif @user.destroy
    flash[:success] = "user deleted!"
    redirect_to admin_users_path
    else
    redirect_to admin_users_path
end
end
  private

  def set_user
    @user=User.find(params[:id])
  end
  def authorize_admin
    redirect_to admin_user_path, alert: "Permissions denied" unless current_user.admin?
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
