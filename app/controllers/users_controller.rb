class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:new, :create]
  before_action :authenticate_user, only: [:show]
  
  def index
    @users = User.all.order(created_at: "DESC")
  end

  def new
    @user = User.new
    if logged_in?
      redirect_to tasks_path
    end
end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: 'User created'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), success: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to new_user_path, notice: 'User was successfully destroyed.'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end
  def require_login
     if current_user !=@user && !current_user.admin?
     flash[:alert] ="only manage yur own account"
     redirect_to tasks_path(@user.id)
   end
 end
end
