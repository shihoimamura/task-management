class TasksController < ApplicationController
  def management
  end

  def index
    @tasks = Task.all
    @tasks.each do |t|
      puts t.task_name
    end

  end

  def new
    @task = Task.new
  end

  def create
    puts "-----------------"
    puts params["task"]["task_name"]
    puts "-----------------"
    # Task.create(task_params)
    Task.create(task_params)
    redirect_to new_task_path
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:task_name, :task_content)
  end
end
