class CommandsController < ApplicationController

  before_action :load_command, only: [:update, :destroy]


  def index
    @commands = Command.where(tournament_id: params[:tournament_id])
    render json: @commands
  end

  def create
    head(:unauthorized) && return unless verified_user?

    @command = Command.new(command_params) do |c|
      c.user_id = current_user.id
      c.tournament_id = params[:tournament_id]
    end

    if @command.save
      render json: @command
    else
      render json: { errors: @command.errors.full_messages }, status: 422
    end
  end

  def update
    head(:unauthorized) && return if verified_user? { |u| u.id == @command.user_id }
  end

  def destroy

  end


  private


  def command_params
    params.require(:command).permit(:logo, :name)
  end

  def verified_user?(&block)
    if current_user.present?
      block_given? ? yield(current_user) : true
    else
      false
    end
  end

  def load_command
    @command = Command.find(params[:id])
  end

end
