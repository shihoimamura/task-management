class TasksController < ApplicationController
  # 一覧画面
  def index
    @tasks = current_user.tasks.order(created_at: :desc)

    if params[:sort_expired] == "true"
      @tasks = @tasks.all.order(enddate: :desc)
    end

    if params[:sort_priority] == "true"
      @tasks = @tasks.all.order(priority: :desc)
    end

    if params[:task]&&params[:task][:title].present?
      @tasks = @tasks.search_title(params[:task][:title])
    end

    if params[:task]&&params[:task][:priority].present?
      @tasks = @tasks.search_priority(params[:task][:priority])
    end

    if params[:task]&&params[:task][:status].present?
      @tasks = @tasks.search_status(params[:task][:status])
    end

    if params[:task] && params[:task][:label_id].present?
      @tasks = Label.search_label(params[:task][:label_id])
    end


    @tasks = @tasks.page(params[:page]).per(5)


  end

  # 詳細画面
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to task_url(@task), notice: "登録しました。"
    else
      render "new"
    end
  end

  # 編集画面
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to task_url(@task), notice: "更新しました。"
    else
      render "edit"
    end
  end

  # 削除
  def destroy
    task = Task.find(params[:id])

    task.destroy
    redirect_to tasks_url, notice: "削除しました。"
  end

  def confirm
    @task = current_user.tasks.build(task_params)
    render :new if @task.invalid?
  end

  private

  # Strong Parameters
  def task_params
    params.require(:task).permit(:title, :content, :enddate, :status, :priority, { label_ids: [] })
  end
end
