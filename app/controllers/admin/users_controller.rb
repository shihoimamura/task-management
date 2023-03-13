class Admin::UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
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
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
      # 編集画面
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_url(@user), notice: "更新しました。"
    else
      render "edit"
    end
  end
  # 削除
  def destroy
    task = User.find(params[:id])

    user.destroy
    redirect_to users_url, notice: "削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
