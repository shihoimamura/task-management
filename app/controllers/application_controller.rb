class ApplicationController < ActionController::Base
  def top
    @tasks = Tasl.page(params[:page]).per(6).order('updated_at DESC')
  end
end
