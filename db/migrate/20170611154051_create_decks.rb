class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :name, default: "Default deck"
      for i in 1..50 do
        t.integer "card_#{i}", default: 0
      end
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
