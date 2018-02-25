class CommandsController < ApplicationController

  def index
    @commands = Command.where(tournament_id: params[:tournament_id])
    render json: @commands
  end

end
