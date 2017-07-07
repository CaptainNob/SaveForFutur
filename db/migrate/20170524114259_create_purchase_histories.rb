class CreatePurchaseHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_histories do |t|
      t.integer :kibrilles, null: false
      t.integer :euros, null: false
      t.references :user, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
