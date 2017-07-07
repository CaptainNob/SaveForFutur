class AddUserInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :string, null: false, default: 'goblin-head'
  end
end
