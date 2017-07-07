class CreateKibrillesPacks < ActiveRecord::Migration[5.1]
  def change
    create_table :kibrilles_packs do |t|
      t.integer :kibrilles, null: false
      t.decimal :euros, null: false
      
      t.timestamps
    end
  end
end
