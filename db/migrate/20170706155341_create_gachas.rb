class CreateGachas < ActiveRecord::Migration[5.1]
  def change
    create_table :gachas do |t|
      t.string :image, null: false, default: 'app/assets/images/gacha.png'
      t.string :name, null: false, default: 'A Gacha'
      t.integer :price, null: false, default: 0
      t.boolean :kibrilles, default: false
      t.decimal :rare1, null: false, default: 90.0
      t.decimal :rare2, null: false, default: 8.0
      t.decimal :rare3, null: false, default: 2.0
      
      t.timestamps
    end
  end
end
