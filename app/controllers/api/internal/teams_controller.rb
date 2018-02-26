class Api::Internal::TeamsController < ApplicationController

  before_action :load_team, only: [:show, :update, :destroy]


  def index
    @teams = Team.where(tournament_id: params[:tournament_id])
    render json: @teams
  end

  def create
    head(:unauthorized) && return unless verified_user?

    @team = Team.new(team_params) do |c|
      c.user_id = current_user.id
      c.tournament_id = params[:tournament_id]
    end

    if @team.save
      render json: @team
    else
      render json: { errors: @team.errors.full_messages }, status: 422
    end
  end

  def show
    render json: @team
  end

  def update
    head(:unauthorized) && return unless verified_user? { |u| u.id == @team.user_id }

    if @team.update(team_params)
      render json: @team
    else
      render json: { errors: @team.errors.full_messages }, status: 422
    end
  end

  def destroy
    head(:unauthorized) && return unless verified_user? { |u| u.id == @team.user_id }

    tournament_id = @team.tournament_id
    @team.destroy
    render json: { tournament_id: tournament_id }
  end


  private


  def team_params
    params.require(:team).permit(:logo, :name)
  end

  def verified_user?(&block)
    if current_user.present?
      block_given? ? yield(current_user) : true
    else
      false
    end
  end

  def load_team
    @team = Team.find(params[:id])
  end

end
