class CommandsController < ApplicationController

  before_action :load_command, only: [:show, :update, :destroy]


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

  def show
    render json: @command
  end

  def update
    head(:unauthorized) && return unless verified_user? { |u| u.id == @command.user_id }

    if @command.update(command_params)
      render json: @command
    else
      render json: { errors: @command.errors.full_messages }, status: 422
    end
  end

  def destroy
    head(:unauthorized) && return unless verified_user? { |u| u.id == @command.user_id }

    tournament_id = @command.tournament_id
    @command.destroy
    render json: { tournament_id: tournament_id }
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
