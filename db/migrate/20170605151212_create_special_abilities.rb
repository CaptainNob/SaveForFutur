class CreateSpecialAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :special_abilities do |t|
      t.string :name, null: false
      t.text :effect, null: false
      
      t.timestamps
    end
  end
end
