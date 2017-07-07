class Deck < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 25 }
  for i in 1..50 do
    validates "card_#{i}",
      numericality: { 
        only_integer: true,
        greater_than_or_equal_to: 0
      },
      allow_blank: true
  end
end
