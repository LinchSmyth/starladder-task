class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider,         :string
    add_column :users, :uid,              :string
    add_column :users, :auth_token,       :string
    add_column :users, :refresh_token,    :string
    add_column :users, :token_expires_at, :string

    remove_index  :users, :email
    remove_column :users, :email

    add_index :users, :uid, unique: true
  end
end
