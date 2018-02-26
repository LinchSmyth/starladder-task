class TournamentSerializer < ActiveModel::Serializer

  attributes :id, :name, :teams_count


  def teams_count
    object.teams.count
  end
end
