class TournamentSerializer < ActiveModel::Serializer

  attributes :id, :name, :commands_count


  def commands_count
    object.commands.count
  end
end
