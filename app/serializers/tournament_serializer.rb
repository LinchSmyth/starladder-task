class TournamentSerializer < ActiveModel::Serializer

  attributes :id, :name, :commands_count


  def commands_count
    3
  end
end
