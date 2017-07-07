class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :image, null: false, default: 'app/assets/images/MMlogo.jpg'
      t.string :name, null: false, default: 'Une carte'
      t.integer :rarity, null: false, default: 1
      t.integer :health_point, null: false, default: 1
      t.integer :attack_point, null: false, default: 1
      t.integer :move_point, null: false, default: 1
      t.integer :wood_cost, null: false, default: 1
      t.integer :iron_cost, null: false, default: 1
      t.integer :food_cost, null: false, default: 1
      t.integer :special_ability1_id
      t.integer :special_ability2_id
      t.integer :sell_price

      t.timestamps
    end
  end
end