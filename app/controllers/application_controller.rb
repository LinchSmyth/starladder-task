class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :render_layout
  before_action :authenticate_user!, except: [:render_layout, :index]

  def index
  end

  private

  def render_layout
    if request.format.symbol == :html
      render :html => '', :layout => true
      return
    end
  end
end
