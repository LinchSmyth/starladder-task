class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :null_session
  skip_before_action :verify_authenticity_token
  before_action :render_layout
  before_action :authenticate_user!, except: [:render_layout, :index]

  def index
  end

  private

  def render_layout
    if request.format.symbol == :html
      render :html => '', :layout => true
    end
  end
end
