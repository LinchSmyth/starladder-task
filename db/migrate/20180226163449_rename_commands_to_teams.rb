class RenameCommandsToTeams < ActiveRecord::Migration[5.1]
  def change
    rename_table :commands, :teams
  end
end
