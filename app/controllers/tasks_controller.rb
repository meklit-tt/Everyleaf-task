class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @tasks= Task.all.order(created_at: "desc" )
  end

  def show
    #@task = Task.new(task_params)
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
  # @task.user_id = current_user.id
  end

  def edit
   @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
  #  @task.user_id = current_user.id
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
      if @task.update(task_params)
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

  def task_params
     params.require(:task).permit(:id, :tasks, :title, :detail )
  end
end
