class ApplicationController < ActionController::Base

  protect_from_forgery prepend: true, with: :null_session
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:app, :index]


  def app
    render :html => '', :layout => true
  end

end
