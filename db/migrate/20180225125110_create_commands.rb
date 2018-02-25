class CreateCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.integer :tournament_id, null: false
      t.integer :user_id,       null: false

      t.string  :name, null: false, default: ''
      t.string  :logo

      t.timestamps
    end
  end
end
