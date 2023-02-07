class TasksController < ApplicationController
  def management
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to new_task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
