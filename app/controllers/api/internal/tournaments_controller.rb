class Api::Internal::TournamentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    render json: Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
    render json: @tournament
  end

end
