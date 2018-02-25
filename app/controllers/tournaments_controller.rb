class TournamentsController < ApplicationController

  def index
    render json: Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
    render json: @tournament
  end

end
