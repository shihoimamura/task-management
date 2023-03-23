class Admin::UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :check_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 保存の成功した場合の処理
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def index
    @users = User.includes(:tasks)
  end

  def show
    @user = User.find(params[:id])
    # ユーザのタスク一覧
    @tasks = Task.where(user_id: @user.id)
  end
      # 編集画面
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path, notice: "更新しました。"
    else
      render "edit"
    end
  end
  # 削除
  def destroy
    user= User.find(params[:id])

    user.destroy
    redirect_to admin_users_path, notice: "削除しました。"
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation, :admin)
  end

  def check_admin
    if current_user.admin? == false
      redirect_to tasks_path, notice: "管理者以外はアクセスできない！"
    end
  end



end
