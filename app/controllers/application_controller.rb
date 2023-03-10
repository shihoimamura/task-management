class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required

  def top
    @tasks = Tasl.page(params[:page]).per(6).order('updated_at DESC')
  end

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

end
