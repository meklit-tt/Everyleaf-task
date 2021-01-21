class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  before_action :authenticate_user
  before_action :logged_in?
  DER=3
  def index
     
     @q = current_user.tasks.includes(:user).ransack(params[:q])
     @tasks = @q.result(distinct: true).page(params[:page]).per(DER)

  end
  def show
    if current_user.id !=@task.user_id
    flash[:notice]="Not Allowed"
    redirect_to tasks_path(session[:task_user])
    return
  end
end
  def new
    if params[:back]
      @task = Task.new(task_params)
    else
      @task = Task.new
    end
  end

  def confirm
   @task = Task.new(task_params)
   @task.user_id = current_user.id
  end

  def edit
    if current_user.id !=@task.user_id
    flash[:notice]="Not Allowed"
    redirect_to tasks_path(session[:task_user])
    return
  end
end
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
    redirect_to tasks_path
    flash[:notice] = 'task created'
    else
      render :new
    end
  end

  def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to task_path(@task.id), success: 'task was successfully updated.'
      else
        render :edit
      end
    end

  def destroy
      Task.find(params[:id]).destroy
      redirect_to tasks_path, notice: 'task was successfully destroyed.'
    end
  private
  def set_task
     @task = Task.find(params[:id])
  end
  def task_params
     params.require(:task).permit(:id, :tasks, :title, :detail, :deadline, :q,
                                  :priority, :status, :user_id, :name, :email,
                                  { label_id: [] }, :label_id)
  end
end
