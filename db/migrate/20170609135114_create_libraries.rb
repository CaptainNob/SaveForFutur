class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries do |t|
      for i in 1..50 do
        case i
        when 1
          t.integer "card_#{i}", default: 10
        when 2, 7
          t.integer "card_#{i}", default: 6
        when 3, 4
          t.integer "card_#{i}", default: 4
        when 8
          t.integer "card_#{i}", default: 2
        when 9, 12, 14, 15
          t.integer "card_#{i}", default: 1
        else
          t.integer "card_#{i}", default: 0
        end
      end
      t.references :user, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
