class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :render_layout

  def render_layout
    if request.format.symbol == :html
      render :html => '', :layout => true
      return
    end
  end

  def index

  end
end
