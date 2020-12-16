class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    if params[:back]
      @task = Task.new(post_params)
    else
      @task = Task.new
    end
  end

  def confirm
    @task = Task.new(task_params)
    @task.user_id = current_user.id
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.build(task_params)
    if params[:back]
      render :new
    else
      @task.save
      flash[:notice] = 'task created'
      redirect_to tasks_path
    end
  end

  def update
      @task = Task.find(params[:id])
      if @task.update(user_params)
        redirect_to task_path(@task.id), success: 'task was successfully updated.'
      else
        render :edit
      end
    end

  def destroy
      Task.find(params[:id]).destroy
      redirect_to new_task_path, notice: 'task was successfully destroyed.'
    end

  private
  def set_task
     @task = Task.find(params[:id])
  end

  def post_params
     params.require(:task).permit(:id,:title, :detail, :tasks, :user_id, :name, :email)
  end
end
